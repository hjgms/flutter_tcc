import 'package:flutter/material.dart';
// import 'package:flutter_application_firebase/components/publicationItem.dart';
import 'package:flutter_application_firebase/components/publicationItems.dart';
// import 'package:flutter_application_firebase/enum/categorias_post.dart';

//global
import 'package:flutter_application_firebase/global/variables.dart' as global;

import '../estended_text.dart';

class PublicationHome extends StatefulWidget {
  final String titlePublication;
  final String description;
  final String providerName;
  final String providerImagePerfil;
  final List? estilosMusicais;
  final String? enderecotrabaho;
  final String? horasdetrabalho;
  final double? valorpagamento;
  final String uidUser;

  const PublicationHome(
      {super.key,
      required this.titlePublication,
      required this.description,
      required this.providerName,
      required this.estilosMusicais,
      required this.enderecotrabaho,
      required this.horasdetrabalho,
      required this.valorpagamento,
      required this.providerImagePerfil,
      required this.uidUser
    });

  @override
  State<PublicationHome> createState() => _PublicationHomeState();
}

class _PublicationHomeState extends State<PublicationHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                blurRadius: 10,
                color: Color.fromARGB(20, 0, 0, 0),
                spreadRadius: 1)
          ],
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(bottom: 5, left: 10, right: 5, top: 5),
            child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: global.colorTheme["mainPurple"] as Color,
                  foregroundColor: global.colorTheme["mainPurple"] as Color,
                  // backgroundImage: AssetImage(
                  //   "${widget.providerImagePerfil}",
                  // ),
                ),
                contentPadding: const EdgeInsets.all(0),
                title: Text(widget.providerName,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.black87))),
          ),
          Container(
              color: Colors.black87,
              height: 250,
              margin: const EdgeInsets.symmetric(horizontal: 0),
              width: double.maxFinite,
              child: widget.providerImagePerfil != ""
                  ? Image.network(widget.providerImagePerfil)
                  : Placeholder(
                      color: global.colorTheme["clearMainPurple"] as Color,
                    )),
          Padding(
            padding: const EdgeInsets.all(15),
            child: ExpandableText(
              text: widget.description,
              maxLines: 2,
              style: const TextStyle(fontSize: 14),
              contentBelow: PublicationItems(
                contentEstilosMusicais: widget.estilosMusicais,
                contentHorario: widget.horasdetrabalho,
                contentPagamento: widget.valorpagamento,
                contentLocalizacao: widget.enderecotrabaho,
                uidUser: widget.uidUser,
              ),
            ),
          )
        ],
      ),
    );
  }
}
