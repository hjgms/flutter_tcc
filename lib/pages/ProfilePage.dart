// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/data/functions.dart';

//view page
// import '../../login/loginPage.dart';

//configs
import 'package:flutter_application_firebase/globals/variables.dart' as global;

// PAGES
import 'package:flutter_application_firebase/pages/EditProfilePage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name =
      global.user["obj"]["name"] + " " + global.user["obj"]["lastname"];
  String username = global.user["obj"]["username"];
  String localization = global.user["obj"]["localization"];
  String description = global.user["obj"]["description"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: global.colorTheme["mainPurple"] as Color,
        elevation: 2,
        toolbarHeight: 60,
        title: Text(
          username,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: global.colorTheme["color5"] as Color),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const EditProfilePage()));
            },
            child: Container(
              height: 45,
              width: 45,
              padding: const EdgeInsets.symmetric(vertical: 10),
              margin: const EdgeInsets.symmetric(
                horizontal: 5,
              ),
              alignment: Alignment.center,
              child: Icon(
                Icons.person,
                color: global.colorTheme["color5"] as Color,
              ),
            ),
          )
        ],
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
                  margin: const EdgeInsets.only(top: 80),
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  height: 150,
                  width: double.maxFinite,
                  child: FutureBuilder(
                    future: getPhotoPerfil(global.user["uid"]),
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data!["ok"] == true) {
                        return CircleAvatar(
                          backgroundImage: MemoryImage(snapshot.data!["args"]),
                        );
                      } else if (snapshot.hasData &&
                          snapshot.data!["ok"] == false) {
                        return CircleAvatar(
                          backgroundColor: global.colorTheme["mainPurple"],
                          child: Icon(Icons.close,
                              color: global.colorTheme["color5"]),
                        );
                      } else if (snapshot.hasError) {
                        return CircleAvatar(
                          backgroundColor: global.colorTheme["mainPurple"],
                          child: Icon(Icons.person,
                              color: global.colorTheme["color5"]),
                        );
                      }
                      return CircleAvatar(
                        backgroundColor: global.colorTheme["mainPurple"],
                        child: CircularProgressIndicator(
                          color: global.colorTheme["color5"],
                        ),
                      );
                    },
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Text(
                  name,
                  style: global.styles.titulo(),
                ),
                const SizedBox(height: 4),
                Text(localization),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Descrição",
                  style: global.styles.titulo(),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(fontSize: 14, height: 1.5),
                ),
                const SizedBox(height: 12),
                Text(
                  "Estilos musicais",
                  style: global.styles.titulo(),
                ),
                const SizedBox(height: 4),
                DefaultTextStyle.merge(
                    style: global.styles.listaEstilosMusicaisStyle(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text("• Rock"),
                        Text("• Blues "),
                        Text("• Sertanejo"),
                        Text("• Pop"),
                        Text("• Jazz"),
                        Text("• Música Clássica")
                      ],
                    )),
                const SizedBox(height: 12),
                Text(
                  "Horários Disponíveis (Podem variar)",
                  style: global.styles.titulo(),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Dias: ",
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600, height: 1.75),
                ),
                const Text(
                  "Horas: ",
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600, height: 1.75),
                ),
                const SizedBox(height: 12),
                Text(
                  "Imagens",
                  style: global.styles.titulo(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
