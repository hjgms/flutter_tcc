// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/components/refresh_error.dart';
import 'package:flutter_application_firebase/data/functions.dart';

//page view
// import 'package:flutter_application_firebase/pages/notification_page.dart';
import 'package:flutter_application_firebase/components/publication_home.dart';

//global
import 'package:flutter_application_firebase/global/variables.dart' as global;
// import 'package:flutter_application_firebase/pages/sign_page.dart';

import 'notification_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scroll = ScrollController();
  bool _refresh = false;

  void addPublicationsList() {
    if(_scroll.position.pixels == _scroll.position.maxScrollExtent){
      setState(() {
        _refresh = true;

        getPublicatiosHome(
          add: true,
          limit: global.publicationsFeed.length + 5,
          write: true,
          scrolled: true
        ).whenComplete((){
          setState(() {
            _refresh = false;
          });
        });
        
      });
    }
  }

  @override
	void initState(){
		super.initState();
    _scroll.addListener(addPublicationsList);
	}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: global.colorTheme["mainPurple"] as Color,
        elevation: 0,
        toolbarHeight: 60,
        title: Text(
          "Início",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: global.colorTheme["color5"] as Color
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              loadNotificationPage();
            },
            child: Container(
              height: 45,
              width: 45,
              padding: const EdgeInsets.symmetric(vertical: 10),
              margin: const EdgeInsets.symmetric(
                horizontal: 5,
              ),
              alignment: Alignment.center,
              child: Icon(
                global.notificationList.isNotEmpty ?
                  Icons.notifications_on
                  : 
                  Icons.notifications,
                color: global.colorTheme["color5"] as Color,
                size: 24,
              ),
            ),
          ),
        ]
      ),
      body: RefreshIndicator(
        color: global.colorTheme["mainPurple"],
        onRefresh: () async {
          //clear publications
          setState(() {
            global.publicationsFeed = [];
            clearPublicationsCache();
          });
          
          //get publicatioins
          getPublicatiosHome(limit: 5);
        },
        child: createPublications()
      ),
    );
  }

  Widget createListPublications(ScrollController scroll, List publi){
    return ListView.builder(
      controller: scroll,
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 15,
        bottom: 60,                    
      ),
      itemCount: publi.length,
      itemBuilder: (context, index) {
        return PublicationHome(
          //adicionados posteriormente
          enderecotrabaho: publi[index]["obj"]["enderecotrabalho"],
          horasdetrabalho: publi[index]["obj"]["horasdetrabalho"],
          valorpagamento: publi[index]["obj"]["valorpagamento"],
          estilosMusicais: publi[index]["obj"]["estilosmusicais"],
          //padrão
          uidUser: publi[index]["obj"]["userUid"],
          titlePublication: publi[index]["obj"]["name"],
          description: publi[index]["obj"]["description"],
          providerImagePerfil: publi[index]["image"],
          providerName: publi[index]["nameProvider"],
          
        );
      },
    );
  }

  Widget refreshBottomItem(){
    return Container(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 50,
        width: 50,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: _refresh ? CircularProgressIndicator(
            color: global.colorTheme["mainPurple"] as Color,
          ) : null, 
        )
      ),
    );
  }

  Widget createPublications() {
    return FutureBuilder(
      future: getPublicatiosHome(
        add: true,
        limit: 5
      ),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data["ok"] == true) {
            return Stack(
              children: [
                createListPublications(_scroll, global.publicationsFeed),
                refreshBottomItem()
              ],
            );
          } else if (snapshot.data["ok"] == false) {
            return const Center(
              child: Text("not found publications"),
            );
          }
        }
        else if (snapshot.hasError) {
          return RefreshError(
            onTapRefresh: (value){
              if(value) {
                getPublicatiosHome(
                  add: true,
                  limit: 5,
                  write: false
                );
              }
            }, 
            titleError: "Server connection error!"
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

  Future loadNotificationPage() async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FutureBuilder(
          future: getNotification(global.user["uid"]),
          builder: (context, snapshot) {
            if(snapshot.hasData && snapshot.data!["ok"] == true){
              return NotificationPage(
                notificationList: snapshot.data!["args"]
              );
            }else{
              return const NotificationPage(
                notificationList: []
              );
            }
          },
        )
      )
    );
  }
}