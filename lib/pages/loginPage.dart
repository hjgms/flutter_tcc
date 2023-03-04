// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//view widget
import 'PrincipalPage.dart';
import '../config/functionsback.dart';
import '../config/globalvariables.dart' as globalvariables;

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({super.key});
  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {

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
            return const PrincipalWidget();
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
          padding: const EdgeInsets.all(40),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            children: [
              Image.asset("assets/Icon-512.png",
                scale: 2.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    errorText: errorTextEmail,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(
                        color: Colors.black26,
                        width: 1.5,
                      )
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 1.5,
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
                        color: Colors.black26,
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
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(
                        color: Colors.black26,
                        width: 1.5,
                      )
                    ),
                    border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 1.5,
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
                        color: Colors.black26,
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
                    child: const Center(
                      child: Text("Entrar", 
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        ),
                      ),
                    )
                  )
                ), 
              )
            ],
          ), 
        )
      ),
    );
  }
}