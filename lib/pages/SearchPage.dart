// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/config/palette.dart';
import 'package:flutter_application_firebase/components/customDropdownButton.dart';
import 'package:flutter_application_firebase/components/customSwitch.dart';
import 'package:flutter_application_firebase/components/searchButton.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: ListView(
          children: [
            const SearchButton(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomSwitch(title: "músicos", switchValue: switch1Val),
                CustomSwitch(title: "empresas", switchValue: switch2Val),
              ],
            ),
            CustomDropdownButton(
              dropdownItems: dropdownItems,
              dropdownValue: dropdownValue,
            )
          ],
        ),
      ),
    );
  }
}
