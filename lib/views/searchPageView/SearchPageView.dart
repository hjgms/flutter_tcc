// ignore: file_names
import 'package:flutter/material.dart';

class SearchPageView extends StatefulWidget {
  const SearchPageView({super.key});

  @override
  State<SearchPageView> createState() => _SearchPageViewState();
}

class _SearchPageViewState extends State<SearchPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.black12,
        elevation: 0,
        title: Container(
          color: Colors.white,
          height: 70,
          width: double.maxFinite,
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Padding(
            padding: const  EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                disabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 1
                  ),
                  borderRadius: BorderRadius.circular(30)
                ),
                hintText: "Search",
                suffixIcon: const Icon(Icons.search),
                suffixIconColor: Colors.black26,
              ),
            ),
          ),
        )
      )
    );
  }
}