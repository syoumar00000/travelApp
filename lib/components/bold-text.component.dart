import 'package:flutter/material.dart';

class BoldText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  BoldText(
      {Key? key,
      required this.text,
      this.size = 30.0,
      this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(color: color, fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}
