import 'package:flutter/material.dart';

//firebase
import 'package:flutter_application_firebase/data/functions.dart';

//configs
import 'package:flutter_application_firebase/config/globalVariables.dart' as global;

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
  String? result;

  //password view
  bool _obscureText = true;

  //transition navbar pages
  jumpProviderPage(){
    Navigator.of(context).pop();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:(context) {
          return const ProviderPage();
        }, 
      )
    );
  }

  //login test
  login() async {
    emailError = null;
    passwordError = null;
    result = await loginAcount(emailController,passwordController);
    if(result == "sucess"){
      jumpProviderPage();
    }else if(result == "invalid-email"){
      setState(() {
        emailError = "Email invalido!";
      });
    }else if(result == "wrong-password"){
      setState(() {
        passwordError = "Senha incorreta!";
      });
    }
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
                cursorColor: global.cor,
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
                      color: global.cor,
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
                    color:Colors.black87,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: passwordController,
                obscureText: _obscureText,
                cursorColor: global.cor,
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
                      color: global.cor,
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
                      color: Colors.black87,
                    ) :
                    const Icon(Icons.lock_open,
                      color: Colors.black87,
                    ),
                  )
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: login, 
                child: Container(
                  height: 50,
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.all(Radius.circular(20))
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