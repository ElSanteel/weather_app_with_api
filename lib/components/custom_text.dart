import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String? content;
  double size;
  Color textColor;
  bool isBold;

  CustomText(
      {required this.content,
      required this.size,
      required this.textColor,
      this.isBold = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      content!,
      style: TextStyle(
        color: textColor,
        fontSize: size,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
