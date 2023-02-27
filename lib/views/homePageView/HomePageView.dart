// ignore: file_names
import 'package:flutter/material.dart';

//page view
import '../mensagePageView/MensagePageView.dart';
import '../../widgets/postPersonWidget/PostPersonWidget.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {

  mensage(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => 
      const MensagePageView()
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
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
        children: [
          PostPersonWidget(
            imagePost: "",
            contentPost: "content",
            nameAuthor: "author",
          )
          // Container(
          //   margin: const EdgeInsets.all(10),
          //   color: Colors.amber,
          //   child: Column(
          //     children: [
          //       Row(
          //         children: const [
          //           Padding(
          //             padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          //             child: Icon(Icons.person),
          //           ),
          //           Text("author post")
          //         ],
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.all(1),
          //         child: Image.asset("assets/Icon-512.png")
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.all(10),
          //         child: Row(
          //           children:  [
          //             IconButton(
          //               onPressed: (){}, 
          //               icon: const Icon(Icons.favorite_border)
          //             ),
          //             const Text("comment for post")
          //           ],
          //         )
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}