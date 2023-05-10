import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/global/variables.dart' as global;

class ModalSave extends StatefulWidget {
  const ModalSave({ Key? key }) : super(key: key);

  @override
  _ModalSaveState createState() => _ModalSaveState();
}

class _ModalSaveState extends State<ModalSave> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
          child: Text(
        "Deseja salvar as alterações?",
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xff6A6A6A)),
      )),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actionsPadding: const EdgeInsets.all(12),
      actions: [
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