import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/components/modalDialog.dart';
import 'package:flutter_application_firebase/components/modalEstilosMusicais.dart';

//configs
import 'package:flutter_application_firebase/global/variables.dart' as global;
import '../components/styles/marginInput.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextStyle inputTextStyle =
      const TextStyle(fontSize: 14, color: Color(0xff515151));

  InputDecoration inputTextFieldDecoration({String hintText = ""}) {
    return InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(
                width: 2, color: global.colorTheme["mainPurple"] as Color)),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(width: 1, color: Color(0xff515151))),
        contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6))),
        hintText: hintText);
  }

  Container estiloMusicalSelected(String name) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          color: Color.fromARGB(255, 201, 201, 201)),
      child: Text(
        name,
        style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Color(0xff515151)),
      ),
    );
  }

  ButtonStyle modalButtonStyle({Color bgColor = Colors.white}) {
    return ButtonStyle(
        shape: MaterialStateProperty.all(const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)))),
        backgroundColor: MaterialStateProperty.all(bgColor));
  }

  @override
  Widget build(BuildContext context) {
    bool? _fecharPagina;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: global.colorTheme["mainPurple"] as Color,
          title: const Text("Editing page"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          child: ListView(
            children: [
              Text(
                "Nome",
                style: global.styles.labelText(),
              ),
              MarginInput(
                child: TextField(
                  style: inputTextStyle,
                  cursorColor: global.colorTheme["watergreen"] as Color,
                  decoration:
                      inputTextFieldDecoration(hintText: "Digite seu nome"),
                ),
              ),
              Text(
                "Email",
                style: global.styles.labelText(),
              ),
              MarginInput(
                child: TextField(
                  style: inputTextStyle,
                  cursorColor: global.colorTheme["watergreen"] as Color,
                  decoration:
                      inputTextFieldDecoration(hintText: "Digite seu email"),
                ),
              ),
              Text(
                "Localidade",
                style: global.styles.labelText(),
              ),
              MarginInput(
                child: TextField(
                  style: inputTextStyle,
                  cursorColor: global.colorTheme["watergreen"] as Color,
                  decoration: inputTextFieldDecoration(
                      hintText: "Digite sua localidade"),
                ),
              ),
              Text(
                "Estilos musicais",
                style: global.styles.labelText(),
              ),
              MarginInput(
                child: Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    runAlignment: WrapAlignment.center,
                    children: [
                      estiloMusicalSelected("Rock"),
                      estiloMusicalSelected("Sertanejo"),
                      estiloMusicalSelected("Blues"),
                      estiloMusicalSelected("Pop"),
                      estiloMusicalSelected("Jazz"),
                      estiloMusicalSelected("Música Clássica"),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const ModalEstilosMusicais();
                                // ModalDialog(
                                //   titulo: "Deseja Salvar as alterações?",
                                //   descartar: false,
                                //   onClose: (bool value) {
                                //     setState(() {
                                //       _fecharPagina = value;
                                //       _fecharPagina == true
                                //           ? Navigator.of(context)
                                //               .pop() // TODO no caso de sair e salvar (necessário criar uma função posteriormente)
                                //           : Navigator.of(context)
                                //               .pop(); // no caso de sair e não salvar
                                //     });
                                //   },
                                // );
                              });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(6)),
                              color: global.colorTheme["watergreen"] as Color),
                          child:
                              const Icon(Icons.add, color: Color(0xffffffff)),
                        ),
                      ),
                    ]),
              ),
              Text(
                "Descrição",
                style: global.styles.labelText(),
              ),
              MarginInput( //TODO mudar a cor da borda ou algo do tipo quando for focado
                child: Container(
                  padding: const EdgeInsetsDirectional.all(14),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 238, 238, 238),
                      border: Border.all(
                          color: const Color.fromARGB(255, 223, 223, 223)),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    cursorColor: global.colorTheme["watergreen"] as Color,
                    decoration: const InputDecoration(
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                    maxLines: null,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 51, 51, 51),
                      height: 1.5,
                    ),
                    controller: TextEditingController(
                      text:
                          'Texto grande aqui...\n\ndasda\n\nsdas\n\nsaddasd\n\nsadas\n\n\nsadasdadas\nsada',
                    ),
                  ),
                ),
              ),
              Text(
                "Fotos",
                style: global.styles.labelText(),
              ),
            ],
          ),
        ));
  }
}
