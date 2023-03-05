// ignore: file_names
import 'package:flutter/material.dart';

//page view
import 'package:flutter_application_firebase/pages/MessagePage.dart';
import 'package:flutter_application_firebase/views/postPersonWidget.dart';


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
        leading: IconButton(
          onPressed: (){}, 
          icon: const Icon(Icons.notifications)
        ),
        title: const Text("Feed"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: mensage, 
            style: IconButton.styleFrom(
              backgroundColor: Colors.black
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            icon: const Icon(Icons.sms)
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