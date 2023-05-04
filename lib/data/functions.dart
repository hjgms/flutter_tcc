import 'dart:html';

import 'package:flutter/material.dart';

//configs
import 'package:flutter_application_firebase/globals/variables.dart' as global;

//firebase
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


//instances firebase
FirebaseFirestore dataBase = FirebaseFirestore.instance;
FirebaseAuth firebaseAuth = FirebaseAuth.instance;

//create account for new user
Future<Map> createLoginUser( String email, String password) async {
  await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)
    .then((value){
      if(value.user!.emailVerified){
        if(value.user!.uid != ""){
          return {
            "ok":true,
            "args": {
              "uid": value.user!.uid,
              "number": value.user!.phoneNumber
            }
          };
        }
      }
    }).onError((error, stackTrace){
      return {
        "ok":false,
        "args": error!
      };
    });
  return {
    "ok":false,
    "args": {}
  };
}

Future<Map> createUser(String uid) async {
  try{
    await dataBase.collection("users").doc(uid).set(
      {
        //values new user
      }
    );
  }catch(e){
    return {
      "ok":false,
      "args": e
    };
  }

  try{
    await dataBase.collection("users").doc(uid).get().then((value){
      if(value.exists){
        return {
          "ok":true,
          "args": {}
        };
      }
    });
  }catch(e){
    return {
      "ok":false,
      "args": e
    };
  }

  return {
    "ok":false,
    "args": {}
  };
}

Future<Map> combinationAuthCreate() async {
  String email = "";
  String password = "";
  
  var userAuth = await createLoginUser(email,password);
  if(userAuth["ok"] && userAuth["args"]["uid"] != ""){
    var response = await createUser(userAuth["args"]["uid"]);
    if(response["ok"]){
      var authPass = await combinationAuth(email,password);
      if(authPass["ok"]){
        return {
          "ok":true,
          "agrs":{}
        };
      }else{
        return {
          "ok":false,
          "args":authPass["args"]
        };
      }
    }else{
      return {
        "ok":false,
        "args":response["args"]
      };
    }
  }else{
    return {
      "ok":false,
      "agrs":{
        "auth":userAuth["args"]
      }
    };
  }
}

//test for login user
Future<Map> loginUser(String email, String password) async {
  try{
    await firebaseAuth.signInWithEmailAndPassword(email: email, password: password)
    .then((value){
      global.user["auth"] = true;
      global.user["uid"] = value.user!.uid != null? value.user!.uid : "";
      global.user["nameDisplay"] = value.user!.displayName != null? value.user!.displayName : "";
    });
  }catch(e){
    print(e);
    return {
      "ok":false,
      "args":e
    };
  }
  return {
    "ok":true,
    "args":{}
  };
  
}

Future<Map> getUser(String uid) async {
  try{
    await dataBase.collection("users")
    .doc(uid)
    .get()
    .then((value){
      global.user["obj"] = value.data();
    });
  }catch(e){
    return {
      "ok":false,
      "args":e
    };
  }
  return {
    "ok":true,
    "args":{}
  };
}

Future<Map> combinationAuth(String email, String password) async {

  var autentication = await loginUser(email, password);
  
  if(autentication["ok"]){
    var response = await getUser(global.user["uid"]);
    if(response["ok"]){
      return {
        "ok": true,
        "args":{}
      };
    }else{
      return {
        "ok":false,
        "args": response["args"]
      };
    }
  }else{
    return {
      "ok":false,
      "args": autentication["args"]
    };
  }
}

//sign out user
Future signoutUser() async{
  await firebaseAuth.signOut();
  global.user["auth"] = false;
}

//publication
Future<Map> getPublication(String uid) async {
  return await dataBase.collection("publications")
  .limit(10)
  .get()
  .then((value){
    var c = 0;
    for (var element in value.docs) {
      if(global.publicationsFeed.length > 0){
        if(global.publicationsFeed[c]["uid"] != element.id){
          global.publicationsFeed.add(
            {
              "obj": element.data(),
              "uid": element.id
            }
          );
        }
      }else{
        global.publicationsFeed.add(
          {
            "obj": element.data(),
            "uid": element.id
          }
        );
      }
      
      c++;
    }
    return {
      "ok":true,
      "args":{}
    };
  }).catchError((e){
    print(e);
    return {
      "ok":false,
      "args":e
    };
  });
}
