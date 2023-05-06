import 'package:flutter/material.dart';

bool logado = false;
int pageIndex = 0;
Map user = {"auth": true, "uid": "EvdXTmOnGeNPyIadnIgpplgfR4A2"};
String storage = 'gs://lithe-strata-348418.appspot.com/';

List publicationsFeed = [];

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
    return const TextStyle(
        fontSize: 16, fontWeight: FontWeight.w600);
  }

  EdgeInsetsDirectional espacamentoInputs() {
    return const EdgeInsetsDirectional.only(top: 6, bottom: 10);
  }
}

var styles = ClassStyles();
