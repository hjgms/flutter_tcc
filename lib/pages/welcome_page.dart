import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/global/variables.dart' as global;

import '../components/styles/marginInput.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50,
              width: double.infinity,
              color: global.colorTheme['mainPurple'],
            ),
            Container(
          height: 200,
          width: double.infinity,
          color: global.colorTheme['mainPurple']
        ),
          ],
        ));
  }
}


// Center(
//           child: Padding(
//             padding: const EdgeInsets.only(top: 32, bottom: 16),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Column(
//                   children: [
//                     Image.asset(
//                       'assets/logo-tcc.png',
//                       width: 100,
//                     ),
//                     const Text(
//                       "Criar sua conta",
//                       style: TextStyle(color: Color(0xff202020), fontSize: 28),
//                     ),
//                     const SizedBox(
//                       width: 265,
//                       child: Text(
//                           "Bem vindo ao music jobs, escolha qual opção se adequa a você e começe já!",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(color: Color(0xff202020), fontSize: 15)),
//                     ),
//                   ], 
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 120),
//                   child: Column(
//                     children: [
//                       MarginInput(
//                           child: GestureDetector(
//                         onTap: () {},
//                         child: Container(
//                           height: 44,
//                           width: 260,
//                           decoration: BoxDecoration(
//                               border: Border.all(color: Colors.black, width: 1),
//                               borderRadius: const BorderRadius.only(
//                                   topLeft: Radius.circular(10),
//                                   topRight: Radius.circular(0),
//                                   bottomRight: Radius.circular(10),
//                                   bottomLeft: Radius.circular(10)),
//                               color: global.colorTheme['watergreen']),
//                           child: const Center(
//                               child: Text(
//                             'Sou contratante',
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w500),
//                           )),
//                         ),
//                       )),
//                       GestureDetector(
//                         onTap: () {},
//                         child: Container(
//                           height: 44,
//                           width: 260,
//                           decoration: BoxDecoration(
//                               border: Border.all(color: Colors.black, width: 1),
//                               borderRadius: const BorderRadius.only(
//                                   topLeft: Radius.circular(10),
//                                   topRight: Radius.circular(0),
//                                   bottomRight: Radius.circular(10),
//                                   bottomLeft: Radius.circular(10)),
//                               color: Colors.white),
//                           child: const Center(
//                               child: Text(
//                             'Sou contratante',
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w500),
//                           )),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {},
//                   child: const Text(
//                     "Já tenho uma conta",
//                     style: TextStyle(color: Colors.black),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         )
// )