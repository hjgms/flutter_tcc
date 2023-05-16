import 'package:flutter/material.dart';

//global
import 'package:flutter_application_firebase/global/variables.dart' as global;

class NotificationPage extends StatefulWidget {
  final String providerName;
  final String description;
  
  const NotificationPage({
    super.key, 
    required this.providerName, 
    required this.description
  });

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: global.colorTheme["mainPurple"] as Color,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: global.colorTheme["color5"] as Color
          ),
        ),
        title: const Text("Notifícations"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: (){},
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
          )
        ],
      ),
    );
  }
}
