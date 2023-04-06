import 'package:flutter/material.dart';

//firebase
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_firebase/data/functions.dart';

//configs
import 'package:flutter_application_firebase/config/globalvariables.dart' as global;
import 'package:flutter_application_firebase/config/palette.dart';

//pages
import 'package:flutter_application_firebase/pages/homePage.dart';
import 'package:flutter_application_firebase/pages/profilePage.dart';
import 'package:flutter_application_firebase/pages/searchPage.dart';
import 'package:flutter_application_firebase/pages/settingsPage.dart';

class ProviderPage extends StatefulWidget {
  const ProviderPage({super.key});

  @override
  State<ProviderPage> createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  final PageController _pageController = PageController();

  //move inside pages
  void onPageChanged(int page) {
    setState(() {
      global.pageIndex = page;
      _pageController.jumpToPage(page);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "",
            tooltip: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: "",
            tooltip: "search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "",
            tooltip: "perfil",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "",
            tooltip: "config",
          )
        ],

        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedIconTheme: const IconThemeData(
          size: 20
        ),
        unselectedIconTheme: const IconThemeData(
          size: 20
        ),
        selectedItemColor: global.cor,
        unselectedItemColor: Colors.black12,
        backgroundColor: Colors.transparent,

        currentIndex: global.pageIndex,
        onTap: (page) => onPageChanged(page),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: getUser(global.credentialUser["user"].uid),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Probelmas no sistema"),
            );
          }
          
          if (snapshot.hasData) {
            return PageView(
              controller: _pageController,
              onPageChanged: (index) => onPageChanged(index),
              children: const <Widget> [
                HomePage(),
                SearchPage(),
                ProfilePage(),
                SettingsPage()
              ],
            );
          }

          return Center(
            child: CircularProgressIndicator(
              color: global.cor,
            )
          );
        },
      )
    );
  }
}
