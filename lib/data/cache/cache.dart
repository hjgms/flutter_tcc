
//preferences
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

//models
import 'package:flutter_application_firebase/data/cache/models/user.dart' as user;

//instance storage
Future<SharedPreferences> init() async {
  return await SharedPreferences.getInstance();
}

Future getCacheUserUid() async {
  final storage = await init();
  var memory = storage.getString("uid");
  if(memory == null){
    memory = "";
  }
  return memory;
}

Future getCacheUserAuth() async {
  final storage = await init();
  var memory = storage.getBool("auth");
  if(memory == null){
    storage.setBool("auth", false);
    memory = false;
  }
  return memory;
}

Future setCacheUserAuth(bool auth, String uid) async{
  final storage = await init();
  storage.setBool("auth", auth);
  storage.setString("uid", uid);
}
