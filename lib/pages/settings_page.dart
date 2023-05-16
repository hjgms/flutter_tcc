// ignore: file_names
import 'package:flutter/material.dart';
 
//view
import 'package:flutter_application_firebase/global/variables.dart' as global;
import 'package:flutter_application_firebase/pages/login_page.dart';
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
        backgroundColor: global.colorTheme["mainPurple"] as Color,
        elevation: 2,
        toolbarHeight: 60,
        title: Text(
          "Settings",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: global.colorTheme["color5"]
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              signoutUser();
              global.pageIndex = 0;
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginPage();
                  }
                )
              );
            },
            child: Container(
              height: 50,
              width: 50,
              margin: const EdgeInsets.all(10),
              child: Icon(
                Icons.logout,
                color: global.colorTheme["color5"],
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