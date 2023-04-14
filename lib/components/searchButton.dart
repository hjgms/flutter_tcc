import 'package:flutter/material.dart';

import 'package:flutter_application_firebase/config/palette.dart';

//configs
import 'package:flutter_application_firebase/config/globalvariables.dart' as global;

class SearchButton extends StatefulWidget {
  const SearchButton({super.key});

  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: const EdgeInsets.symmetric(
        vertical: 5
      ),
      decoration: BoxDecoration(
        color: global.colorTheme["color4"],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          errorBorder: InputBorder.none,
          prefixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 25,
              color: global.colorTheme["color2"],
            ),
          ),
          hintText: "Find users",
          hintStyle: TextStyle(
            fontSize: 16, 
            color: global.colorTheme["color2"]
          )
        ),
      ),
    );
  }
}
