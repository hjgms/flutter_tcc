// ignore: file_names
import 'package:flutter/material.dart';

//view page
// import '../../login/loginPage.dart';

class PerfilPageView extends StatefulWidget {
  const PerfilPageView({super.key});

  @override
  State<PerfilPageView> createState() => _PerfilPageViewState();
}

class _PerfilPageViewState extends State<PerfilPageView> {
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