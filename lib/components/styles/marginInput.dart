import 'package:flutter/material.dart';

class MarginInput extends StatelessWidget {
  final Widget? child;
  
  const MarginInput({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(top: 6, bottom: 14),
      child: child ?? Container(),
    );
  }
}
