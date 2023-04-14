import 'package:flutter/material.dart';

bool logado = false;
int pageIndex = 0;
Map credentialUser = {
  "authentication": false,
  "user": {},
  "info": ""
};
Map user = {};
Color cor = Color(0xFFEC3D16);

Map<String,Color> colorTheme = {
  "color1":Color(0xFFEC3D16),
  "color2":Color(0xFFC6C6C6),
  "color3":Color(0xFFE0E0E0),
  "color4":Color(0xFFEEEEEE),
  "color5":Color(0xFFFFFFFF),
};