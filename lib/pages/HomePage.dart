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
        backgroundColor: Colors.white70,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            height: 1,
            color: global.colorTheme["color3"],
          ),
        ),
        elevation: 0,
        toolbarHeight: 45,
        title: Text(
          "Feed",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: global.colorTheme["color2"]
          ),
        ),
        actions: [
          // mensages
          GestureDetector(
            onTap: (){},
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
              child: const Icon(
                Icons.messenger_outline_rounded,
                color: Colors.black12,
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