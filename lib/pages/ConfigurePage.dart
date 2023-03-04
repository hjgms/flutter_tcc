// ignore: file_names
import 'package:flutter/material.dart';

//view
import 'package:flutter_application_firebase/pages/LoginPage.dart';
import 'package:flutter_application_firebase/config/globalvariables.dart' as globalvariables;
import 'package:flutter_svg/flutter_svg.dart';

class ConfigurePageView extends StatefulWidget {
  const ConfigurePageView({super.key});

  @override
  State<ConfigurePageView> createState() => _ConfigurePageViewState();
}

class _ConfigurePageViewState extends State<ConfigurePageView> {

  logout(){
    setState(() {
      globalvariables.logado = false;
      globalvariables.pageIndex = 0;
    });
    Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute(builder:(context){
      return const LoginPageWidget();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        toolbarHeight: 60,
        title: const Text(
          "Configurações",
          style: TextStyle(
            color: Colors.black26
          ),
        ),
        elevation: 0,
      )
    );
  }
}