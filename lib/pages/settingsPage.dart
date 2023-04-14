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
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white70,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            height: 1,
            color: global.colorTheme["color3"],
          ),
        ),
        elevation: 0,
        toolbarHeight: 45,
        title: Text(
          "Settings",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: global.colorTheme["color2"]
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () async{
              await signoutAccount();
              global.credentialUser["autentication"] = false;
              global.pageIndex = 0;
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context){
                return const LoginPage();
              }));
            },
            child: Container(
              height: 50,
              width: 50,
              margin: const EdgeInsets.all(10),
              child: Icon(
                Icons.logout,
                color: global.colorTheme["color2"],
              ),
            ),
          )
        ]
      ),  
      body: Column(
        children: const [],
      ),
    );
  }
} 