import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/global/variables.dart' as global;

import '../components/styles/marginInput.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final halfScreenWidth = screenWidth / 4;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 90,
                width: halfScreenWidth,
                decoration: BoxDecoration(
                    color: global.colorTheme['mainPurple'],
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(3000),
                        topRight: Radius.circular(0))),
              ),
              Container(
                height: 415,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 3),
                    color: global.colorTheme['mainPurple'],
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(600))),
                width: double.infinity,
              ),
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/logo-tcc.png',
                        width: 100,
                      ),
                      const Text(
                        "Criar sua conta",
                        style:
                            TextStyle(color: Color(0xff202020), fontSize: 28),
                      ),
                      const SizedBox(
                        width: 265,
                        child: Text(
                            "Bem vindo ao music jobs, escolha qual opção se adequa a você e começe já!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff202020), fontSize: 15)),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 120),
                    child: Column(
                      children: [
                        MarginInput(
                            child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 50,
                            width: 260,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 1),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(0),
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                                color: global.colorTheme['watergreen']),
                            child: const Center(
                                child: Text(
                              'Sou contratante',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            )),
                          ),
                        )),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 50,
                            width: 260,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 1),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(0),
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                                color: Colors.white),
                            child: const Center(
                                child: Text(
                              'Quero ser contratado',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Já tenho uma conta",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          letterSpacing: 1.05),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
