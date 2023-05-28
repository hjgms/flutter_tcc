import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/enum/categorias_post.dart';

//global
import 'package:flutter_application_firebase/global/variables.dart' as global;

class PublicationItem extends StatefulWidget {

  final CategoriasPost? iconeNome;
  final String? content;
  const PublicationItem({super.key, this.iconeNome, this.content});

  @override
  State<PublicationItem> createState() => _PbvlicationItemState();
}

class _PbvlicationItemState extends State<PublicationItem> {
  @override
  Widget build(BuildContext context) {
    IconData icone = Icons.square_foot_rounded;
    switch (widget.iconeNome) {
      case CategoriasPost.estilosMusicais:
        icone = Icons.music_note_rounded;
        break;
      case CategoriasPost.horario:
        icone = Icons.access_time_filled;
        break;
      case CategoriasPost.pagamento:
        icone = Icons.attach_money_rounded;
        break;
      case CategoriasPost.localizacao:
        icone = Icons.location_city_rounded;
        break;
      default:
    }
    return Row(
      children: [
        Icon(
          icone,
          color: global.colorTheme["clearMainPurple"] as Color,
        ),
        const SizedBox(width: 8.0),
        Flexible(
          child: Text(
            widget.content?? "",
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
