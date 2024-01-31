import 'package:flutter/material.dart';

class MiddleText extends StatelessWidget {
  MiddleText(
      {super.key,
      required this.text,
      this.color = const Color.fromRGBO(0, 0, 0, 1),
      this.size = 25,
      this.isBold = false});

  final double size;
  final String text;
  final Color color;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: (isBold) ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
