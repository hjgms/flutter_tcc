import 'package:flutter/material.dart';

//configs
import 'package:flutter_application_firebase/config/globalvariables.dart' as global;

//firebase
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//instances firebase
FirebaseFirestore dataBase = FirebaseFirestore.instance;
FirebaseAuth firebaseAuth = FirebaseAuth.instance;

//create account for new user
createAccount(emailAddress,password) async{
  String? result;
  try {
    final credential = await firebaseAuth.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );

    if(credential.user != null){
      result = "sucess";
    }
  } on FirebaseAuthException catch (e) {
    result = e.code;
  }
  return result;
}

//test for login user
loginAccount(TextEditingController emailAddress,TextEditingController password) async{
  String? result;
  try {
    final credential = await firebaseAuth.signInWithEmailAndPassword(
      email: emailAddress.text,
      password: password.text
    );

    global.credentialUser = {
      "authentication": true,
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
signoutAccount() async{
  await firebaseAuth.signOut();
}

getUser(uid) async{
  try{
    await dataBase.collection("users").doc(uid).get().then((value){
      final resp = value.data();
      
      global.user = {
        "name": resp?["name"],
        "lastname": resp?["lastname"]
      };  
    });
    return "sucess";
  }catch(e){
    return e;
  }
}