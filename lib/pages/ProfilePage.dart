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
        backgroundColor: global.colorTheme["color1"] as Color,
        elevation: 2,
        toolbarHeight: 45,
        title: Text(
          "Perfil",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: global.colorTheme["color5"] as Color
          ),
        ),
      ),
    );
  }
}