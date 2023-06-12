import 'package:flutter/material.dart';
//global
import 'package:flutter_application_firebase/global/variables.dart' as global;

//functions
import 'package:flutter_application_firebase/data/functions.dart';

class TrabalhoDetalhes extends StatefulWidget {
  const TrabalhoDetalhes({super.key});

  @override
  State<TrabalhoDetalhes> createState() => _TrabalhoDetalhesState();
}

class _TrabalhoDetalhesState extends State<TrabalhoDetalhes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            backgroundColor: global.colorTheme["mainPurple"] as Color,
            elevation: 0,
            toolbarHeight: 60,
            title: Text(
              "Detalhes",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: global.colorTheme["color5"]),
            ),
        ),
      body: const Text("Trabalho detalhes!"),
    );
  }
}