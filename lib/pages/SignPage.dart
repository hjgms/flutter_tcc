import 'package:flutter/material.dart';

class SignPage extends StatefulWidget {
  const SignPage({super.key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  TextEditingController controllerInput1 = TextEditingController();
  TextEditingController controllerInput2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: ,
        leading: const Icon(Icons.arrow_back),
        title: const Text("Sign app")
      ),
      body: ListView(
        children: [
          Container(),
          TextField(
            controller: controllerInput1,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: ""
            ),
          ),
          TextField(
            controller: controllerInput2,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: ""
            ),
          ),
          GestureDetector(
            onTap: () {
              
            },
            child: Container(
              height: 40,
              width: 180,
              decoration: const BoxDecoration(
                color: Colors.black
              ),
            ),
          )
        ],
      ),
    );
  }
}