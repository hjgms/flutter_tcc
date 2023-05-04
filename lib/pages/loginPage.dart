import 'package:flutter/material.dart';

//firebase
import 'package:flutter_application_firebase/data/functions.dart';

//configs
import 'package:flutter_application_firebase/config/globals.dart' as global;

//pages
import 'package:flutter_application_firebase/pages/providerPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //input
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //returns errors
  String? passwordError;
  String? emailError;
  Map resul = {};

  //password view
  bool _obscureText = true;

  //transition navbar pages
  jumpProviderPage(){
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder:(context) {
          return const ProviderPage();
        }, 
      )
    );
  }

  createUser(){

  }

  //login test
  login() async {
    emailError = null;
    passwordError = null;

    if(emailController.text == "" || passwordController.text == ""){
      setState(() {
      });
      return;
    }

    resul = await loginUser(emailController.text,passwordController.text);
    if(resul["ok"]){
      jumpProviderPage();
    }else if(resul["args"].toString().contains("[firebase_auth/invalid-email]")){
      setState(() {
        emailError = "Email invalido!";
        emailController.clear();
      });
    }else if(resul["args"].toString().contains("[firebase_auth/wrong-password]")){
      setState(() {
        passwordError = "Senha incorreta!";
        passwordController.clear();
      });
    }else if(resul["args"].toString().contains("[firebase_auth/too-many-requests]")){
      setState(() {
        emailError = "";
        passwordError = "Limite de tentativas excedido, Por favor tente novamente mais tarde!";
      });
    }else if(resul["args"].toString().contains("[firebase_auth/user-not-found]")){
      setState(() {
        emailError = "Usúario não existente!";
        emailController.clear();
        passwordController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: emailController,
                cursorColor: global.colorTheme["color2"] as Color,
                decoration: InputDecoration(
                  errorText: emailError,
                  hintText: "Email",
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Colors.black54,
                      width: 1
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: global.colorTheme["color2"] as Color,
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
                  suffixIcon: const Icon(
                    Icons.email_outlined,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: passwordController,
                obscureText: _obscureText,
                cursorColor: global.colorTheme["color2"] as Color,
                decoration: InputDecoration(
                  errorText: passwordError,
                  hintText: "Password",
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Colors.black54,
                      width: 1
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: global.colorTheme["color2"] as Color,
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
                  suffixIcon: IconButton(
                    onPressed: () => setState(() {
                      _obscureText == true? _obscureText = false : _obscureText = true;
                    }),
                    icon: _obscureText == true? 
                    const Icon(Icons.lock_outline,
                      color: Colors.black54,
                    ) :
                    const Icon(Icons.lock_open,
                      color: Colors.black54,
                    ),
                  )
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: login, 
                child: Container(
                  height: 50,
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: global.colorTheme["color1"] as Color,
                    borderRadius: const BorderRadius.all(Radius.circular(20))
                  ),
                  child: const Text("Entrar",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20
                    ),
                  ),
                )
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: createUser, 
                child: Container(
                  height: 50,
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: global.colorTheme["color5"] as Color,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    border: Border.all(
                      color: global.colorTheme["color1"] as Color,
                      width: 2
                    )
                  ),
                  child: Text("Criar conta",
                    style: TextStyle(
                      color: global.colorTheme["color1"] as Color,
                      fontWeight: FontWeight.w500,
                      fontSize: 22
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
