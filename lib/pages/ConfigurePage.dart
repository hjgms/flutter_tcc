// ignore: file_names
import 'package:flutter/material.dart';

//view
import 'package:flutter_application_firebase/pages/LoginPage.dart';
import 'package:flutter_application_firebase/config/globalvariables.dart' as globalvariables;

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
        title: const Text("configurações"),
        elevation: 0,
        actions: const [
          Icon(Icons.circle,color: Colors.blue)
        ],
      ),  
      body: Column(
        children: [
          TextButton(
            style: TextButton.styleFrom(
              fixedSize: const Size.fromHeight(50)
            ),
            onPressed: (){
              logout();
            }, 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text("logout"),
                Icon(Icons.logout)
              ],
            )
          )
        ],
      ),
    );
  }
}