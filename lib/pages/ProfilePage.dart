// ignore: file_names
import 'package:flutter/material.dart';

//view page
// import '../../login/loginPage.dart';

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
        actions: const [
          // IconButton(
          //   onPressed: (){
          //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginPageWidget()));
          //   }, 
          //   icon: Row(
          //     children: const [
          //       Text("Sair"),
          //       Icon(Icons.arrow_forward)
          //     ],
          //   )
          // )
        ],
      ),
    );
  }
}