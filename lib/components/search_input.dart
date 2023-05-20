import 'package:flutter/material.dart';

//global
import 'package:flutter_application_firebase/global/variables.dart' as global;

class SearchInput extends StatefulWidget {
  final TextEditingController controller;
  final void Function(String text) searchFunction;

  const SearchInput({
    super.key,
    required this.controller,
    required this.searchFunction
  });

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
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
        controller: widget.controller,
        cursorColor: global.colorTheme["color5"],
        style: TextStyle(
          color: global.colorTheme["color5"]
        ),
        onChanged: (text){
          widget.searchFunction(text);
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          errorBorder: InputBorder.none,
          prefixIcon: IconButton(
            onPressed: () => widget.searchFunction(widget.controller.text),
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
          ),
        ),
      ),
    );
  }
}
