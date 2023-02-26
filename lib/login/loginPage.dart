// ignore: file_names
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//view widget
import '../principal/PrincipalWidget.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({super.key});

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? errorTextEmail;
  String? errorTextPassword;

  usuariosGet(TextEditingController email,TextEditingController password) async{
    CollectionReference users = FirebaseFirestore.instance.collection('usuarios');
    var limit = 3;
    var credentials = {
      "email": email.text,
      "password": password.text
    };
    var resp = false;
    for (var i = 0; i < limit; i++) {
      await users.doc("$i").get().then( (value) =>{ 
        if(value["credentials"]["email"] == credentials["email"]){
          if(value["credentials"]["password"] == credentials["password"]){
            resp = true
          }else{
            errorTextPassword = "Password error"
          }
        }else{
          errorTextEmail = "Email error"
        }
      });
      if(resp){
        // ignore: avoid_print
        print("sucess");
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context){
          return const PrincipalWidget();
        }));
        break;
      }
    }
  }

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
              Image.asset("../web/icons/Icon-512.png",
                scale: 2.0,
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
                        color: Colors.blue,
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
                    suffixIcon: Icon(Icons.email),
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
                        color: Colors.blue,
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
                  onPressed:  ()async{
                    setState(() {
                      errorTextEmail = null;
                      errorTextPassword = null;
                      usuariosGet(emailController,passwordController);
                    });
                  },
                  style: TextButton.styleFrom(
                    fixedSize: const Size(double.maxFinite, 60),
                    backgroundColor: Colors.blue
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