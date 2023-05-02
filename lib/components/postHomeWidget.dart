// ignore: file_names
import 'package:flutter/material.dart';

class PostHomeWidget extends StatefulWidget {
  String namePublication = "Exemple";
  PostHomeWidget({super.key, required namePublication});

  @override
  State<PostHomeWidget> createState() => _PostHomeWidgetState();
}

class _PostHomeWidgetState extends State<PostHomeWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.maxFinite,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            color: Colors.black12,
            spreadRadius: 5
          )
        ],
        color: Colors.black12
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)
            ),
            margin: const EdgeInsets.all(10),
            height: 300,
            width: double.maxFinite,
            child: const Placeholder(),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Text("${widget.namePublication}",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ],
            ), 
          )
        ],
      ),
    );
  }
}