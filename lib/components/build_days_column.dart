import 'package:flutter/material.dart';

import 'custom_text.dart';

class BuildDaysColumn extends StatelessWidget {
  String dayName;
  String? urlIcon;
  String temperature;
  BuildDaysColumn(
      {required this.dayName,
      required this.temperature,
      this.urlIcon,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(content: dayName, size: 14, textColor: Colors.black),
        Container(
          padding: const EdgeInsets.all(10),
          width: 70,
          height: 90,
          decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: const Color(0xffD4D4D4),
              ),
              borderRadius: BorderRadius.circular(20)),
          child: Column(children: [
            urlIcon != null
                ? Image.network("https:${urlIcon!}")
                : Image.asset("assets/images/cloudy.png"),
            const SizedBox(
              height: 5,
            ),
            CustomText(
                content: "$temperature'C", size: 13, textColor: Colors.black)
          ]),
        )
      ],
    );
  }
}
