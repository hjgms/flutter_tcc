import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//configs
import 'package:flutter_application_firebase/globals/variables.dart' as global;

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: global.colorTheme["color1"] as Color,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back,color: global.colorTheme["color5"] as Color),
        ),
        title: const Text("Notifícations"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context){
                    return Scaffold(
                      appBar: AppBar(
                        elevation: 1,
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: Icon(Icons.circle,color: Colors.black26),
                            ),
                            Text("new provider",
                              style: TextStyle(
                                color: Colors.black26
                              ),
                            )
                          ],
                        ),
                      ),
                      body: Column(
                        children: [
                        ],
                      ),
                    );
                  } 
                )
              );
            },
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(Icons.person,color: Colors.black26)
                  ),
                  Text("User Name",
                    style: TextStyle(
                      color: Colors.black26
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
