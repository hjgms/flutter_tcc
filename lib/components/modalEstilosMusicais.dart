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
                child: ListView.builder(
                  itemCount: global.musicStylesList.length,
                  itemBuilder: (context, index) {
                    Map estiloMusical = global.musicStylesList[index];
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
                        value: estiloMusical["selected"],
                        onChanged: (bool? value) {
                          setState(() {
                            if (value!) {
                              estiloMusical["selected"] = true;
                            } else {
                              estiloMusical["selected"] = false;
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
                )
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
                onTap: () {
                  //save function code
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