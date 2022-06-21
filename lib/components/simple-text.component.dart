import 'package:flutter/material.dart';

class SimpleText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  SimpleText(
      {Key? key,
      required this.text,
      this.size = 16.0,
      this.color = Colors.black54})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size),
    );
  }
}
