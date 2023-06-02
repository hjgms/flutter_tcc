//global
import 'package:flutter_application_firebase/global/variables.dart' as global;

//cache
import 'package:flutter_application_firebase/data/cache/cache.dart' as cache;

//firebase
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

//instances firebase
FirebaseFirestore dataBase = FirebaseFirestore.instance;
FirebaseAuth firebaseAuth = FirebaseAuth.instance;
Reference firebaseStorage = FirebaseStorage.instance.ref();

//returns
Map typedReturn(bool ok, var args, {bool printDebug = true}) {
  if (!ok && printDebug) {
    // ignore: avoid_print
    print(args);
  }
  return {"ok": ok, "args": args};
}

//create account for new user
Future<Map> createLoginUser(String email, String password) async {
  Map resp = await firebaseAuth
      .createUserWithEmailAndPassword(email: email, password: password)
      .then((value) {
    if (value.user!.emailVerified) {
      if (value.user!.uid != "") {
        return {
          "ok": true,
          "args": {"uid": value.user!.uid, "number": value.user!.phoneNumber}
        };
      }
    }
    return typedReturn(true, {});
  }).catchError((e) {
    return typedReturn(false, e);
  });

  return typedReturn(resp["ok"], resp["args"]);
}

Future<Map> createUser(String uid) async {
  try {
    await dataBase.collection("users").doc(uid).set({
      //values new user
    });
  } catch (e) {
    return typedReturn(false, e);
  }

  try {
    await dataBase.collection("users").doc(uid).get().then((value) {
      if (value.exists) {
        return typedReturn(true, {});
      }
    });
  } catch (e) {
    return typedReturn(false, e);
  }

  return typedReturn(false, {});
}

Future<Map> combinationAuthCreate() async {
  String email = "";
  String password = "";

  var userAuth = await createLoginUser(email, password);
  if (userAuth["ok"] && userAuth["args"]["uid"] != "") {
    var response = await createUser(userAuth["args"]["uid"]);
    if (response["ok"]) {
      var authPass = await combinationAuth(email, password);
      if (authPass["ok"]) {
        return typedReturn(true, {});
      } else {
        return typedReturn(false, authPass["args"]);
      }
    } else {
      return typedReturn(false, response["args"]);
    }
  } else {
    return typedReturn(false, userAuth["args"]);
  }
}

//test for login user
Future getUid() async {
  var resp = await cache.getCacheUserUid();
  if (resp != "" || resp != null) {
    return await getUser(resp);
  }
  return typedReturn(false, {});
}

Future<Map> loginUser(String email, String password) async {
  try {
    await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      bool resp =
          await cache.setCacheUserAuth(true, value.user!.uid.toString());
      if (resp == false) {
        // error
      }
    });
  } catch (e) {
    return typedReturn(false, "1: $e");
  }
  return typedReturn(true, {});
}

Future<Map> getUser(String uid) async {
  try {
    await dataBase.collection("users").doc(uid).get().then((value) {
      global.user["obj"] = value.data();
    });
  } catch (e) {
    return typedReturn(false, e);
  }
  return typedReturn(true, {});
}

Future<Map> combinationAuth(String email, String password) async {
  var autentication = await loginUser(email, password);

  if (autentication["ok"]) {
    var uid = await cache.getCacheUserUid();
    var response = await getUser(uid);
    if (response["ok"]) {
      return typedReturn(true, {});
    } else {
      return typedReturn(false, response["args"]);
    }
  } else {
    return typedReturn(false, autentication["args"]);
  }
}

//sign out user
Future signoutUser() async {
  await firebaseAuth.signOut();
  cache.setCacheUserAuth(false, "");
}

//profile
Future<Map> getPhotoPerfil(String uid, {bool notSave = true}) async {
  if (notSave) {
    var photoCache = await cache.getCacheUserPhoto();
    if (photoCache != null) {
      print("wdwdw");
      return typedReturn(true, photoCache);
    }
  }

  try {
    String url = "/photoperfil/$uid/photo1.jpg";
    String photo =
        await FirebaseStorage.instance.ref().child(url).getDownloadURL();

    if (photo != "") {
      print("wdwdw");
      if (notSave) {
        bool resp = await cache.setCacheUserPhoto(photo);
        if (resp) {
          //for photo download and save device
          print("jojoj");
        } else {
          print("wdwdwd");
        }
      }

      return typedReturn(true, photo);
    }
    print("wdwdw");
    return typedReturn(false, "photo is null returned !");
  } on FirebaseException catch (e) {
    return typedReturn(false, "topawdwd: $e");
  }
}

