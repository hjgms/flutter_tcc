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
        backgroundColor: Colors.blue.shade50,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back,color:Colors.black26),
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