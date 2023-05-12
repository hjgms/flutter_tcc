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
      title: Column(
        children: const [
          Text(
            "Estilos musicais ",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xff121212)),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            "Selecione os estilos musicais que você tem conhecimento e sabe tocar.",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xffAAAAAA),
                fontSize: 14),
          )
        ],
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      content: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: double.maxFinite,
                height: 200,
                child: ListView(
                  children: const [
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                  ],
                )),
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actionsPadding: const EdgeInsets.only(top: 8),
      actions: [
        const Divider(
          height: 2,
          color: Color(0xffD9D9D9),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        color: Colors.grey.shade300),
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        color: global.colorTheme["mainPurple"] as Color),
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                    child: const Text(
                      "Confirmar",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}