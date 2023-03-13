import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
    if (e.code == 'user-not-found') {
      print("error");
    } else if (e.code == 'wrong-password') {
      print("error");
    }
    result = e.code;
  }
  return result;
}
//sign out user
signoutAcount() async{
  await FirebaseAuth.instance.signOut();
}
