
//preferences
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

//instance storage
Future<SharedPreferences> init() async {
  return await SharedPreferences.getInstance();
}

//uid user
Future getCacheUserUid() async {
  final storage = await init();
  String? memory = storage.getString("uid");
  memory ??= "";
  return memory;
}

Future<bool> setCacheUserUid(String uid) async {
  final storage = await init();
  bool? status = await storage.setString("uid", uid);
  return status ? true : false;
}

//auth user
Future getCacheUserAuth() async {
  final storage = await init();
  var memory = storage.getBool("auth");
  if (memory == null) {
    storage.setBool("auth", false);
    memory = false;
  }
  return memory;
}

Future<bool> setCacheUserAuth(bool auth, String uid) async{
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

//data user
Future getCacheUserData() async {
  final storage = await init();
  String? value = storage.getString("userData");
  final resp = json.decode(value!);
  return resp;
}

Future<bool> setCacheUserData(String uid, Map data) async {
  final storage = await init();
  final valor = json.encode(data).toString();
  bool? status = await storage.setString("userData", valor);
  return status ? true : false;
}

//photo user
Future getCacheUserPhoto() async {
  final storage = await init();
  String? resp = storage.getString("userPhoto");
  return resp;
}

Future<bool> setCacheUserPhoto(String photo) async {
  final storage = await init();
  bool? status = await storage.setString("userPhoto", photo);
  return status ? true : false;
}

//publications
Future getCacheHomePublications() async {
  final storage = await init();
  String? resp = storage.getString("publiHome");
  return json.decode(resp ?? "[]");
}

Future<bool> setCacheHomePublications(List publi) async {
  final storage = await init();
  bool? status = await storage.setString("publiHome", json.encode(publi));
  return status ? true : false;
}