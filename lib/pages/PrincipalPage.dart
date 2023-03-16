import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/config/functionsback.dart';

//view page
import 'package:flutter_application_firebase/pages/HomePage.dart';
import 'package:flutter_application_firebase/pages/ProfilePage.dart';
import 'package:flutter_application_firebase/pages/SearchPage.dart';
import 'package:flutter_application_firebase/pages/settingsPage.dart';
import 'package:flutter_application_firebase/config/globalvariables.dart' as global;
import 'package:flutter_application_firebase/palette.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({super.key});

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {

  final PageController _pageController = PageController();

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
        showUnselectedLabels: false,
        showSelectedLabels: false,
        backgroundColor: Colors.transparent,
        selectedIconTheme: const IconThemeData(
          size: 20
        ),
        unselectedIconTheme: const IconThemeData(
          size: 20
        ),
        selectedItemColor: global.cor,
        unselectedItemColor: Colors.black12,
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
        currentIndex: global.pageIndex,
        onTap: (page) => onPageChanged(page),
      ),
      body: FutureBuilder<String>(
        future: Future(() => getUser()),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          Widget level = Container();
          
          if (snapshot.hasData && snapshot.data == "sucess") {
            level = PageView(
              controller: _pageController,
              onPageChanged: (index) => onPageChanged(index),
              children: const <Widget> [
                HomePage(),
                SearchPage(),
                ProfilePage(),
                SettingsPage()
              ],
            );
          }else if(snapshot.hasError){
            level = const Center(
              child: Text("Usuario não ancontrado")
            );
          }else{
            level = Center(
              child: SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(
                  color: global.cor,
                ),
              ),
            );
          }
          return level;
        },
      )
    );
  }
}