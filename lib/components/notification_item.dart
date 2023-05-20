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
    return GestureDetector(
      onTap: (){
        //navigate for perfil user notification
      },
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        height: 60,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CircleAvatar(
                    backgroundColor: global.colorTheme["mainPurple"],
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
            Text(
              widget.description,
              style: const TextStyle(
                color: Colors.black26,
                fontSize: 18
              ),
            )
          ],
        )
      ),
    );
  }
}