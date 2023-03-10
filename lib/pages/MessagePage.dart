import 'package:flutter/material.dart';

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
        backgroundColor: Colors.black87,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back,color:Colors.white),
        ),
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
                              child: Icon(Icons.person,color: Colors.black26),
                            ),
                            Text("Name User",
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