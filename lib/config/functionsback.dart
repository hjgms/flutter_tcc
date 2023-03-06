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
    await users.doc("$i").get().then( (value){ 
      if(value["credentials"]["email"] == credentials["email"]){
        if(value["credentials"]["password"] == credentials["password"]){
          credentials["pass"] = true;
        }else{
          errorTextPassword = "Password error";
        }
      }else{
        errorTextEmail = "Email error";
      }
    }); 
    if(credentials["pass"] == true){
      return true;
    }
  }
  return false;
}

//para testes ainda ....
//get - global
getdb(String? collection,String id) async{
	var ID = "";
	var from;
	try{
		ID = Number(id);
	}catch{}
	if(ID == ""){
		from = FirebaseFirestore.instance.collection("${collection}").doc();	
	}else{
		from = FirebaseFirestore.instance.collection("${collection}").doc("${ID}");
	}
	await from.get().then((data){
		return data.json();
	}).catch((err){
		print(err);
		return false;
	});
}
//post - global
postdb(String? collection,String id,Map obj){
	var ID = "";
	var from;
	try{
		ID = Number(id);
	}catch{}
	if(ID == ""){
		from = FirebaseFirestore.instance.collection("${collection}").doc();	
	}else{
		from = FirebaseFirestore.instance.collection("${collection}").doc("${ID}");
	}
	from.add(obj).then((){
		return true;
	}).catch((err){
		print(err);
		return false;
	});
}
