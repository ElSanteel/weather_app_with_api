import 'package:flutter/material.dart';

import '../components/custom_text.dart';
import '../core/size_config.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/background.png",
            width: SizeConfig.screenWidth! * 1,
            height: SizeConfig.screenHeight! * 1,
          ),
          Positioned(
            top: 100,
            child: Container(
              width: SizeConfig.screenWidth! * 1,
              height: SizeConfig.screenHeight! * 0.4,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: // full text field
                  Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 20, right: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.close))
                      ],
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                const BorderSide(width: 1, color: Colors.grey)),
                        hintText: "Search Location",
                        filled: true, //<-- SEE HERE
                        fillColor: const Color(0xffEDEDED), //<-- SEE HERE
                      ),
                    ),
                    const SizedBox(height: 35),
                    Row(
                      children: [
                        CustomText(
                            content: "London",
                            size: 14,
                            textColor: Colors.black),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
