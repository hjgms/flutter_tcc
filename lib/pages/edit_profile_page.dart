import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_firebase/components/modalEstilosMusicais.dart';
import 'package:flutter_application_firebase/data/cache/cache.dart';
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
  String userId = "";
  @override
  void initState() {
    super.initState();
    buscarValorAssincronamente();
  }

  Future<void> buscarValorAssincronamente() async {
    String valor = await getCacheUserUid();
    setState(() {
      userId = valor;
    });
  }

  TextEditingController controllerNome =
      TextEditingController(text: (global.user["obj"]["name"] ?? "") ?? "");
  TextEditingController controllerSobrenome =
      TextEditingController(text: (global.user["obj"]["lastname"] ?? ""));
  TextEditingController controllerTelefone =
      TextEditingController(text: global.user["obj"]["telefone"]);
  TextEditingController controllerCep =
      TextEditingController(text: global.user["obj"]["cep"] ?? "");
  TextEditingController controllerDescription =
      TextEditingController(text: global.user["obj"]["description"] ?? "");

  List horariosEscolhidos = global.user["obj"]["freeHours"] ?? [];

  Widget musicStyleSelected(String name) {
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

  List<String> horarios = ["Noturno", "Diurno", "Matutino"];
  @override
  Widget build(BuildContext context) {
    bool? _fecharPagina;
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
                      _fecharPagina = value;
                      _fecharPagina == true
                          ? Navigator.of(context)
                              // ignore: todo
                              .pop() // TODO no caso de sair e salvar (necessário criar uma função posteriormente)
                          : Navigator.of(context)
                              .pop(); // no caso de sair e não salvar
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
                            if (_fecharPagina == true) {
                              List estilosMusicais = global.musicStylesList;
                              saveEditingProfile(
                                documentoId: userId,
                                novosDados: {
                                  "name": controllerNome.text,
                                  "lastname": controllerSobrenome.text,
                                  "cep": controllerCep.text,
                                  "description": controllerDescription.text,
                                  "freeHours": horariosEscolhidos,
                                  "estilosmusicais": estilosMusicais,
                                  "telefone": controllerTelefone.text,
                                },
                              ).then((_) {
                                Navigator.of(context).pop();
                              });
                            }
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
                  maxLength: 32,
                  style: global.styles.defaultinputTextStyle(),
                  cursorColor: global.colorTheme["watergreen"] as Color,
                  decoration: global.styles
                      .inputTextFieldDecoration(hintText: "Digite seu nome"),
                ),
              ),
              Text(
                "Sobrenome",
                style: global.styles.labelText(),
              ),
              MarginInput(
                child: TextField(
                  controller: controllerSobrenome,
                  maxLength: 64,
                  style: global.styles.defaultinputTextStyle(),
                  cursorColor: global.colorTheme["watergreen"] as Color,
                  decoration: global.styles.inputTextFieldDecoration(
                      hintText: "Digite seu sobrenome"),
                ),
              ),
              Text(
                "Telefone",
                style: global.styles.labelText(),
              ),
              MarginInput(
                child: TextField(
                  controller: controllerTelefone,
                  maxLength: 11,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                  maxLength: 7,
                  style: global.styles.defaultinputTextStyle(),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  cursorColor: global.colorTheme["watergreen"] as Color,
                  decoration: global.styles.inputTextFieldDecoration(
                      hintText: "ex: 0000-000 [sem o tracejado]"),
                ),
              ),
              Text(
                "Horários Disponíveis",
                style: global.styles.labelText(),
              ),
              MarginInput(
                child: ListView.builder(
                  itemCount: horarios.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CheckboxListTile(
                      title: Text(horarios[index]),
                      activeColor: global.colorTheme["watergreen"] as Color,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                      value: horariosEscolhidos.contains(horarios[index]),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value!) {
                            horariosEscolhidos.add(horarios[index]);
                          } else {
                            horariosEscolhidos.remove(horarios[index]);
                          }
                        });
                      },
                    );
                  },
                ),
              ),
              Text(
                "Estilos musicais",
                style: global.styles.labelText(),
              ),
              SizedBox(
                width: double.infinity,
                child: FutureBuilder(
                  future: getMusicStylesCombination(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Erro: ${snapshot.error}');
                    } else {
                      if (snapshot.data!['ok']) {
                        global.musicStylesList = snapshot.data!['args'];
                        

                        List<Widget> textWidgets = [];

                        for (var music in global.musicStylesList) {
                          if (music['selected']) {
                            textWidgets.add(Container(
                              margin: const EdgeInsets.all(4),
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                  color: Color.fromARGB(255, 201, 201, 201)),
                              child: Text(
                                (music["obj"]['name']),
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xff515151)),
                              ),
                            ));
                          }
                          if (global.musicStylesList.last["obj"]["name"] ==
                              music["obj"]["name"]) {
                            textWidgets.add(GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const ModalEstilosMusicais();
                                  },
                                );
                              },
                              child: Container(
                                  margin: const EdgeInsets.all(4),
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(6)),
                                      color: global.colorTheme["watergreen"]
                                          as Color),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  )),
                            ));
                          }
                        }

                        // Agora você pode usar a lista de widgets como children do Row
                        return Wrap(
                          children: textWidgets,
                        );
                      } else {
                        return Text('Nenhuma música encontrada.');
                      }
                    }
                  },
                ),
              ),
              Text(
                "Descrição",
                style: global.styles.labelText(),
              ),
              MarginInput(
                // TODO mudar a cor da borda ou algo do tipo quando for focado
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
