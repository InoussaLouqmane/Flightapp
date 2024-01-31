import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {
  AppLargeText(
      {super.key,
      required this.text,
      this.size = 30,
      this.color = Colors.black});

  double size;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(color: color, fontSize: size, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }
}
