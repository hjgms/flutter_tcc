import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/global/variables.dart' as global;

bool logado = false;
int pageIndex = 0;
Map user = {"auth": false, "uid":""};
// descomentar para uso sem login, e comentar o a cima
// Map user = {"auth": true, "uid": "EvdXTmOnGeNPyIadnIgpplgfR4A2"};

String storage = 'gs://lithe-strata-348418.appspot.com/';

List publicationsFeed = [];
List notificationList = [];
List searchUsersList = [];

Map<String, Color> colorTheme = {
  "mainPurple": const Color.fromARGB(255, 86, 22, 236),
  "clearMainPurple": const Color.fromARGB(255, 107, 55, 230),
  "watergreen": const Color(0xff17C3B2),
  "color4": const Color(0xFFEEEEEE),
  "color5": const Color(0xFFFFFFFF),
};

class ClassStyles {
  TextStyle listaEstilosMusicaisStyle() {
    return const TextStyle(
        fontSize: 16, fontWeight: FontWeight.w400, height: 1.8);
  }

  TextStyle titulo() {
    return const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  }

  TextStyle labelText() {
    return const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  }

  EdgeInsetsDirectional espacamentoInputs() {
    return const EdgeInsetsDirectional.only(top: 6, bottom: 10);
  }

  InputDecoration inputTextFieldDecoration({String hintText = ""}) {
    return InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(
                width: 2, color: global.colorTheme["watergreen"] as Color)),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(width: 1, color: Color(0xff515151))),
        contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6))),
        hintText: hintText);
  }

  TextStyle defaultinputTextStyle() {
    return const TextStyle(fontSize: 14, color: Color(0xff515151));
  }
}

var styles = ClassStyles();
