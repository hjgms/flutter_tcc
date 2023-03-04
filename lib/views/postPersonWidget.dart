// ignore: file_names
import 'package:flutter/material.dart';

class PostPersonWidget extends StatefulWidget {
  String nameAuthor ="";
  String contentPost ="";
  String imagePost = "../../assets/image_post1.jpg";
  PostPersonWidget({super.key, required String nameAuthor,required String contentPost, imagePost});

  @override
  State<PostPersonWidget> createState() => _PostPersonWidgetState();
}

class _PostPersonWidgetState extends State<PostPersonWidget> {
  var _liked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black12,
            spreadRadius: 1
          ),
        ]
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Icon(Icons.person, color: Colors.black26),
              ),
              Text(widget.nameAuthor,
                style: const TextStyle(
                  color: Colors.black26
                ),
              )
            ],
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
              child: Image.asset(widget.imagePost)
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
                  icon: Icon( _liked == true? 
                    Icons.favorite : Icons.favorite_border,
                     color: _liked == true? Colors.red.shade400 : Colors.black26  
                  )
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