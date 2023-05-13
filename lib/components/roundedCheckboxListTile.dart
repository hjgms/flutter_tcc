// import 'package:flutter/material.dart';
// import 'package:flutter_application_firebase/global/variables.dart' as global;


// class RoundedCheckboxListTile extends StatelessWidget {
//   final String title;
//   final bool? value;
//   final Function(bool?)? onChanged;

//   RoundedCheckboxListTile({required this.title, this.value, this.onChanged});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16.0),
//         color: Colors.grey[300],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(16.0),
//         child: CheckboxListTile(
//           title: Text(title),
//           value: value,
//           onChanged: (bool? value) {
//                                   // quando clicado executar o código abaixo
//             // setState(() {
//             //   if (value!) {
//             //     estilosMusicaisSelecionados.add(lang);
//             //   } else {
//             //     estilosMusicaisSelecionados.remove(lang);
//             //   }
//             });
//           },
//           contentPadding:
//               const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
//           dense: false,
//           activeColor: global.colorTheme["mainPurple"] as Color,
//           selectedTileColor: Colors.grey[300],
//           // Definir o tamanho do ícone e da fonte aqui
//           secondary: SizedBox(
//             height: 16.0,
//             width: 16.0,
//             child: Checkbox(
//               value: value,
//               onChanged: onChanged,
//               materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//               visualDensity: VisualDensity.compact,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
