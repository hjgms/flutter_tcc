// ignore: file_names
import 'package:flutter/material.dart';

//view
import 'package:flutter_application_firebase/global/variables.dart' as global;
import 'package:flutter_application_firebase/pages/login_page.dart';
import 'package:flutter_application_firebase/data/functions.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: global.colorTheme["mainPurple"] as Color,
            elevation: 0,
            toolbarHeight: 60,
            title: Text(
              "Configurações",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: global.colorTheme["color5"]),
            ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: ListView(
            children: [
              const Text(
                "Conta",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 14,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(6)),
                  padding: const EdgeInsetsDirectional.all(12),
                  child: const Text(
                    "Trocar senha",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(6)),
                  padding: const EdgeInsetsDirectional.all(12),
                  child: const Text(
                    "Trocar senha",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              GestureDetector(
                onTap: () async {
                    signoutUser();
                    global.pageIndex = 0;
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return const LoginPage();
                    }));
                  },
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(27, 0, 0, 0),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(0, 5)),
                      ],
                      color: Colors.red.shade200,
                      borderRadius: BorderRadius.circular(6)),
                  padding: const EdgeInsetsDirectional.all(12),
                  child:  const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Text(
                            "Sair",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color.fromARGB(255, 68, 6, 6)),
                          ),
                           Icon(
                            Icons.logout,
                            color: Color.fromARGB(255, 68, 6, 6),
                          ),
                        ],
                      ),
                  )
                ),
            ],
          ),
        ));
  }
}
