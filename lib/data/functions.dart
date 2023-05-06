import 'dart:convert';

import 'package:flutter/material.dart';

//configs
import 'package:flutter_application_firebase/globals/variables.dart' as global;

//firebase
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

//instances firebase
FirebaseFirestore dataBase = FirebaseFirestore.instance;
FirebaseAuth firebaseAuth = FirebaseAuth.instance;
Reference firebaseStorage = FirebaseStorage.instance.ref();

//returns
Map typedReturn(bool ok,var args){
  if(!ok){
    // ignore: avoid_print
    print(args);
  }
  return {
    "ok": ok,
    "args": args
  };
}

//create account for new user
Future<Map> createLoginUser( String email, String password) async {

  Map resp = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)
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
    return typedReturn(true, {});
  }).catchError( (e) {
    return typedReturn(false, e);
  });
  
  return typedReturn(resp["ok"], resp["args"]);
}

Future<Map> createUser(String uid) async {
  try{
    await dataBase.collection("users").doc(uid).set(
      {
        //values new user
      }
    );
  }catch(e){
    return typedReturn(false, e);
  }

  try{
    await dataBase.collection("users").doc(uid).get().then((value){
      if(value.exists){
        return typedReturn(true, {});
      }
    });
  }catch(e){
    return typedReturn(false, e);
  }

  return typedReturn(false, {});
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
        return typedReturn(true, {});
      }else{
        return typedReturn(false, authPass["args"]);
      }
    }else{
      return typedReturn(false, response["args"]);
    }
  }else{
    return typedReturn(false, userAuth["args"]);
  }
}

//test for login user
Future<Map> loginUser(String email, String password) async {
  try{
    await firebaseAuth.signInWithEmailAndPassword(email: email, password: password)
    .then((value){
      global.user["auth"] = true;
      global.user["uid"] = value.user!.uid;
      global.user["nameDisplay"] = value.user!.displayName ?? "";
    });
  }catch(e){
    return typedReturn(false, e);
  }
  return typedReturn(true, {});
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
    return typedReturn(false, e);
  }
  return typedReturn(true, {});
}

Future<Map> combinationAuth(String email, String password) async {

  var autentication = await loginUser(email, password);
  
  if(autentication["ok"]){
    var response = await getUser(global.user["uid"]);
    if(response["ok"]){
      return typedReturn( true, {});
    }else{
      return typedReturn( false, response["args"]);
    }
  }else{
    return typedReturn( false, autentication["args"] );
  }
}

//sign out user
Future signoutUser() async{
  await firebaseAuth.signOut();
  global.user["auth"] = false;
}

//publication
Future<Map> getPublication(bool add) async {

  if (global.publicationsFeed.isNotEmpty && add == false) {
    return typedReturn(true, {});
  }

  return await dataBase.collection("publications")
  .limit(5)
  .get()
  .then( (value) async {
    Map resp = typedReturn(true, {});
    var c = 0;

    for ( var element in value.docs) {

      String uid = element.data()["userUid"].toString().trim();
      var name = "";
      var exists = global.publicationsFeed.where((publi) => publi["uid"] == element.id);
      
      if(exists.isNotEmpty){
        continue;
      }

      Map namedUser = await dataBase.collection("users")
      .doc(uid)
      .get()
      .then( (value) {
        name = value.data()?["name"]; 
        return typedReturn(true, {});
      })
      .catchError( (e) {
        return typedReturn(false, "2 : $e");
      });

      if (namedUser["ok"] == true) {
        global.publicationsFeed.add(
          {
            "obj": element.data(),
            "uid": element.id,
            "nameProvider": name
          }
        );
      } else {
        resp = typedReturn(false, namedUser["args"]);
        break;
      }

      c++;
    }
    
    return resp;
  }).catchError( (e) {
    return typedReturn(false, "1 : $e");
  });
}

//profile
Future<Map> getPhotoPerfil(String uid) async {
  try{
    String url = "/photoperfil/$uid/photo1.jpg";
    var photo = await FirebaseStorage.instance
    .ref()
    .child(url)
    .getData();

    if(photo != null){
      return typedReturn(true, photo);
    }

    return typedReturn(false, "photo is null returned !");
  }on FirebaseException catch (e) {
    return typedReturn(false, e);
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