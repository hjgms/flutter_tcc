import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/pages/PrincipalPage.dart';
import 'package:flutter_application_firebase/config/functionsback.dart';
import 'package:flutter_application_firebase/config/globalvariables.dart' as global;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? passwordError;
  String? emailError;
  String? result;
  bool _obscureText = true;
  bool? _selectedText1 = false;
  bool? _selectedText2 = false;

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

  login() async {
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
  }

  selected(selected){
    if(selected == 1){
      setState(() {
         _selectedText1 == false? _selectedText1 = true : _selectedText1 = false;
      });
    }else if(selected == 2){
      setState(() {
         _selectedText2 == false? _selectedText2 = true : _selectedText2 = false;
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
                onTap: selected(1),
                onTapOutside: selected(1),
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
                  suffixIcon: Icon(Icons.email_outlined,
                    color: _selectedText1 == false? Colors.black87 : global.cor,
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
                onTap: selected(2),
                onTapOutside: selected(2),
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
                    Icon(Icons.lock_outline,
                      color: _selectedText2 == false? Colors.black87 : global.cor,
                    ) :
                    Icon(Icons.lock_open,
                      color: _selectedText2 == false? Colors.black87 : global.cor,
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
