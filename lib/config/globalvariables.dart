import 'package:flutter/material.dart';

bool logado = false;
int pageIndex = 0;
Map user = {"auth": true, "uid": "3Ha8x0k5AFNLKsPp0dtoVImcKrj2"};

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

}

var styles = ClassStyles();
