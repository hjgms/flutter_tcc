import 'package:flutter/material.dart';

//global
import 'package:flutter_application_firebase/global/variables.dart' as global;

class PublicationHome extends StatefulWidget {
  final String titlePublication;
  final String description;
  final String providerName;
  final String providerImagePerfil;

  const PublicationHome({
    super.key, 
    required this.titlePublication, 
    required this.description, 
    required this.providerName,
    required this.providerImagePerfil
  });

  @override
  State<PublicationHome> createState() => _PublicationHomeState();
}

class _PublicationHomeState extends State<PublicationHome> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 430,
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 15
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            color: Color.fromARGB(20, 0, 0, 0),
            spreadRadius: 1
          )
        ],
        color: Colors.white
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 5,
              left: 10,
              right: 5,
              top: 5
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: global.colorTheme["mainPurple"] as Color,
                foregroundColor: global.colorTheme["mainPurple"] as Color,
                // backgroundImage: AssetImage(
                //   "${widget.providerImagePerfil}",
                // ),
              ),
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                widget.providerName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ), 
          ),
          Container(
            decoration:  BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(5)
            ),
            height: 250,
            margin: const EdgeInsets.symmetric(
              horizontal: 10
            ),
            width: double.maxFinite,
            child: Image.network(
              widget.providerImagePerfil
            )
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.titlePublication,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      widget.description,
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
