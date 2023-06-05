import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_firebase/data/functions.dart';
import 'package:flutter_application_firebase/global/variables.dart' as global;

import '../components/styles/marginInput.dart';
import '../enum/dadosUser.dart';
import '../utils/funcoesTratativa.dart';

class SignPage extends StatefulWidget {
  const SignPage({super.key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerSenha = TextEditingController();
  TextEditingController controllerSenhaRepetida = TextEditingController();
  TextEditingController controllerTelefone = TextEditingController();
  TextEditingController controllerCep = TextEditingController();

  DadosUser dadosUser = DadosUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          forceMaterialTransparency: true,
          toolbarHeight: 120,
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back,
              color: global.colorTheme['clearMainPurple'],
            ),
          ),
          centerTitle: true,
          title: Text(
            "Sign app",
            style: TextStyle(
                fontSize: 20, color: global.colorTheme['clearMainPurple']),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: ListView(
          children: [
            Text(
              "Nome completo",
              style: global.styles.labelText(),
            ),
            MarginInput(
              child: TextField(
                maxLength: 64,
                controller: controllerNome,
                style: global.styles.defaultinputTextStyle(),
                cursorColor: global.colorTheme["watergreen"] as Color,
                decoration: global.styles
                    .inputTextFieldDecoration(hintText: "Digite seu nome..."),
              ),
            ),
            Text(
              "Email",
              style: global.styles.labelText(),
            ),
            MarginInput(
              child: TextField(
                controller: controllerEmail,
                maxLength: 64,
                style: global.styles.defaultinputTextStyle(),
                cursorColor: global.colorTheme["watergreen"] as Color,
                decoration: global.styles
                    .inputTextFieldDecoration(hintText: "email..."),
              ),
            ),
            Text(
              "Senha (+6 caracteres)",
              style: global.styles.labelText(),
            ),
            MarginInput(
              child: TextField(
                obscureText: true,
                maxLength: 64,
                controller: controllerSenha,
                style: global.styles.defaultinputTextStyle(),
                cursorColor: global.colorTheme["watergreen"] as Color,
                decoration: global.styles
                    .inputTextFieldDecoration(hintText: "Informe sua senha..."),
              ),
            ),
            Text(
              "Confirmação da senha",
              style: global.styles.labelText(),
            ),
            MarginInput(
              child: TextField(
                controller: controllerSenhaRepetida,
                obscureText: true,
                maxLength: 64,
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
                controller: controllerTelefone,
                style: global.styles.defaultinputTextStyle(),
                cursorColor: global.colorTheme["watergreen"] as Color,
                maxLength: 11,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: global.styles.inputTextFieldDecoration(
                    hintText: "ex: 99-91234-5678 [sem o tracejado]"),
              ),
            ),
            Text(
              "Endereço (CEP)",
              style: global.styles.labelText(),
            ),
            MarginInput(
              child: TextField(
                controller: controllerCep,
                maxLength: 7,
                style: global.styles.defaultinputTextStyle(),
                cursorColor: global.colorTheme["watergreen"] as Color,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: global.styles.inputTextFieldDecoration(
                    hintText: "ex: 0000-000 [sem o tracejado]"),
              ),
            ),
            MarginInput(
              child: GestureDetector(
                onTap: () {
                  dadosUser.nome = controllerNome.text.trim();
                  dadosUser.senha = controllerSenha.text;
                  dadosUser.email = controllerEmail.text.trim();
                  dadosUser.cep = controllerCep.text.trim();
                  dadosUser.telefone = controllerTelefone.text.trim();

                  // verificacao de email ta retornando true.
                  // TODO: Mostrar caso a senha já esteja em uso
                  // TODO: salvar a senha com hash (está vísivel por agora)
                  String? primeiroErro = realizarValidacoes(
                      dadosUser, controllerSenhaRepetida.text);
                  if (primeiroErro != null) {
                    exibirSnackbar(context, primeiroErro);
                  } else {
                    combinationAuthCreate(dadosUser);
                    // Entrar na página inicial
                  }
                },
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
