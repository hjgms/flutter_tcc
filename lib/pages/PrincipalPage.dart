// ignore: file_names
import 'package:flutter/material.dart';

//view page
import 'package:flutter_application_firebase/pages/HomePage.dart';
import 'package:flutter_application_firebase/pages/PerfilPage.dart';
import 'package:flutter_application_firebase/pages/SearchPage.dart';
import 'package:flutter_application_firebase/pages/ConfigurePage.dart';
import 'package:flutter_application_firebase/config/globalvariables.dart' as globalvariables;
import 'package:flutter_svg/flutter_svg.dart';

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
          size: 20
        ),
        unselectedIconTheme: const IconThemeData(
          size: 20
        ),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black12,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "../../assets/icons/casa.svg",
              color: 0 != globalvariables.pageIndex ? Colors.black26 : Colors.blue,
            ),
            label: "",
            tooltip: "home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "../../assets/icons/procurar.svg",
              color: 1 != globalvariables.pageIndex ? Colors.black26 : Colors.blue,
            ),
            label: "",
            tooltip: "search",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "../../assets/icons/doutilizador.svg",
              color: 2 != globalvariables.pageIndex ? Colors.black26 : Colors.blue,
            ),
            label: "",
            tooltip: "perfil",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "../../assets/icons/aplicativos.svg",
              color: 3 != globalvariables.pageIndex ? Colors.black26 : Colors.blue,
            ),
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