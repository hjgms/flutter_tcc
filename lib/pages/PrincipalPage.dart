// ignore: file_names
import 'dart:ui';

import 'package:flutter/material.dart';

//view page
import 'package:flutter_application_firebase/pages/HomePage.dart';
import 'package:flutter_application_firebase/pages/PerfilPage.dart';
import 'package:flutter_application_firebase/pages/SearchPage.dart';
import 'package:flutter_application_firebase/pages/ConfigurePage.dart';
import 'package:flutter_application_firebase/config/globalvariables.dart' as globalvariables;

class PrincipalWidget extends StatefulWidget {
  const PrincipalWidget({super.key});

  @override
  State<PrincipalWidget> createState() => _PrincipalWidgetState();
}

class _PrincipalWidgetState extends State<PrincipalWidget> {

  final PageController _pageController = PageController();

  void onPageChanged(int page) {
    setState(() {
      globalvariables.pageIndex = page;
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
          size: 28
        ),
        unselectedIconTheme: const IconThemeData(
          size: 28
        ),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black12,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "",
            tooltip: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
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
        currentIndex: globalvariables.pageIndex,
        onTap: (page) => onPageChanged(page),
      ),
      body: FutureBuilder<String>(
        future: Future<String>.delayed(
          const Duration(seconds: 1),
          () => 'dwad',
        ),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          Widget level = Container();
          
          if (snapshot.hasData) {
            level = PageView(
              controller: _pageController,
              onPageChanged: (index) => onPageChanged(index),
              children: const <Widget> [
                HomePageView(),
                SearchPageView(),
                PerfilPageView(),
                ConfigurePageView()
              ],
            );
          }else{
            level = const Center(
              child: SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
            );
          }
          return level;
        },
      )
    );
  }
}