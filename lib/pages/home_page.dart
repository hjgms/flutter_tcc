// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/components/refresh_error.dart';
import 'package:flutter_application_firebase/data/functions.dart';

//page view
import 'package:flutter_application_firebase/pages/notification_page.dart';
import 'package:flutter_application_firebase/components/publication_home.dart';

//global
import 'package:flutter_application_firebase/global/variables.dart' as global;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scroll = ScrollController();
  bool _refresh = false;

  void mensage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const NotificationPage(
          description: "",
          providerName: ""
        )
      )
    );
  }

  addForList(){
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
    _scroll.addListener(addForList);
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
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const NotificationPage(
                  description: "",
                  providerName: ""
                ),
              ));
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
                Icons.notifications_outlined,
                color: global.colorTheme["color5"] as Color,
              ),
            ),
          ),
        ]
      ),
      body: RefreshIndicator(
        color: global.colorTheme["mainPurple"],
        onRefresh: () async {
          setState(() {
            global.publicationsFeed = [];
          });
          clearPublicationsCache();
          getPublicatiosHome(
            add: false,
            limit: 5,
            write: false
          );
        },
        child: createPublications()
      ),
    );
  }

  Widget createPublications() {
    return FutureBuilder(
      future: getPublicatiosHome(
        add: true,
        limit: 5,
        write: false
      ),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data["ok"] == true) {
            return Stack(
              children: [
                ListView.builder(
                  controller: _scroll,
                  padding: const EdgeInsets.only(
                    top: 30,
                    bottom: 60,                    
                  ),
                  itemCount: global.publicationsFeed.length,
                  itemBuilder: (context, index) {
                    return PublicationHome(
                      titlePublication: global.publicationsFeed[index]["obj"]["name"],
                      description: global.publicationsFeed[index]["obj"]["description"],
                      providerImagePerfil: global.publicationsFeed[index]["image"],
                      providerName: global.publicationsFeed[index]["nameProvider"],
                    );
                  },
                ),
                Container(
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
                )
              ],
            );
          } else if (snapshot.data["ok"] == false) {
            return const Center(
              child: Text("not found publications"),
            );
          }
        }
        if (snapshot.hasError) {
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
}
