// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostHomeWidget extends StatefulWidget {
  String nameAuthor ="Rodrigo dela cruz";
  String contentPost ="Meu mundo";
  Widget imagePost = const Placeholder();
  PostHomeWidget({super.key, required String nameAuthor,required String contentPost, imagePost});

  @override
  State<PostHomeWidget> createState() => _PostHomeWidgetState();
}

class _PostHomeWidgetState extends State<PostHomeWidget> {
  var _liked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            color: Colors.black12,
            spreadRadius: 0.5
          )
        ]
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child: Icon(Icons.person)
                ),
                Text(widget.nameAuthor,
                  style: const TextStyle(
                    color: Colors.black26
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onDoubleTap: (){
              setState(() {
                if(_liked){
                  _liked = false;
                }else{
                  _liked = true;
                }
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(1),
              child: widget.imagePost
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children:  [
                IconButton(
                  onPressed: (){
                    setState(() {
                      if(_liked){
                        _liked = false;
                      }else{
                        _liked = true;
                      }
                    });
                  }, 
                  icon: Icon(
                    Icons.person,
                    color: _liked == true? Colors.red.shade400 : Colors.black26
                  ),
                ),
                Text(widget.contentPost,
                  style: const TextStyle(
                    color: Colors.black26
                  ),
                )
              ],
            )
          ),
        ],
      ),
    );
  }
}