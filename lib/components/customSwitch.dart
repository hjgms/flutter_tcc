import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  CustomSwitch({super.key, required this.title, required this.switchValue});
  final String title;
  bool switchValue;

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.title),
        Switch(
            value: widget.switchValue,
            onChanged: (bool value) {
              setState(() {
                widget.switchValue = value;
              });
            }),
      ],
    );
  }
}
