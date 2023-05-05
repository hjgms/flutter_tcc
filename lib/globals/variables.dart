import 'package:flutter/material.dart';

bool logado = false;
int pageIndex = 0;
Map user = {"auth": true, "uid": "EvdXTmOnGeNPyIadnIgpplgfR4A2"};

List publicationsFeed = [];

Map<String, Color> colorTheme = {
  "color1": Color.fromARGB(255, 86, 22, 236),
  "color2": Color.fromARGB(255, 107, 55, 230),
  "color3": Color(0xFFE0E0E0),
  "color4": Color(0xFFEEEEEE),
  "color5": Color(0xFFFFFFFF),
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