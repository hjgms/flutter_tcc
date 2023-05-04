// ignore: file_names
import 'package:flutter/material.dart';

//view page
// import '../../login/loginPage.dart';

//configs
import 'package:flutter_application_firebase/globals/variables.dart' as global;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // ESTILOS
  TextStyle listaEstilosMusicaisStyle =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, height: 1.8);
  TextStyle titulos =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

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
              color: global.colorTheme["color5"] as Color),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              print("profile btn works!");
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
                margin: const EdgeInsets.only(top: 40),
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                height: 240,
                width: double.maxFinite,
                child: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://images.pexels.com/photos/16511744/pexels-photo-16511744.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                      scale: 2),
                  backgroundColor: Colors.black26,
                  radius: 20,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Text(
                  "Junior Alves Vieira Vasconcelos da Silva",
                  style: titulos,
                ),
                const SizedBox(height: 4),
                const Text("Marília - SP"),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Descrição",
                  style: titulos,
                ),
                const SizedBox(height: 4),
                const Text(
                  '''Olá! Meu nome é Junior, sou um músico apaixonado e comprometido com a arte de criar música de qualidade. Como músico profissional, tenho experiência em diversos estilos musicais, incluindo rock, pop, jazz, blues e música clássica.

    Ao longo da minha carreira, tive a oportunidade de tocar com vários artistas renomados e participar de diversas gravações de álbuns e trilhas sonoras. Também tenho experiência em dar aulas de música e trabalhar como produtor musical. 
                  
    Minha principal habilidade é tocar guitarra, mas também sou competente em outros instrumentos como baixo e teclado. Além disso, tenho conhecimento em produção musical, gravação e mixagem.''',
                  style: TextStyle(fontSize: 14, height: 1.5),
                ),
                const SizedBox(height: 12),
                Text(
                  "Estilos musicais",
                  style: titulos,
                ),
                const SizedBox(height: 4),
                DefaultTextStyle.merge(
                    style: listaEstilosMusicaisStyle,
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
                  style: titulos,
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
                  style: titulos,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
