import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/global/variables.dart' as global;

class ModalEstilosMusicais extends StatefulWidget {
  const ModalEstilosMusicais({
    Key? key,
  }) : super(key: key);

  @override
  _ModalEstilosMusicaisState createState() => _ModalEstilosMusicaisState();
}

class _ModalEstilosMusicaisState extends State<ModalEstilosMusicais> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
          child: Text(
        "Estilos musicais ",
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xff121212)),
      )),
      contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      content: Wrap(
        runAlignment: WrapAlignment.center,
        children: const [
          Text(
            "Selecione os estilos musicais que você tem conhecimento e sabe tocar.",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xffAAAAAA),
              fontSize: 14,
            ),
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actionsPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      actions: [ //TODO colocar um border em cima dos botões! como no design
        GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(43, 70, 70, 70),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 4)),
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  color: Colors.grey.shade300),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              child: Text(
                "Cancelar",
                style: TextStyle(color: Colors.grey.shade700),
              ),
            )),
        GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(43, 70, 70, 70),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 4)),
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  color: global.colorTheme["mainPurple"] as Color),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              child: const Text(
                "Confirmar",
                style: TextStyle(color: Colors.white),
              ),
            )),
      ],
    );
  }
}
