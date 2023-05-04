// ignore: file_names
import 'package:flutter/material.dart';

class PostHomeWidget extends StatefulWidget {
  String? namePublication;
  String? description;
  PostHomeWidget({super.key, @required this.namePublication, @required this.description});

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
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black12,
            spreadRadius: 2
          )
        ],
        color: Colors.white60
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("${widget.namePublication}",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("${widget.description}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                )
              ],
            ), 
          )
        ],
      ),
    );
  }
}