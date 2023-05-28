import 'package:flutter/material.dart';

//firebase
import 'package:flutter_application_firebase/data/functions.dart';

//global
import 'package:flutter_application_firebase/global/variables.dart' as global;

//pages
import 'package:flutter_application_firebase/pages/profile_page.dart';
import 'package:flutter_application_firebase/pages/search_page.dart';
import 'package:flutter_application_firebase/pages/settings_page.dart';
import 'package:flutter_application_firebase/pages/home_page.dart';

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
      future: getUser(global.user["uid"]),
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
                border: Border(
                  top: BorderSide(
                    color: global.colorTheme["watergreen"] as Color,
                    width: 2
                  )
                )
              ),
              child: BottomNavigationBar(
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
                    tooltip: "Configs",
                  )
                ],
                showUnselectedLabels: false,
                showSelectedLabels: false,
                selectedIconTheme: const IconThemeData(size: 24),
                unselectedIconTheme: const IconThemeData(size: 24),
                selectedItemColor: global.colorTheme["mainPurple"],
                unselectedItemColor: global.colorTheme["color4"],
                backgroundColor: global.colorTheme["color5"],
                currentIndex: global.pageIndex,
                elevation: 0,
                onTap: (page) => onPageChanged(page),
              ),
            ),
            body: PageView(
              controller: _pageController,
              onPageChanged: (index) => onPageChanged(index),
              children: const <Widget>[
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
          color: global.colorTheme["mainPurple"] as Color,
        ));
      },
    );
  }
}
