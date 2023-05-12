import 'package:flutter/material.dart';

class CustomDropdownButton extends StatefulWidget {
  CustomDropdownButton({super.key, required this.dropdownValue, required this.dropdownItems});
  var dropdownValue;
  List<String> dropdownItems;

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        isExpanded: true,
        value: widget.dropdownValue,
        icon: const Icon(Icons.keyboard_arrow_down),
        items: widget.dropdownItems.map((String item) {
          return DropdownMenuItem<String>(value: item, child: Text(item));
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            widget.dropdownValue = newValue!;
          });
        });
  }
}
