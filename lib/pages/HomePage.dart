// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/data/functions.dart';

//page view
import 'package:flutter_application_firebase/pages/MessagePage.dart';
import 'package:flutter_application_firebase/components/postHomeWidget.dart';

//configs
import 'package:flutter_application_firebase/config/globalvariables.dart' as global;

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

  createPublications(){
    if(global.publicationsFeed.length > 0){
      List<Widget> publi = [];
      for (var element in global.publicationsFeed) {
        publi.add(
          PostHomeWidget(
            namePublication: element["obj"]["name"],
          )
        );
      }
      return ListView(
        controller: _scroll,
        padding: const EdgeInsets.symmetric(vertical: 30),
        children: publi
      );
    }else{
      return FutureBuilder(
        future: getPublication(global.user["uid"]),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            if(snapshot.data["ok"] == true){
              List<Widget> publi = [];
              for (var element in global.publicationsFeed) {
                publi.add(
                  PostHomeWidget(
                    namePublication: element["obj"]["name"],
                  )
                );
              }
              return ListView(
                padding: const EdgeInsets.symmetric(vertical: 30),
                children: publi
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
              color: global.colorTheme["color1"],
            ),
          );
        },
      );
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: global.colorTheme["color1"] as Color,
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
}