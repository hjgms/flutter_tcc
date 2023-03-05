// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/palette.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                padding: const EdgeInsets.symmetric(vertical: 8),
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
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 4,
                      )
                    ),
                    suffixIcon: Container(
                      height: 20,
                      width: 20,
                      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                      child: SvgPicture.asset(
                        "../../assets/icons/envelope.svg",
                      ),
                    )
                  ),
                ),  
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
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
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 4,
                      )
                    ),
                    suffixIcon:  Container(
                      height: 20,
                      width: 20,
                      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                      child: SvgPicture.asset(
                        "../../assets/icons/trancar.svg",
                      ),
                    ),
                  ),
                  obscureText: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: GestureDetector(
                  onTap:  () async{
                    setState(() {
                      errorTextEmail = null;
                      errorTextPassword = null;
                      test();
                    });
                  },
                  child: Container(
                    height: 55,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30)
                    ),
                  child: const Text("Conectar", 
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ), 
              ))
            ],
          ), 
        )
      ),
    );
  }
}