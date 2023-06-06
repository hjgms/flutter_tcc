import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/components/modalEstilosMusicais.dart';
import 'package:flutter_application_firebase/data/functions.dart';

//global
import 'package:flutter_application_firebase/global/variables.dart' as global;

//components
import '../components/modalDialog.dart';
import '../components/styles/marginInput.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  TextEditingController controllerNome = TextEditingController(
    text: (global.user["obj"]["name"] ?? "") 
    + (global.user["obj"]["lastname"] ?? "")
  );
  TextEditingController controllerEmail = TextEditingController(
    text: global.user["obj"]["email"] ?? ""
  );
  TextEditingController controllerTelefone = TextEditingController(
    text: global.user["obj"]["telefone"]
  );
  TextEditingController controllerCep = TextEditingController(
    text: global.user["obj"]["cep"] ?? ""
  );
  TextEditingController controllerDescription = TextEditingController(
    text: global.user["obj"]["description"] ?? ""
  );

  String nivelSelecionado = "";

  Container estiloMusicalSelected(String name) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(6)
        ),
        color: Color.fromARGB(255, 201, 201, 201)
      ),
      child: Text(
        name,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: Color(0xff515151)
        ),
      ),
    );
  }

  ButtonStyle modalButtonStyle({Color bgColor = Colors.white}) {
    return ButtonStyle(
      shape: MaterialStateProperty.all(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))
        )
      ),
      backgroundColor: MaterialStateProperty.all(bgColor)
    );
  }

  @override
  Widget build(BuildContext context) {
    bool? _fecharPagina;
    List niveis = ["Noturno", "Diurno", "Matutino"];
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ModalDialog(
                    titulo: "Deseja Descartar as alterações?",
                    descartar: true,
                    onClose: (bool value) {
                      setState(() {
                        _fecharPagina = value;
                        _fecharPagina == true
                            ? Navigator.of(context)
                                // ignore: todo
                                .pop() // TODO no caso de sair e salvar (necessário criar uma função posteriormente)
                            : Navigator.of(context)
                                .pop(); // no caso de sair e não salvar
                      });
                    },
                  );
                },
              );
            },
            child: const Icon(Icons.delete),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 17),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ModalDialog(
                        titulo: "Deseja Salvar as alterações?",
                        descartar: false,
                        onClose: (bool value) {
                          setState(() {
                            _fecharPagina = value;
                            _fecharPagina == true
                                ? Navigator.of(context)
                                    // ignore: todo
                                    .pop() // TODO no caso de sair e salvar (necessário criar uma função posteriormente)
                                : Navigator.of(context)
                                    .pop(); // no caso de sair e não salvar
                          });
                        },
                      );
                    },
                  );
                },
                child: const Icon(Icons.save),
              ),
            )
          ],
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
                  controller: controllerNome,
                  style: global.styles.defaultinputTextStyle(),
                  cursorColor: global.colorTheme["watergreen"] as Color,
                  decoration: global.styles
                      .inputTextFieldDecoration(hintText: "Digite seu nome"),
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
                  controller: controllerEmail,
                  decoration: global.styles
                      .inputTextFieldDecoration(hintText: "Digite seu email"),
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
                  decoration: global.styles.inputTextFieldDecoration(
                      hintText: "Digite seu telefone"),
                ),
              ),
              Text(
                "Cep",
                style: global.styles.labelText(),
              ),
              MarginInput(
                child: TextField(
                  controller: controllerCep,
                  style: global.styles.defaultinputTextStyle(),
                  cursorColor: global.colorTheme["watergreen"] as Color,
                  decoration: global.styles
                      .inputTextFieldDecoration(hintText: "Digite seu cep"),
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
                      // estiloMusicalSelected("Música Clássica"),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const ModalEstilosMusicais();
                            },
                          );
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
                "Horários Disponíveis",
                style: global.styles.labelText(),
              ),
              Column(
                  children: niveis
                      .map((nivel) => RadioListTile(
                          dense: true,
                          title: Text(nivel),
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                          value: nivel.toString(),
                          selected: nivelSelecionado == nivel,
                          groupValue: nivelSelecionado,
                          activeColor: global.colorTheme["watergreen"] as Color,
                          fillColor: MaterialStatePropertyAll(
                              global.colorTheme["mainPurple"] as Color),
                          onChanged: (value) {
                            setState(() {
                              nivelSelecionado = value.toString();
                            });
                          }))
                      .toList()),
              Text(
                "Descrição",
                style: global.styles.labelText(),
              ),
              MarginInput(
                //TODO mudar a cor da borda ou algo do tipo quando for focado
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
                    controller: controllerDescription,
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
