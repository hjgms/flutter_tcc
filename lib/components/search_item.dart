import 'package:flutter/material.dart';

//global
import 'package:flutter_application_firebase/global/variables.dart' as global;

class SearchItem extends StatefulWidget {
  final String providerName;
  final String providerImage;
  final String uid;
  
  const SearchItem({
    super.key,
    required this.providerName,
    required this.providerImage,
    required this.uid
  });

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //navigate for perfil user notification
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              blurRadius: 10,
              color: Color.fromARGB(20, 0, 0, 0),
              spreadRadius: 1
            )
          ],
        ),
        margin: const EdgeInsets.symmetric(vertical: 2.5),
        padding: const EdgeInsets.all(5),
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: CircleAvatar(
                backgroundColor: global.colorTheme["mainPurple"],
                backgroundImage: widget.providerImage != "" ? NetworkImage( widget.providerImage ) : null
              )
            ),
            Text(
              widget.providerName,
              style: const TextStyle(
                color: Colors.black26,
                fontSize: 22
              ),
            )
          ],
        ),
      ),
    );
  }
}