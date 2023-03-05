// ignore: file_names
import 'package:flutter/material.dart';

//page view
import 'package:flutter_application_firebase/pages/MessagePage.dart';
import 'package:flutter_application_firebase/views/postPersonWidget.dart';
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
        elevation: 2,
        toolbarHeight: 70,
        title: const Text("Feed"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: mensage, 
            style: IconButton.styleFrom(
              backgroundColor: Colors.black
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            icon: SvgPicture.asset(
              "../../assets/icons/comentarios.svg",
              color: Colors.white,
            )
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 40),
        children: [
          PostPersonWidget(
            contentPost: "content",
            nameAuthor: "author",
          ),
          PostPersonWidget(
            contentPost: "content",
            nameAuthor: "author",
          ),
          PostPersonWidget(
            contentPost: "content",
            nameAuthor: "author",
          )
        ],
      ),
    );
  }
}