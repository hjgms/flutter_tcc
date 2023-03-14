import 'dart:html';

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
  var result;
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
    print(e.code);
    if (e.code == 'invalid-email') {
      return "invalid-email";
    } else if (e.code == 'wrong-password') {
      return "wrong-password";
    }
    result = e.code;
  }
  return result;
}
//sign out user
signoutAcount() async{
  await FirebaseAuth.instance.signOut();
}
