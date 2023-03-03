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
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Container(
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                blurRadius: 1,
                spreadRadius: 10,
                color: Colors.blue.shade400
              )
            ]
          ),
          child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                suffixIcon:  IconButton(
                  onPressed: (){
                  }, 
                  icon: const Icon(Icons.search,
                    size: 25,
                    color: Colors.black26,
                  ),
                ),
                hintText: "Search",
                hintStyle: const TextStyle(
                  fontSize: 20,
                  color: Colors.black26
                )
              ),
            ),  
        )
      )
    );
  }
}