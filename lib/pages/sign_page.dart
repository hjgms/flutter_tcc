import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_firebase/global/variables.dart' as global;

import '../components/styles/marginInput.dart';

class SignPage extends StatefulWidget {
  const SignPage({super.key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  TextEditingController controllerInput1 = TextEditingController();
  TextEditingController controllerInput2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //! está redundante essa função (e a variavel de baixo), já que tbm ela está presente no edit_Profile

    

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          forceMaterialTransparency: true,
          leading: const Icon(Icons.arrow_back),
          centerTitle: true,
          title: Text(
            "Sign app",
            style: TextStyle(
                fontSize: 20, color: global.colorTheme['clearMainPurple']),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: ListView(
          children: [
            Text(
              "Nome completo",
              style: global.styles.labelText(),
            ),
            MarginInput(
              child: TextField(
                style: global.styles.defaultinputTextStyle(),
                cursorColor: global.colorTheme["watergreen"] as Color,
                decoration:
                    global.styles.inputTextFieldDecoration(hintText: "Digite seu nome..."),
              ),
            ),
            Text(
              "Email",
              style: global.styles.labelText(),
            ),
            MarginInput(
              child: TextField(
                style: global.styles.defaultinputTextStyle(),
                cursorColor: global.colorTheme["watergreen"] as Color,
                decoration: global.styles
                    .inputTextFieldDecoration(hintText: "email..."),
              ),
            ),
            Text(
              "Senha (+8 caracteres)",
              style: global.styles.labelText(),
            ),
            MarginInput(
              child: TextField(
                style: global.styles.defaultinputTextStyle(),
                cursorColor: global.colorTheme["watergreen"] as Color,
                decoration:
                    global.styles
                    .inputTextFieldDecoration(hintText: "Informe sua senha..."),
              ),
            ),
            Text(
              "Confirmação da senha",
              style: global.styles.labelText(),
            ),
            MarginInput(
              child: TextField(
                style: global.styles.defaultinputTextStyle(),
                cursorColor: global.colorTheme["watergreen"] as Color,
                decoration: global.styles.inputTextFieldDecoration(
                    hintText: "Informe sua senha novamente... "),
              ),
            ),
            Text(
              "Telefone",
              style: global.styles.labelText(),
            ),
            MarginInput(
              child: TextField(
                style: global.styles.defaultinputTextStyle(),
                cursorColor: global.colorTheme["watergreen"] as Color,
                maxLength: 11,
                
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration:
                    global.styles
                    .inputTextFieldDecoration(hintText: "ex: 99-91234-5678 [sem o tracejado]"),
              ),
            ),
            Text(
              "Endereço (CEP)",
              style: global.styles.labelText(),
            ),
            MarginInput(
              child: TextField(
                maxLength: 7,        
                style: global.styles.defaultinputTextStyle(),
                cursorColor: global.colorTheme["watergreen"] as Color,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration:
                    global.styles
                    .inputTextFieldDecoration(hintText: "ex: 0000-000 [sem o tracejado]"),
              ),
            ),
            MarginInput(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 45,
                  width: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: global.colorTheme['mainPurple']),
                  child: const Center(
                      child: Text(
                    'Continuar',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
