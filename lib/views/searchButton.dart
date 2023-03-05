import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_firebase/palette.dart';

class SearchButton extends StatefulWidget {
  const SearchButton({super.key});

  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              blurRadius: 1,
              spreadRadius: 2,
              color: Palette.shadesPrimary,
            )
          ]),
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            errorBorder: InputBorder.none,
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 25,
                color: Colors.black26,
              ),
            ),
            hintText: "Search",
            hintStyle: const TextStyle(fontSize: 18, color: Colors.black26)),
      ),
    );
  }
}
