import 'package:flutter/material.dart';
import 'package:tp/Vol.dart';
import 'package:tp/widgets/MiddleText.dart';

class MyPurpleButton extends StatelessWidget {
  MyPurpleButton({
    super.key,
    required this.content,
    required this.isResponsive,
    this.color = Colors.purple,
  });

  bool? isResponsive;
  Color color;

  String content;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 16,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        MiddleText(
          text: content,
          color: Colors.white,
          isBold: true,
          size: 16,
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.play_arrow,
          color: Colors.white,
        ),
      ]),
    );
  }
}
