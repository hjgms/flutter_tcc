// ignore: file_names
import 'package:flutter/material.dart';

//global
import 'package:flutter_application_firebase/global/variables.dart' as global;

//functions
import 'package:flutter_application_firebase/data/functions.dart';

class SearchPerfilPage extends StatefulWidget {
  final String name;
  final String username;
  final String localization;
  final String description;
  final String userUid;

  const SearchPerfilPage({
    super.key,
    required this.name,
    required this.username,
    required this.localization,
    required this.description,
    required this.userUid,
  });

  @override
  State<SearchPerfilPage> createState() => _SearchPerfilPageState();
}

class _SearchPerfilPageState extends State<SearchPerfilPage> {
  Future<Map> obterEstilosMusicais() async {
    Map valores = await getMusicStylesCombination(
        idUsuario: widget.userUid); // Simulação de operação assíncrona
    return valores;
  }

  Future<Map> obterFreeHours() async {
    Map valores = await dataBase
        .collection("users")
        .doc(widget.userUid.toString().trim())
        .get()
        .then((value) {
      List data = value.data()!["musicStyles"];
      return typedReturn(true, data);
    }).catchError((e) {
      return typedReturn(false, []);
    });
    return valores;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          backgroundColor: global.colorTheme["mainPurple"] as Color,
          elevation: 2,
          toolbarHeight: 60),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black12,
                ),
                height: 190,
                width: double.maxFinite,
              ),
              Container(
                  margin: const EdgeInsets.only(top: 80),
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  height: 150,
                  width: double.maxFinite,
                  child: FutureBuilder(
                    future: getPhotoPerfil(widget.userUid, notSave: false),
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data!["ok"] == true) {
                        return CircleAvatar(
                          backgroundImage: NetworkImage(snapshot.data!["args"]),
                        );
                      } else if (snapshot.hasData &&
                          snapshot.data!["ok"] == false) {
                        return CircleAvatar(
                          backgroundColor: global.colorTheme["mainPurple"],
                          child: Icon(Icons.close,
                              color: global.colorTheme["color5"]),
                        );
                      } else if (snapshot.hasError) {
                        return CircleAvatar(
                          backgroundColor: global.colorTheme["mainPurple"],
                          child: Icon(Icons.person,
                              color: global.colorTheme["color5"]),
                        );
                      }
                      return CircleAvatar(
                        backgroundColor: global.colorTheme["mainPurple"],
                        child: Icon(Icons.person,
                            color: global.colorTheme["color5"]),
                      );
                    },
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Text(
                  widget.name,
                  style: global.styles.titulo(),
                ),
                const SizedBox(height: 4),
                Text(widget.localization),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Descrição",
                  style: global.styles.titulo(),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.description,
                  style: const TextStyle(fontSize: 14, height: 1.5),
                ),
                const SizedBox(height: 12),
                Text(
                  "Estilos musicais",
                  style: global.styles.titulo(),
                ),
                FutureBuilder<Map>(
                  future: obterEstilosMusicais(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text('Carregando...');
                    } else if (snapshot.hasError) {
                      return Text('Erro: ${snapshot.error}');
                    } else {
                      final valores = snapshot.data;
                      final textWidgets = <Widget>[];

                      for (var valor in valores!["args"]!) {
                        if (valor["selected"] == true) {
                          final name = valor["obj"]["name"];
                          textWidgets.add(Text(
                            '• $name',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ));
                        }
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: textWidgets,
                      );
                    }
                  },
                ),
                const SizedBox(height: 4),
                Text(
                  "Horários Disponíveis (Podem variar)",
                  style: global.styles.titulo(),
                ),
                const SizedBox(height: 4),
                // FutureBuilder<Map>(
                //   future: obterFreeHours(),
                //   builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
                //     if (snapshot.connectionState == ConnectionState.waiting) {
                //       return const CircularProgressIndicator(); // Exibindo um indicador de carregamento enquanto os dados estão sendo buscados
                //     }

                //     if (snapshot.hasError) {
                //       return const Text(
                //           'Erro ao obter os dados'); // Exibindo uma mensagem de erro, se ocorrer algum problema
                //     }

                //     if (snapshot.hasData) {
                //       Map valores = snapshot.data!;
                //       List musicStyles = valores['args'];

                //       return ListView.builder(
                //         itemCount: musicStyles.length,
                //         itemBuilder: (BuildContext context, int index) {
                //           String musicStyle = musicStyles[index]['musicStyle'];

                //           return Text(musicStyle);
                //         },
                //       );
                //     }

                //     return Container(); // Retorna um container vazio caso não haja dados
                //   },
                // ),
                const SizedBox(height: 12),
                Text(
                  "Imagens",
                  style: global.styles.titulo(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
