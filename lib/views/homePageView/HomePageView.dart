// ignore: file_names
import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            onPressed: (){
            }, 
            style: IconButton.styleFrom(
              backgroundColor: Colors.black
            ),
            icon: const Icon(Icons.person)
          )
        ],
      ),
    );
  }
}