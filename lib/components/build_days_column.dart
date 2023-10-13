import 'package:flutter/material.dart';

import 'custom_text.dart';

class BuildDaysColumn extends StatelessWidget {
  String dayName;
  String imageName;
  String temperature;
  BuildDaysColumn(
      {required this.dayName,
      required this.imageName,
      required this.temperature,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(content: dayName, size: 14, textColor: Colors.black),
        Container(
          padding: const EdgeInsets.all(10),
          width: 70,
          height: 75,
          decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: const Color(0xffD4D4D4),
              ),
              borderRadius: BorderRadius.circular(20)),
          child: Column(children: [
            Image.asset("assets/images/$imageName.png"),
            const SizedBox(
              height: 10,
            ),
            CustomText(
                content: "$temperature'C", size: 13, textColor: Colors.black)
          ]),
        )
      ],
    );
  }
}
