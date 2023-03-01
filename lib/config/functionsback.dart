import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


usuariosGet(TextEditingController email,TextEditingController password, errorTextEmail, errorTextPassword) async{
  CollectionReference users = FirebaseFirestore.instance.collection('usuarios');
  var limit = 30;
  var credentials = {
    "email": email.text,
    "password": password.text,
    "pass": false
  };
  for (var i = 0; i < limit; i++) {
    await users.doc("$i").get().then( (value) =>{ 
      if(value["credentials"]["email"] == credentials["email"]){
        if(value["credentials"]["password"] == credentials["password"]){
          credentials["pass"] = true
        }else{
          errorTextPassword = "Password error"
        }
      }else{
        errorTextEmail = "Email error"
      }
    }); 
    if(credentials["pass"] == true){
      return true;
    }
  }
  return false;
}