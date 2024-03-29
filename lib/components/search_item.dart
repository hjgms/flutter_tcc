import 'package:flutter/material.dart';
// import 'package:flutter_application_firebase/data/functions.dart';

//global
import 'package:flutter_application_firebase/global/variables.dart' as global;

//page
import 'package:flutter_application_firebase/pages/search_perfil_page.dart';

class SearchItem extends StatefulWidget {
  final String providerName;
  final String providerLastName;
  final String providerDescription;
  final String uid;

  const SearchItem(
      {super.key,
      required this.providerName,
      required this.providerLastName,
      required this.providerDescription,
      required this.uid,
});

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //navigate for perfil user notification
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return SearchPerfilPage(
              name: "${widget.providerName} ${widget.providerLastName}",
              description: widget.providerDescription,
              userUid: widget.uid,
              // estilosMusicais: widget.providerEstilosMusicais,
              username: "",
              // localization: widget.localization,
            );
          },
        ));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
                blurRadius: 3,
                color: Color.fromARGB(20, 0, 0, 0),
                spreadRadius: 1)
          ],
        ),
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: global.colorTheme["mainPurple"],
              child: Icon(Icons.person, color: global.colorTheme["color5"]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                widget.providerName,
                style: const TextStyle(color: Colors.black26, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
