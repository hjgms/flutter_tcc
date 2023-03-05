// ignore: file_names
import 'package:flutter/material.dart';
 
//view
import 'package:flutter_application_firebase/config/globalvariables.dart' as globalvariables;
import 'package:flutter_application_firebase/pages/loginPage.dart';
import 'package:flutter_application_firebase/palette.dart';
import 'package:flutter_svg/flutter_svg.dart';
 
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  logout(){
    setState(() {
      globalvariables.logado = false;
      globalvariables.pageIndex = 0;
    });
    Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute(builder:(context){
      return const LoginPage();
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
        actions: const [
          Icon(Icons.circle,color: Palette.shadesPrimary,)
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