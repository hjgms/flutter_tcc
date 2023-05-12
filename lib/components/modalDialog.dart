import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/global/variables.dart' as global;

class ModalDialog extends StatefulWidget {
  final Function(bool) onClose;
  final String titulo;
  final bool descartar;
  const ModalDialog({
    Key? key,
    required this.titulo,
    required this.descartar,
    required this.onClose,
  }) : super(key: key);

  @override
  _ModalDialogState createState() => _ModalDialogState();
}

class _ModalDialogState extends State<ModalDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
          child: Text(
        widget.titulo,
        style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xff6A6A6A)),
      )),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actionsPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      actions: [
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
            onTap: () {
              widget.descartar == true
                  ? widget.onClose(false)
                  : widget.onClose(true);
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
