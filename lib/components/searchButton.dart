import 'package:flutter/material.dart';

//global
import 'package:flutter_application_firebase/global/variables.dart' as global;

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
        color: global.colorTheme["clearMainPurple"],
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
              size: 26,
              color: global.colorTheme["color5"],
            ),
          ),
          hintText: "Find users",
          hintStyle: TextStyle(
            fontSize: 16, 
            color: global.colorTheme["color5"]
          )
        ),
      ),
    );
  }
}
