// ignore: file_names
import 'package:flutter/material.dart';
 
//view
import 'package:flutter_application_firebase/config/globalvariables.dart' as global;
import 'package:flutter_application_firebase/pages/loginPage.dart';
import 'package:flutter_application_firebase/data/functions.dart';
 
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        toolbarHeight: 70,
        title: const Text(
          "Configurações",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () async{
              await signoutAcount();
              global.credentialUser["autentication"] = false;
              global.pageIndex = 0;
              Navigator.of(context).push(MaterialPageRoute(builder:(context){
                return const LoginPage();
              }));
            },
            child: Container(
              height: 50,
              width: 50,
              margin: const EdgeInsets.all(10),
              child: const Icon(Icons.logout),
            ),
          )
        ],
        elevation: 2
      ),  
      body: Column(
        children: const [],
      ),
    );
  }
} 