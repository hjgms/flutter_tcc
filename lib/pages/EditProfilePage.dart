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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editing page"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        child: ListView(
          children: [
            Text(
              "Nome",
              style: global.styles.labelText(),
            ),
            const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  hintText: "Type your name "),
            ),
            SizedBox(height: espacamentoInputs),
            Text(
              "Email",
              style: global.styles.labelText(),
            ),
            const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  hintText: "Type your name "),
            ),
            SizedBox(height: espacamentoInputs),
            Text(
              "Localidade",
              style: global.styles.labelText(),
            ),
            const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  hintText: "Type your name "),
            ),
            SizedBox(height: espacamentoInputs),
            Text(
              "Estilos musicais",
              style: global.styles.labelText(),
            ),
            Row(
              children: [
                Container(child: const Text("rock"),)
              ],
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
      ),
    );
  }
}
