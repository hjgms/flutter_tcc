// ignore: file_names
import 'package:flutter/material.dart';

//view page
// import '../../login/loginPage.dart';

//configs
import 'package:flutter_application_firebase/config/globalvariables.dart' as global;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
          "Perfil",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: global.colorTheme["color2"]
          ),
        ),
      ),
    );
  }
}