// ignore: file_names
import 'package:flutter/material.dart';

//components
import 'package:flutter_application_firebase/components/search_input.dart';
import 'package:flutter_application_firebase/components/search_item.dart';

//functions
import 'package:flutter_application_firebase/data/functions.dart';

//configs
import 'package:flutter_application_firebase/global/variables.dart' as global;

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController controllerSearch = TextEditingController();

  Future<bool> search(String text, bool busca, {bool limpa = false}) async {
    if(limpa){
      setState(() {
        global.searchUsersList.clear();
      });
    }
    
    if(!busca){
      return true;
    }

    Map resp = await searchAnouterUsers(text);
  
    if(resp["ok"]){
      print(global.searchUsersList);
      setState(() {
        global.searchUsersList;
      });
    }else{
      print("not found");
      setState(() {
        global.searchUsersList = [];
      });
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: global.colorTheme["mainPurple"] as Color,
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
            SearchInput(
              controller: controllerSearch,
              searchFunction: (_text) {
                if(_text.trim() == ""){
                  search(_text, false, limpa: true);
                }else{
                  search(_text, true);
                }
              },
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20, 
          horizontal: 10
        ),
        child: createListSearch()
      ),
    );
  }

  Widget createItemSearch(){
    return ListView.builder(
      itemCount: global.searchUsersList.length,
      itemBuilder: (context, index) {
        return SearchItem(
          providerName: global.searchUsersList[index]["nameUser"],
          providerImage: global.searchUsersList[index]["image"],
          uid: global.searchUsersList[index]["uidUser"]
        );
      },
    );
  }

  Widget createListSearch(){
    return FutureBuilder(
      future: search('', false),
      builder: (context, snapshot) {
        if(snapshot.hasData && snapshot.data == true){
          return createItemSearch();
        }
        return Center(
          child: CircularProgressIndicator(
            color: global.colorTheme['mainPurple'],
          ),
        );
      }
    );
  }
}
