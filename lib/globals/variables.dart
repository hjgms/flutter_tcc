import 'package:flutter/material.dart';

bool logado = false;
int pageIndex = 0;
// Map user = {"auth": false, "uid": ""};
// descomentar para uso sem login, e comentar o a cima
Map user = {"auth": true, "uid": "EvdXTmOnGeNPyIadnIgpplgfR4A2"}; 

String storage = 'gs://lithe-strata-348418.appspot.com/';

List publicationsFeed = [];

Map<String, Color> colorTheme = {
  "color1": const Color.fromARGB(255, 86, 22, 236),
  "color2": const Color.fromARGB(255, 107, 55, 230),
  "color3": const Color(0xFFE0E0E0),
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
        fontSize: 16, fontWeight: FontWeight.w600, height: 2);
  }

}

var styles = ClassStyles();
