import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/components/publicationItem.dart';
//global
import 'package:flutter_application_firebase/global/variables.dart' as global;
import '../enum/categorias_post.dart';

class PublicationItems extends StatefulWidget {
  const PublicationItems(
      {super.key,
      required this.contentEstilosMusicais,
      required this.contentHorario,
      required this.contentPagamento,
      required this.contentLocalizacao});
  final String contentEstilosMusicais;
  final String contentHorario;
  final String contentPagamento;
  final String contentLocalizacao;

  @override
  State<PublicationItems> createState() => _PublicationItemsState();
}

class _PublicationItemsState extends State<PublicationItems> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(
          color: Color(0xff535364),
          height: 2,
        ),
        const SizedBox(
          height: 8,
        ),
        PublicationItem(
            iconeNome: CategoriasPost.estilosMusicais,
            content: widget.contentEstilosMusicais),
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
        GestureDetector(
          child: Container(
            decoration: BoxDecoration(
                color: global.colorTheme["mainPurple"] as Color,
                borderRadius: BorderRadius.circular(10)),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: const Center(
                child: Text(
              "Ver detalhes",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffECECEC)),
            )),
          ),
        )
      ],
    );
  }
}
// "18:00 - 00:00 (6 horas)"
// Bairro Santa Lurdes - Marília - SP  (10 km de você)