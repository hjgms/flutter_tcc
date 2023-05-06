// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/data/functions.dart';

//page view
import 'package:flutter_application_firebase/pages/MessagePage.dart';
import 'package:flutter_application_firebase/components/postHomeWidget.dart';

//configs
import 'package:flutter_application_firebase/globals/variables.dart' as global;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scroll = ScrollController();

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
        backgroundColor: global.colorTheme["mainPurple"] as Color,
        elevation: 2,
        toolbarHeight: 60,
        title: Text(
          "Feed",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: global.colorTheme["color5"] as Color
          ),
        ),
        actions: [
          // mensages
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MessagePage(), 
                )
              );
            },
            child: Container(
              height: 45,
              width: 45,
              padding: const EdgeInsets.symmetric(
                vertical: 10
              ),
              margin: const EdgeInsets.symmetric(
                horizontal: 5,
              ),
              alignment: Alignment.center,
              child: Icon(
                Icons.notifications_outlined,
                color: global.colorTheme["color5"] as Color,
              ),
            ),
          ),
        ]
      ),
      body: createPublications()
    );
  }

  Widget createPublications(){
    return FutureBuilder(
      future: getPublication(true),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.hasData){
          if(snapshot.data["ok"] == true){
            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 30),
              itemCount: global.publicationsFeed.length,
              itemBuilder: (context, index) {
                return PostHomeWidget(
                  titlePublication: global.publicationsFeed[index]["obj"]["name"],
                  description: global.publicationsFeed[index]["obj"]["description"],
                  providerImagePerfil: "",
                  providerName: global.publicationsFeed[index]["nameProvider"],
                );
              },
            );
          }else if(snapshot.data["ok"] == false){
            return const Center(
              child: Text("not found publications"),
            );
          }
        }
        if(snapshot.hasError){
          return const Center(
            child: Text("error"),
          );
        }
        return Center(
          child: CircularProgressIndicator(
            color: global.colorTheme["mainPurple"],
          ),
        );
      },
    );
  }
}
