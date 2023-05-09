
//preferences
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

//instance storage
Future<SharedPreferences> init() async {
  return await SharedPreferences.getInstance();
}

Future getCacheUserUid() async {
  final storage = await init();
  String? memory = storage.getString("uid");
  memory ??= "";
  return memory;
}

Future getCacheUserAuth() async {
  final storage = await init();
  var memory = storage.getBool("auth");
  if (memory == null) {
    storage.setBool("auth", false);
    memory = false;
  }
  return memory;
}

Future setCacheUserAuth(bool auth, String uid) async{
  final storage = await init();
  bool? status;
  status = await storage.setBool("auth", auth);
  if (status) {
    status = null;
    status = await storage.setString("uid", uid);
    return status ? true : false;
  }
  return false;
}

Future<bool> setCacheUserData(String uid, Map data) async {
  final storage = await init();
  final valor = json.encode(data).toString();
  bool? status = await storage.setString("userData", valor);
  return status ? true : false;
}

Future getCacheUserData() async {
  final storage = await init();
  String? value = storage.getString("userData");
  final resp = json.decode(value!);
  return resp;
}