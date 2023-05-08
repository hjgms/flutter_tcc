
//preferences
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

//models
import 'package:flutter_application_firebase/data/cache/models/user.dart' as user;

//instance storage
Future<SharedPreferences> init() async {
  return await SharedPreferences.getInstance();
}


Future getCacheStorage(String key) async {
  final storage = await init();
  var memory = storage.getBool(key);
  return memory;
}

Future<bool> setCacheStorage(String key, dynamic value) async {
  final storage = await init();
  String result = "sucess";
  switch ( value ) {
    case bool:
      storage.setBool(key, value);
      break;
    case String:
      storage.setString(key, value);
      break;
    case int:
      storage.setInt(key, value);
      break;
    case double:
      storage.setDouble(key, value);
      break;
    default:
      result = 'error';
  }
  return result == "error" ? false : true;
}

Future setCacheUserAuth(bool auth, String uid) async{
  setCacheStorage("auth", auth);
  setCacheStorage("uid", uid);
}

Future setUser(Map args) async {  
  user.model = args['uid'];
  user.model = args['obj'];
  String strObj = json.encode(user.model).toString();
  setCacheStorage("userJson", strObj);
}

Future getUser() async {
  var storage = await init();
  String? obj = storage.getString("userJson");
  return json.decode(obj!);
}