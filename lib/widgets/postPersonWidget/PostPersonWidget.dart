// ignore: file_names
import 'package:flutter/material.dart';

class PostPersonWidget extends StatefulWidget {
  String nameAuthor = "";
  String contentPost = "";
  Image imagePost = Image.asset("");
  PostPersonWidget({super.key, nameAuthor, contentPost, imagePost});

  @override
  State<PostPersonWidget> createState() => _PostPersonWidgetState();
}

class _PostPersonWidgetState extends State<PostPersonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      color: Colors.amber,
      child: Column(
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Icon(Icons.person),
              ),
              Text(widget.nameAuthor)
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(1),
            child: Image.asset("${widget.imagePost}")
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children:  [
                IconButton(
                  onPressed: (){}, 
                  icon: const Icon(Icons.favorite_border)
                ),
                Text(widget.contentPost)
              ],
            )
          ),
        ],
      ),
    );
  }
}