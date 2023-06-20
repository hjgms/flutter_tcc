import 'package:flutter/material.dart';

//global
import 'package:flutter_application_firebase/global/variables.dart' as global;

class NotificationItem extends StatefulWidget {
  final String providerName;
  final String description;
  final String uid;
  
  const NotificationItem({
    super.key,
    required this.providerName,
    required this.description,
    required this.uid  
  });

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:10),
      child:GestureDetector(
        onTap: (){
          //navigate for perfil user notification
        },
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20)
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Color.fromARGB(25, 0, 0, 0),
                spreadRadius: 1
              )
            ]
          ),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.all(12),
          height: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: CircleAvatar(
                      backgroundColor: global.colorTheme["mainPurple"],
                    )
                  ),
                  Text(
                    widget.providerName,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),
                  )
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  widget.description,
                  style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                  ),
                ),
              )
            ],
          )
        ),
      )
    );
  }
}
