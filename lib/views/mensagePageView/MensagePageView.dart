import 'package:flutter/material.dart';

class MensagePageView extends StatefulWidget {
  const MensagePageView({super.key});

  @override
  State<MensagePageView> createState() => _MensagePageViewState();
}

class _MensagePageViewState extends State<MensagePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back,color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.amber,
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(Icons.person)
                ),
                Text("User Name")
              ],
            ),
          ),
          Container(
            color: Colors.amber,
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(Icons.person)
                ),
                Text("User Name")
              ],
            ),
          )
        ],
      ),
    );
  }
}