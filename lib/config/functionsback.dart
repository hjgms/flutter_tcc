import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_firebase/config/globalvariables.dart' as global;

//create acout for new user
createAcount(emailAddress,password) async{
  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    print("error");
  } catch (e) {
    print("error");
  }
}
//test for login user
loginAcount(TextEditingController emailAddress,TextEditingController password) async{
  String? result;
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailAddress.text,
      password: password.text
    );
    global.authentication = true;
    global.credentialUser = {
      "login": true,
      "user": credential.user,
      "info": credential.additionalUserInfo
    };
    result = "sucess";
  } on FirebaseAuthException catch (e) {
    if (e.code == 'invalid-email') {
      return e.code;
    } else if (e.code == 'wrong-password') {
      return e.code;
    }
  }
  return result;
}
//sign out user
signoutAcount() async{
  await FirebaseAuth.instance.signOut();
}

getUser() async {
  await FirebaseFirestore.instance.collection("user")
    .doc(global.credentialUser["user"].uid)
    .get()
    .then((value){
      global.user["name"] = value["nome"];
      global.user["lastname"] = value["sobrenome"];
      global.user["perfilimageurl"] = value["fotoperfil"];
      return "sucess";
    }).catchError((err){
      print(err);
      return err; 
    });
}