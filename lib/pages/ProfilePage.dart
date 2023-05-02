// ignore: file_names
import 'package:flutter/material.dart';

//view page
// import '../../login/loginPage.dart';

//configs
import 'package:flutter_application_firebase/config/globalvariables.dart' as global;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: global.colorTheme["color1"] as Color,
        elevation: 2,
        toolbarHeight: 60,
        title: Text(
          global.user["obj"]["name"],
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: global.colorTheme["color5"] as Color
          ),
        ),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black12,
                ),
                height: 190,
                width: double.maxFinite,
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 40
                ),
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                height: 240,
                width: double.maxFinite,
                child: const CircleAvatar(
                  backgroundImage: NetworkImage("https://images.pexels.com/photos/16511744/pexels-photo-16511744.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", scale: 2),
                  backgroundColor: Colors.black26,
                  radius: 20,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(global.user["obj"]["name"] + global.user["obj"]["lastname"],
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                  ),
                )
              ],
            ) 
          )
        ],
      ),
    );
  }
}