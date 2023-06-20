import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/components/publicationItem.dart';
import 'package:flutter_application_firebase/data/functions.dart';

//global
import 'package:flutter_application_firebase/global/variables.dart' as global;

//cache
import 'package:flutter_application_firebase/data/cache/cache.dart' as cache;

import '../enum/categorias_post.dart';

class PublicationItems extends StatefulWidget {
  const PublicationItems(
      {super.key,
      required this.contentEstilosMusicais,
      required this.contentHorario,
      required this.contentPagamento,
      required this.contentLocalizacao,
      required this.uidUser});
  final String uidUser;
  final List? contentEstilosMusicais;
  final String? contentHorario;
  final double? contentPagamento;
  final String? contentLocalizacao;

  @override
  State<PublicationItems> createState() => _PublicationItemsState();
}

class _PublicationItemsState extends State<PublicationItems> {
  TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        const Divider(
          color: Color(0xff535364),
          height: 3,
        ),
        const SizedBox(
          height: 14,
        ),
        PublicationItem(
            iconeNome: CategoriasPost.estilosMusicais,
            content: widget.contentEstilosMusicais?.join(", ")),
        const SizedBox(
          height: 8,
        ),
        PublicationItem(
            iconeNome: CategoriasPost.horario, content: widget.contentHorario),
        const SizedBox(
          height: 8,
        ),
        PublicationItem(
            iconeNome: CategoriasPost.pagamento,
            content: widget.contentPagamento),
        const SizedBox(
          height: 8,
        ),
        PublicationItem(
            iconeNome: CategoriasPost.localizacao,
            content: widget.contentLocalizacao),
        const SizedBox(
          height: 16,
        ),
        InkWell(
          onTap: () {
            showModal();
            // Navigator.of(context).push(
            //     MaterialPageRoute(
            //       builder: (context) => const TrabalhoDetalhes(),
            //     ),
            //   )
          },
          child: Container(
            decoration: BoxDecoration(
                color: global.colorTheme["mainPurple"] as Color,
                borderRadius: BorderRadius.circular(10)),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: const Center(
                child: Center(
              child: Text(
                "Quero ser contratado",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffECECEC)),
              ),
            )),
          ),
        )
      ],
    );
  }

  Future showModal() async {
    String uidUserCache = await cache.getCacheUserUid() ?? "";

    String nome = global.user["obj"]["name"];
    inputController.text = "Olá eu sou $nome, gostaria de ser contratado!";

    // ignore: use_build_context_synchronously
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          width: double.maxFinite,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                  title: const Text("Quero ser contratado", style: TextStyle(fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextField(
                    controller: inputController,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              BorderSide(color: Colors.black54, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(18)),
                          borderSide: BorderSide(
                              color:
                                  global.colorTheme["watergreen"] as Color,
                              width: 2)),
                    ),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    height: 40,
                    width: double.maxFinite,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: global.colorTheme["mainPurple"] as Color,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        'Enviar notificação',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  onTap: () {
                    Map obj = {
                      "name": global.user["obj"]["username"],
                      "description": inputController.text,
                      "providerUid": uidUserCache.trim(),
                      "userUid": widget.uidUser.trim()
                    };
                    sendNotification(obj);
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
