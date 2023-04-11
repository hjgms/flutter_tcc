// ignore: file_names
import 'package:flutter/material.dart';

//page view
import 'package:flutter_application_firebase/pages/MessagePage.dart';
import 'package:flutter_application_firebase/components/postHomeWidget.dart';
import 'package:flutter_svg/flutter_svg.dart';


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
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 80,
        title:  Container(
          height: 60,
          width: double.maxFinite,
          margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black87
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // notification
              GestureDetector(
                onTap: (){},
                child: Container(
                  alignment: Alignment.center,
                  child: const Icon(Icons.notifications_none),
                ),
              ),
              // title
              const Text("feed"),
              // mensages
              GestureDetector(
                onTap: (){},
                child: Container(
                  alignment: Alignment.center,
                  child: const Icon(Icons.messenger_outline_rounded),
                ),
              ),
            ],
          )
        ),
        centerTitle: true,
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