Future<Map> getPhotoPublication(String uid) async {
  try {
    String url = "/publications/$uid/1.jpg";
    String photo =
        await FirebaseStorage.instance.ref().child(url).getDownloadURL();

    if (photo != "") {
      return typedReturn(true, photo);
    }

    return typedReturn(false, "photo is null returned !");
  } on FirebaseException catch (e) {
    return typedReturn(false, "photo: $e");
  }
}

//publication

Future<String> getNameProviderPublications(String uid) async {
  Map namedUser =
      await dataBase.collection("users").doc(uid).get().then((value) {
    final name =
        value.data()?["name"] == null ? "" : value.data()?["name"] as String;
    return typedReturn(true, name);
  }).catchError((e) {
    return typedReturn(false, "2 : $e");
  });
  return namedUser["ok"] ? namedUser["args"] : "";
}

Future<String> getImagePublications({String uid = "", int number = 1}) async {
  String url = "/publications/$uid/$number.jpg";
  Map imagePublication =
      await firebaseStorage.child(url).getDownloadURL().then((value) {
    return typedReturn(true, value);
  }).catchError((e) {
    return typedReturn(false, "3 : $e");
  });
  return imagePublication["ok"] ? imagePublication["args"] : "";
}

Future clearPublicationsCache() async {
  await cache.setCacheHomePublications([]);
}

Future<Map> getPublicatiosHome(
    {int limit = 0,
    bool add = false,
    bool write = false,
    bool scrolled = false}) async {
  return await dataBase
      .collection("publications")
      .limit(limit)
      .get()
      .then((value) async {
    List cacheList = await cache.getCacheHomePublications();

    if (cacheList.isNotEmpty && scrolled == false) {
      global.publicationsFeed = cacheList;
      return typedReturn(true, {});
    }

    if (add == false) {
      global.publicationsFeed = [];
    }

    for (var i = 0; i < value.docs.length; i++) {
      var element = value.docs[i];

      String nameProvider = "";
      if (element.data()["userUid"].trim() != "") {
        nameProvider =
            await getNameProviderPublications(element.data()["userUid"].trim());
      }

      String imageProvider = "";
      if (element.data()["images"] > 0) {
        imageProvider = await getImagePublications(uid: element.id, number: 1);
      }

      if (global.publicationsFeed.isNotEmpty) {
        bool notExist = global.publicationsFeed
            .where((values) => element.id == values["uid"])
            .isEmpty;

        if (notExist) {
          global.publicationsFeed.add({
            "obj": element.data(),
            "uid": element.id,
            "nameProvider": nameProvider,
            "image": imageProvider
          });
        }
      } else {
        global.publicationsFeed.add({
          "obj": element.data(),
          "uid": element.id,
          "nameProvider": nameProvider,
          "image": imageProvider
        });
      }
    }

    if (write) {
      bool resp = await cache.setCacheHomePublications(global.publicationsFeed);
      if (!resp) {
        return typedReturn(false, "4 : not saved");
      }
    }

    return typedReturn(true, {});
  }).catchError((e) {
    return typedReturn(false, "1 : $e");
  });
}

Future<Map> searchAnouterUsers(String text) async {
  global.searchUsersList.clear();

  Map resp = await dataBase.collection("users").get().then((value) async {
    var users = value.docs.where((element) => element
        .data()['name']
        .toString()
        .toUpperCase()
        .contains(text.toUpperCase()));

    if (users.isNotEmpty) {
      users.forEach((element) async {
        // String imageProvider = "";
        // Map resp = await getPhotoPerfilSearchUser(element.id);

        // if(resp["ok"]){
        //   imageProvider = resp["args"];
        // }

        global.searchUsersList.add({
          "nameUser": element.data()["name"],
          "description": element.data()["description"],
          "lastname": element.data()["lastname"],
          "uidUser": element.id
        });
      });
    }

    return typedReturn(true, {});
  }).catchError((e) {
    return typedReturn(false, "1 : $e");
  });

  return typedReturn(resp["ok"], resp["args"]);
}
