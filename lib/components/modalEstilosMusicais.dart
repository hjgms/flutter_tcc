import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/data/functions.dart';

//global
import 'package:flutter_application_firebase/global/variables.dart' as global;

class ModalEstilosMusicais extends StatefulWidget {
  const ModalEstilosMusicais({
    Key? key,
  }) : super(key: key);

  @override
  State<ModalEstilosMusicais> createState() => _ModalEstilosMusicaisState();
}

class _ModalEstilosMusicaisState extends State<ModalEstilosMusicais> {
  Divider dividerModalEstilosMusicais = const Divider(
    height: 2,
    color: Color(0xffD9D9D9),
  );

  List<String> estilosMusicaisSelecionados = ["Rock", "Funk", "Sertanejo"];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Column(
        children: [
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
                fontSize: 13),
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 0),
      content: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.maxFinite,
              height: 200,
              child: DefaultTextStyle.merge(
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xff202020),
                  fontWeight: FontWeight.w400,
                ),
                child: FutureBuilder<Map<dynamic, dynamic>>(
                  future: getMusicStylesCombination(),
                  builder: (BuildContext context, AsyncSnapshot<Map<dynamic, dynamic>> snapshot) {
                    if (snapshot.hasData && snapshot.data!["ok"] == true) {
                      print(snapshot.data);
                      return ListView.builder(
                        itemCount: snapshot.data!["args"].length,
                        itemBuilder: (context, index) {
                          Map estiloMusical = snapshot.data!["args"][index];
                          return Theme(
                            data: Theme.of(context).copyWith(
                              checkboxTheme: CheckboxThemeData(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    4.0,
                                  ),
                                ),
                              ),
                            ),
                            child: CheckboxListTile(
                              title: Text(estiloMusical["obj"]["name"]),
                              value: estilosMusicaisSelecionados.contains(estiloMusical["obj"]["name"]),
                              onChanged: (bool? value) {
                                setState(() {
                                  if (value!) {
                                    estilosMusicaisSelecionados.add(estiloMusical["obj"]["name"]);
                                  } else {
                                    estilosMusicaisSelecionados.remove(estiloMusical["obj"]["name"]);
                                  }
                                });
                              },
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, 
                                horizontal: 16
                              ),
                              dense: false,
                              activeColor: global.colorTheme["mainPurple"] as Color,
                              selectedTileColor: Colors.grey.shade500,
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasData && snapshot.data!["ok"] == false) {
                      return const Center(
                        child: Text("ocorreu algum problema")
                      );
                    } else if (snapshot.hasError) {
                      return Text('Erro: ${snapshot.error} ${snapshot.data}');
                    } 

                    return Center(
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: CircularProgressIndicator(
                          color: global.colorTheme["mainPurple"],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
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
                        offset: Offset(0, 4)
                      ),
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    color: Colors.grey.shade300
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 8, 
                    horizontal: 30
                  ),
                  child: Text(
                    "Cancelar",
                    style: TextStyle(
                      color: Colors.grey.shade700
                    ),
                  ),
                )
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(43, 70, 70, 70),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 4)
                      ),
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    color: global.colorTheme["mainPurple"] as Color
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                  child: const Text(
                    "Confirmar",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ),
            ],
          ),
        ),
      ],
    );
  }
}

  // [
  //   Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       const Flexible(child: Text("Nome do ")),
  //       Flexible(
  //         child:
  //             Checkbox(value: true, onChanged: (bool) {}),
  //       )
  //     ],
  //   ),
  // ],


  // FutureBuilder<List<dynamic>>(
  //               future: getEstilosMusicais(),
  //               builder: (BuildContext context,
  //                   AsyncSnapshot<List<dynamic>> snapshot) {
  //                 if (snapshot.connectionState == ConnectionState.waiting) {
  //                   return CircularProgressIndicator();
  //                 } else if (snapshot.hasError) {
  //                   return Text('Erro: ${snapshot.error}');
  //                 } else if (snapshot.hasData) {
  //                   List<dynamic> data = snapshot.data ?? [];
  //                   return Container(
  //                     // Especificar um tamanho para o container
  //                     height: 200, // Defina um valor adequado aqui
  //                     child: ListView.builder(
  //                       itemCount: data.length,
  //                       itemBuilder: (BuildContext context, int index) {
  //                         return ListTile(
  //                           title: Text(data[index]['name']),
  //                           // Outros campos do documento podem ser acessados usando data[index]['nomeDoCampo']
  //                         );
  //                       },
  //                     ),
  //                   );
  //                 } else {
  //                   return Text('Sem dados disponíveis.');
  //                 }
  //               },
  //             ),