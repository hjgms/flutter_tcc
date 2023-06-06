import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/global/variables.dart' as global;
import 'package:flutter_application_firebase/pages/edit_profile_page.dart';

//firebase
import 'package:flutter_application_firebase/data/functions.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = global.user["obj"]["name"] +" "+ global.user["obj"]["lastname"];
  String username = global.user["obj"]["username"];
  String localization = global.user["obj"]["localization"];
  String description = global.user["obj"]["description"];
  List<String> estilosMusicais = [
    "Rock",
    "Blues",
    "Sertanejo",
    "Pop",
    "Jazz",
    "Música Clássica"
  ];

  // final List<String> imageUrls = [
  //   'https://i0.wp.com/canalparaviolinistas.com/wp-content/uploads/2020/05/music-teacher-e1590257849931.jpg?fit=370%2C370&ssl=1',
  //   'https://i0.wp.com/canalparaviolinistas.com/wp-content/uploads/2020/05/music-teacher-e1590257849931.jpg?fit=370%2C370&ssl=1',
  //   'https://i0.wp.com/canalparaviolinistas.com/wp-content/uploads/2020/05/music-teacher-e1590257849931.jpg?fit=370%2C370&ssl=1',
  //   // Adicione mais URLs de imagens aqui
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: global.colorTheme['mainPurple'],
        elevation: 0,
        toolbarHeight: 60,
        title: Text(
          username,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const EditProfilePage(),
                ),
              );
            },
            child: Container(
              height: 45,
              width: 45,
              padding: const EdgeInsets.symmetric(vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.center,
              child: const Icon(
                Icons.edit_note,
                color: Colors.white,
                size: 30,
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
                  color: Color.fromARGB(31, 0, 61, 117),
                ),
                height: 190,
                width: double.infinity,
              ),
              Container(
                margin: const EdgeInsets.only(top: 80),
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                height: 150,
                width: double.infinity,
                child: FutureBuilder(
                  future: getPhotoPerfil(global.user["uid"]),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data!["ok"] == true) {
                      return CircleAvatar(
                        backgroundImage: NetworkImage(snapshot.data!["args"]),
                      );
                    } else if (snapshot.hasData &&
                        snapshot.data!["ok"] == false) {
                      return CircleAvatar(
                        backgroundColor: global.colorTheme['mainPurple'],
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return CircleAvatar(
                        backgroundColor: global.colorTheme['mainPurple'],
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      );
                    }
                    return CircleAvatar(
                      backgroundColor: global.colorTheme['mainPurple'],
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
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
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(localization),
                const SizedBox(height: 12),
                const Text(
                  "Descrição",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(fontSize: 14, height: 1.5),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Estilos musicais",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                DefaultTextStyle.merge(
                  style: const TextStyle(fontSize: 14, height: 1.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: estilosMusicais
                        .map((item) => Text(
                              '• $item',
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ))
                        .toList(),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Horários Disponíveis (Podem variar)",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Dias: ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 1.75,
                  ),
                ),
                const Text(
                  "Horas: ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 1.75,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Imagens",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                // ListView.builder(

                //   // shrinkWrap: true,
                //   // physics: const NeverScrollableScrollPhysics(),
                //   // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //   //   crossAxisCount: 2,
                //   // ),
                //   itemCount: imageUrls.length,
                //   itemBuilder: (BuildContext context, int index) {
                //     return Container(
                //       margin: const EdgeInsets.all(8.0),
                //       child: Image.network(imageUrls[index]),
                //     );
                //   },
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}