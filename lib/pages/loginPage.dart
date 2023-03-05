// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/palette.dart';

//view widget
import 'PrincipalPage.dart';
import '../config/functionsback.dart';
import '../config/globalvariables.dart' as globalvariables;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //variables
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? errorTextEmail;
  String? errorTextPassword; 

  //functions
  test() async{
    var resp = await usuariosGet(
      emailController,
      passwordController,
      errorTextEmail,
      errorTextPassword
    );

    if(resp){
      setState(() {
        globalvariables.logado = true;
      });

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context){
            return const PrincipalPage();
          }
        )
      );
    }
  }

  //visual
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            children: [
              Image.asset("assets/app-logo.png"
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    errorText: errorTextEmail,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide(
                        color: Palette.shadesPrimary,
                        width: 4,
                      )
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 4,
                      )
                    ),
                    suffixIcon: const Icon(Icons.email),
                  ),
                ),  
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    errorText: errorTextPassword,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide(
                        color: Palette.shadesPrimary,
                        width: 4,
                      )
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 4,
                      )
                    ),
                    suffixIcon: const Icon(Icons.lock),
                  ),
                  obscureText: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextButton(
                  onPressed:  () async{
                    setState(() {
                      errorTextEmail = null;
                      errorTextPassword = null;
                      test();
                    });
                  },
                  style: TextButton.styleFrom(
                    fixedSize: const Size(double.maxFinite, 60),
                    backgroundColor: Palette.shadesPrimary,
                  ), 
                  child: const Text("Conectar", 
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ), 
              )
            ],
          ), 
        )
      ),
    );
  }
}