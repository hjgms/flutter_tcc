//configs
import 'dart:convert';

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
Map typedReturn(bool ok, var args) {
  if (!ok) {
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
Future<Map> loginUser(String email, String password) async {
  try {
    await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      bool resp = await cache.setCacheUserAuth(true, value.user!.uid);
      if (!resp) {
        // error
      }
      global.user["nameDisplay"] = value.user!.displayName ?? "";
    });
  } catch (e) {
    return typedReturn(false, e);
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

//publication
Future<Map> getPublication(bool add) async {
  if (global.publicationsFeed.isNotEmpty && add == false) {
    return typedReturn(true, {});
  }

  return await dataBase
    .collection("publications")
    .limit(5)
    .get()
    .then((value) async {
    Map resp = typedReturn(true, {});
    var c = 0;

    for (var element in value.docs) {
      String uid = element.data()["userUid"].toString().trim();
      var name = "";
      var exists = global.publicationsFeed.forEach((test) { 
        test["uid"] == element.id
      });

      if (exists.isNotEmpty) {

      } else {
        Map namedUser = await dataBase
        .collection("users")
        .doc(uid)
        .get()
        .then((value) {  
          name = value.data()?["name"];
          return typedReturn(true, {});
        }).catchError((e) {
          return typedReturn(false, "2 : $e");
        });

        var image = await getPhotoPublication(element.id);
        print(image);
        image["args"] ??= "";

        if (namedUser["ok"] == true) {
          global.publicationsFeed.add({
            "obj": element.data(),
            "uid": element.id,
            "nameProvider": name,
            "image": "${image['args']}"
          });
        } else {
          resp = typedReturn(false, namedUser["args"]);
          break;
        }
      }

      c++;
    }

    return resp;
  }).catchError((e) {
    return typedReturn(false, "1 : $e");
  });
}

//profile
Future<Map> getPhotoPerfil(String uid) async {
  var photoCache = await cache.getCacheUserPhoto();
  if (photoCache != null) {
    return typedReturn(true, photoCache);
  }
  try {
    String url = "/photoperfil/$uid/photo1.jpg";
    String photo = await FirebaseStorage.instance
      .ref()
      .child(url)
      .getDownloadURL();

    if (photo != "") {
      bool resp = await cache.setCacheUserPhoto(photo);
      if (resp) {
        //for photo download and save device
      }
      return typedReturn(true, photo);
    }

    return typedReturn(false, "photo is null returned !");
  } on FirebaseException catch (e) {
    return typedReturn(false, e);
  }
}

Future<Map> getPhotoPublication(String uid) async {
  try {
    String url = "/publications/$uid/1.jpg";
    String photo = await FirebaseStorage.instance
      .ref()
      .child(url)
      .getDownloadURL();

    if (photo != "") {
      return typedReturn(true, photo);
    }

    return typedReturn(false, "photo is null returned !");
  } on FirebaseException catch (e) {
    return typedReturn(false, "photo: $e");
  }
}

// Future<Map> addChangesPerfil(String uid, Map<String,dynamic> obj) async {
//   try{
//     await dataBase.collection("users")
//     .doc(uid)
//     .update(obj);

//     return typedReturn(true, {});
//   }catch(e){
//     return typedReturn(false, e);
//   }

//   /* ********

//   exemplo de uso:

//   uid = string // id do usuário que está logado, no caso que fica no global.user["uid"]

//   obj = {
//     "name":""
//     "lastname":"",
//     "description":"com o texto já formatado a quebra de linhas"
//     "localization":" com a ciade já formatada com padrão:
//       'NomeCidadeFormatadoEmCamelCase - EstadoCidadeFormatadoEmUpperCase'
//     "
//   }

//   retorno:

//   Map<String,Dynamic> = {
//     "ok": true ou false, // teste pra sucesso ou erro, caso erro ele faz print automático
//     "args": {} ou error // caso sucesso ele só retorna {}, caso erro ele retorna o erro fornecido do catch
//   }

//   ******** */
// }

// Future<String> getNameProviderPublications(String uid) async {
//   Map namedUser = await dataBase
//   .collection("users")
//   .doc(uid)
//   .get()
//   .then((value) {
//     final name = value.data()?["name"] == null ? "" : value.data()?["name"] as String;
//     return typedReturn(true, name);
//   }).catchError((e) {
//     return typedReturn(false, "2 : $e");
//   });
//   return namedUser["ok"] ? namedUser["args"] : "";
// }

// Future<String> getImagePublications({String uid = "", int number = 1}) async {
//   String url = "/publications/$uid/$number.jpg";
//   Map imagePublication = await firebaseStorage
//   .child(url)
//   .getDownloadURL()
//   .then((value){
//     return typedReturn(true, value);
//   }).catchError((e){
//     return typedReturn(false, "3 : $e");
//   });
//   return imagePublication["ok"] ? imagePublication["args"] : "";
// }

// Future<Map> getPublicatiosHome({int limit = 0, bool add = false, bool write = false}) async {
//   return await dataBase
//   .collection("")
//   .limit(limit)
//   .get()
//   .then((value) async {
//     if (!add) global.publicationsFeed = null;

//     int count = 0;
//     value.docs.forEach((element) async {
//       final publi = global.publicationsFeed![count];

//       if (element.id != publi["uid"]) {

//         //get name userProvider
//         String nameProvider = await getNameProviderPublications(element.data()["userUid"]);

//         // for(var imgNumber=1; imgNumber <= element.data()["images"]; imgNumber++){
//         //futuramente caso tenha mais imagens
//         // }

//         //get image publication
//         String imageProvider = await getImagePublications(uid: element.id, number: 1);

//         global.publicationsFeed!.add(
//           {
//             "obj": element.data(),
//             "uid": element.id,
//             "nameProvider": nameProvider,
//             "image": imageProvider
//           }
//         );
//       }
//       count ++;
//     });

//     bool resp = await cache.setCacheHomePublications(json.encode(global.publicationsFeed!));

//     if(!resp){}

//     return  typedReturn(true, {});
//   }).catchError((e) {
//     return  typedReturn(false, "1 : $e");
//   });
// }