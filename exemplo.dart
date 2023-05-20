import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserSearchPage extends StatefulWidget {
  @override
  _UserSearchPageState createState() => _UserSearchPageState();
}

class _UserSearchPageState extends State<UserSearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<String> _searchResults = [];

  Future<void> _searchUsers(String searchQuery) async {
    setState(() {
      _searchResults.clear();
    });

    if (searchQuery.isNotEmpty) {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('usuarios')
          .where('nome', isGreaterThanOrEqualTo: searchQuery)
          .where('nome', isLessThanOrEqualTo: searchQuery + '\uf8ff')
          .get();

      setState(() {
        _searchResults = querySnapshot.docs
            .map((doc) => doc.data()['nome'] as String)
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscar Usuários'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                _searchUsers(value);
              },
              decoration: InputDecoration(
                labelText: 'Digite um nome',
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_searchResults[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
