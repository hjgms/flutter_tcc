// ignore: file_names
import 'package:flutter/material.dart';

class PostHomeWidget extends StatefulWidget {
  final titlePublication;
  final description;
  final providerName;
  final providerImagePerfil;

  const PostHomeWidget({
    super.key, 
    @required this.titlePublication, 
    @required this.description, 
    @required this.providerName,
    @required this.providerImagePerfil
  });

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
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(
                "${widget.providerImagePerfil}",
              ),
            ),
            contentPadding: EdgeInsets.all(0),
            title: Text(
              "${widget.providerName}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)
            ),
            margin: const EdgeInsets.all(20),
            height: 250,
            width: double.maxFinite,
            child: const Placeholder(
              //providerImagePerfil
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("${widget.titlePublication}",
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
                ),
                // GestureDetector(
                //   onTap: (){

                //   },
                //   child: Container(
                //     height: 40,
                //     width: double.maxFinite,
                //     decoration: BoxDecoration(
                //       color: Colors.black54,
                //       borderRadius: BorderRadius.circular(20)
                //     ),
                //     child: Text("connect"),
                //   )
                // )
              ],
            ), 
          )
        ],
      ),
    );
  }
}
