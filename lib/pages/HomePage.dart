// ignore: file_names
import 'package:flutter/material.dart';

//page view
import 'package:flutter_application_firebase/pages/MessagePage.dart';
import 'package:flutter_application_firebase/components/postHomeWidget.dart';
import 'package:flutter_svg/flutter_svg.dart';

//configs
import 'package:flutter_application_firebase/config/globalvariables.dart' as global;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void mensage(){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const MessagePage()
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: global.colorTheme["color1"] as Color,
        elevation: 2,
        toolbarHeight: 45,
        title: Text(
          "Feed",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: global.colorTheme["color5"] as Color
          ),
        ),
        actions: [
          // mensages
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MessagePage(), 
                )
              );
            },
            child: Container(
              height: 45,
              width: 45,
              padding: const EdgeInsets.symmetric(
                vertical: 10
              ),
              margin: const EdgeInsets.symmetric(
                horizontal: 5,
              ),
              alignment: Alignment.center,
              child: Icon(
                Icons.messenger_outline_rounded,
                color: global.colorTheme["color5"] as Color,
              ),
            ),
          ),
        ]
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 40),
        children: [
          // PostHomeWidget(
          //   contentPost: "content",
          //   nameAuthor: "author",
          // ),
          // PostHomeWidget(
          //   contentPost: "content",
          //   nameAuthor: "author",
          // ),
          // PostHomeWidget(
          //   contentPost: "content",
          //   nameAuthor: "author",
          // )
        ],
      ),
    );
  }
}