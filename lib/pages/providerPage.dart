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
    return FutureBuilder(
      future: getUser(global.credentialUser["user"].uid),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("Problemas no sistema"),
          );
        }
        
        if (snapshot.hasData) {
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled),
                  activeIcon: Icon(Icons.home_filled),
                  label: "",
                  tooltip: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search_rounded),
                  activeIcon: Icon(Icons.search_rounded),
                  label: "",
                  tooltip: "Search",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  activeIcon: Icon(Icons.person),
                  label: "",
                  tooltip: "Perfil",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings_sharp),
                  activeIcon: Icon(Icons.settings_sharp),
                  label: "",
                  tooltip: "Config",
                )
              ],
              showUnselectedLabels: false,
              showSelectedLabels: false,
              selectedIconTheme: const IconThemeData(
                size: 24
              ),
              unselectedIconTheme: const IconThemeData(
                size: 24
              ),
              selectedItemColor: global.colorTheme["color1"],
              unselectedItemColor: global.colorTheme["color3"],
              backgroundColor: global.colorTheme["color5"],
              currentIndex: global.pageIndex,
              elevation: 0,
              onTap: (page) => onPageChanged(page),
            ),
            body: PageView(
              controller: _pageController,
              onPageChanged: (index) => onPageChanged(index),
              children: const <Widget> [
                HomePage(),
                SearchPage(),
                ProfilePage(),
                SettingsPage()
              ],
            ) 
          );
        }

        return Center(
          child: CircularProgressIndicator(
            color: global.colorTheme["color1"] as Color,
          )
        );
      },
    );
  }
}
