import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/pages/PrincipalPage.dart';
import 'package:flutter_application_firebase/config/functionsback.dart';
import 'package:flutter_application_firebase/palette.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? passwordError = null;
  String? emailError = null;
  var result;

  jumpPage(){
    Navigator.of(context).pop();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:(context) {
          return const PrincipalPage();
        }, 
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  errorText: emailError,
                  hintText: "Email",
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Colors.black87,
                      width: 2
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Palette.shadesPrimary.shade200,
                      width: 2
                    )
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2
                    )
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2
                    )
                  ),

                  suffixIcon: const Icon(Icons.email,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  errorText: passwordError,
                  hintText: "Password",
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Colors.black87,
                      width: 2
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Palette.shadesPrimary.shade200,
                      width: 2
                    )
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2
                    )
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2
                    )
                  ),

                  suffixIcon: const Icon(Icons.lock,
                    color: Colors.black87,
                  )
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () async {
                  setState(() {
                    emailError = null;
                    passwordError = null;
                  });  
                  result = await loginAcount(emailController,passwordController);
                  if(result == "invalid-email"){
                    setState(() {
                      emailError = "invalid-email";
                    });
                  }else if(result == "wrong-password"){
                    setState(() {
                      passwordError = "wrong-password";
                    });
                  }else if(result == "sucess"){
                    jumpPage();
                  }
                  
                }, 
                child: Container(
                  height: 50,
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)
                    )
                  ),
                  child: const Text("Entrar",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20
                    ),
                  ),
                )
              )
            ],
          ),
        )
      )
    );
  }
}
