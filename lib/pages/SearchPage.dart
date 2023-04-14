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
  // <variaveis de teste>
  bool switch1Val = false;
  bool switch2Val = false;
  var dropdownItems = ["Brasil", "Japão", "Portugal"];
  String dropdownValue = "Brasil";
  // </variaveis de teste>

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white70,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            height: 1,
            color: global.colorTheme["color3"],
          ),
        ),
        elevation: 0,
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
                    color: global.colorTheme["color2"]
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
          children: [
            
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     CustomSwitch(title: "músicos", switchValue: switch1Val),
            //     CustomSwitch(title: "empresas", switchValue: switch2Val),
            //   ],
            // ),
            // CustomDropdownButton(
            //   dropdownItems: dropdownItems,
            //   dropdownValue: dropdownValue,
            // )
          ],
        ),
      ),
    );
  }
}
