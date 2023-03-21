import 'package:flutter/material.dart';

bool logado = false;
int pageIndex = 0;
bool authentication = false;
Map credentialUser = {
  "login": false,
  "user": "",
  "info": ""
};
Map user = {
  "name":"",
  "lastname":"",
  "perfilimageurl":""
};
Color cor = Color.fromARGB(255, 236, 61, 22);