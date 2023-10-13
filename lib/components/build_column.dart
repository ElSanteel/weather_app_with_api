import 'package:flutter/material.dart';

import 'custom_text.dart';

class BuildColumn extends StatelessWidget {
  String text1;
  String text2;
  bool isBold1;
  bool isBold2;

  BuildColumn(
      {required this.text1,
      required this.text2,
      this.isBold1 = false,
      this.isBold2 = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
            content: text1, size: 20, textColor: Colors.white, isBold: isBold1),
        const SizedBox(height: 5),
        CustomText(
            content: text2, size: 20, textColor: Colors.white, isBold: isBold2),
      ],
    );
  }
}
