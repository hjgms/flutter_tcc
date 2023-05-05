import 'package:flutter/material.dart';

//configs
import 'package:flutter_application_firebase/globals/variables.dart' as global;

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  double espacamentoInputs = 10;

  Container estiloMusicalSelected(String name) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          color: Color.fromARGB(255, 180, 180, 180)),
      child: Text(
        name,
        style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Color(0xff515151)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: global.colorTheme["color1"] as Color,
          title: const Text("Editing page"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          child: ListView(children: [
            Text(
              "Nome",
              style: global.styles.labelText(),
            ),
            TextField(
              style: const TextStyle(fontSize: 14),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                          width: 2,
                          color: global.colorTheme["color1"] as Color)),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide:
                          BorderSide(width: 1, color: Color(0xff515151))),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  hintText: "Type your name "),
            ),
            SizedBox(height: espacamentoInputs),
            Text(
              "Email",
              style: global.styles.labelText(),
            ),
            TextField(
              style: const TextStyle(fontSize: 14),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                          width: 2,
                          color: global.colorTheme["color1"] as Color)),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide:
                          BorderSide(width: 1, color: Color(0xff515151))),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  hintText: "Type your name "),
            ),
            SizedBox(height: espacamentoInputs),
            Text(
              "Localidade",
              style: global.styles.labelText(),
            ),
            TextField(
              style: const TextStyle(fontSize: 14),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                          width: 2,
                          color: global.colorTheme["color1"] as Color)),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide:
                          BorderSide(width: 1, color: Color(0xff515151))),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  hintText: "Type your name "),
            ),
            SizedBox(height: espacamentoInputs),
            Text(
              "Estilos musicais",
              style: global.styles.labelText(),
            ),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              runAlignment: WrapAlignment.center,
              children: [
                estiloMusicalSelected("Rock"),
                estiloMusicalSelected("Sertanejo"),
                estiloMusicalSelected("Blues"),
                estiloMusicalSelected("Pop"),
                estiloMusicalSelected("Jazz"),
                estiloMusicalSelected("Música Clássica"),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        color: Color(0xff17C3B2)),
                    child: const Icon(Icons.add, color: Color(0xffffffff)),
                  ),
                ),
                SizedBox(height: espacamentoInputs),
                Text(
                  "Descrição",
                  style: global.styles.labelText(),
                ),
                Container(
                  padding: const EdgeInsetsDirectional.all(14),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 245, 245, 245),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    maxLines: null,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 51, 51, 51),
                      height: 1.5,
                    ),
                    controller: TextEditingController(
                      text:
                          'Texto grande aqui...\n\ndasda\n\nsdas\n\nsaddasd\n\nsadas\n\n\nsadasdadas\nsada',
                    ),
                  ),
                ),
                SizedBox(height: espacamentoInputs),
                Text(
                  "Fotos",
                  style: global.styles.labelText(),
                ),
              ],
            ),
          ]),
        ));
  }
}
