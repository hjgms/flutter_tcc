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
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.only(
                  topLeft:Radius.circular(30),
                  topRight: Radius.circular(30)
                )
              ),
              padding: const EdgeInsets.all(10),
              child: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled),
                    label: "",
                    tooltip: "home",
                    backgroundColor: Colors.transparent,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search_rounded),
                    label: "",
                    tooltip: "search",
                    backgroundColor: Colors.transparent,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: "",
                    tooltip: "perfil",
                    backgroundColor: Colors.transparent,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: "",
                    tooltip: "config",
                    backgroundColor: Colors.transparent,
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
                selectedItemColor: global.cor,
                unselectedItemColor: Colors.white60,
                backgroundColor: Colors.transparent,
                currentIndex: global.pageIndex,
                elevation: 0,
                landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
                onTap: (page) => onPageChanged(page),
              ),
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
            color: global.cor,
          )
        );
      },
    );
  }
}
