// ignore: file_names
import 'package:flutter/material.dart';

//page components
// import 'package:flutter_application_firebase/config/palette.dart';
// import 'package:flutter_application_firebase/components/customDropdownButton.dart';
// import 'package:flutter_application_firebase/components/customSwitch.dart';
import 'package:flutter_application_firebase/components/searchButton.dart';

//configs
import 'package:flutter_application_firebase/config/globalvariables.dart' as global;

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: global.colorTheme["color1"] as Color,
        elevation: 2,
        toolbarHeight: 100,
        title: Column(
          children: [
            Row(
              children: [
                Text(
                  "Search",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: global.colorTheme["color5"]
                  ),
                ),
              ],
            ),
            const SearchButton()
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: ListView(
          children: const [

          ],
        ),
      ),
    );
  }
}
