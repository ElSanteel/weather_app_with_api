import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session_21/blocs/weather_cubit.dart';
import 'package:session_21/components/build_column.dart';
import 'package:session_21/components/build_days_column.dart';
import 'package:session_21/components/custom_text.dart';
import 'package:session_21/core/size_config.dart';
import 'package:session_21/screens/search_screen.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: BlocConsumer<WeatherCubit, WeatherState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = WeatherCubit.get(context);
          if (state is GetWeatherDataLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetWeatherDataSuccessState) {
            return Stack(
              children: [
                Image.asset(
                  "assets/images/background.png",
                  width: SizeConfig.screenWidth! * 1,
                  height: SizeConfig.screenHeight! * 1,
                ),
                Positioned(
                  left: 350,
                  top: 35,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchScreen()),
                      );
                    },
                    icon: const Icon(
                      Icons.search,
                      size: 35,
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  child: Column(
                    children: [
                      CustomText(
                        content: "Today, May 7th, 2021",
                        size: 14,
                        textColor: Colors.white,
                      ),
                      CustomText(
                          content: "Barcelona",
                          size: 40,
                          textColor: Colors.white),
                      CustomText(
                          content: "Spain", size: 20, textColor: Colors.white),
                      const SizedBox(
                        height: 20,
                      ),
                      CircleAvatar(
                        radius: 110,
                        backgroundColor: Colors.white,
                        child: Column(
                          children: [
                            Image.asset("assets/images/rainy.png"),
                            CustomText(
                                content: "10'C",
                                size: 100,
                                textColor: Colors.black)
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          BuildColumn(
                            text1: "Wind status",
                            text2: "7 mph",
                            isBold1: true,
                          ),
                          const SizedBox(
                            width: 100,
                          ),
                          BuildColumn(
                            text1: "Visibility",
                            text2: "6.4 miles",
                            isBold1: true,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          BuildColumn(
                            text1: "Humadity",
                            text2: "85%",
                            isBold1: true,
                          ),
                          const SizedBox(
                            width: 100,
                          ),
                          BuildColumn(
                            text1: "Air pressure",
                            text2: "998 mb",
                            isBold1: true,
                          ),
                        ],
                      ),
                      const SizedBox(height: 26),
                      Container(
                        width: SizeConfig.screenWidth! * 1,
                        height: SizeConfig.screenHeight! * 0.318,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 50.0, left: 10),
                          child: Column(children: [
                            Row(
                              children: [
                                CustomText(
                                  content: "The Next 5 days",
                                  size: 17,
                                  textColor: Colors.black,
                                  isBold: true,
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                BuildDaysColumn(
                                    dayName: "Sunday",
                                    imageName: "cold",
                                    temperature: "10"),
                                BuildDaysColumn(
                                    dayName: "Monday",
                                    imageName: "very_rainy",
                                    temperature: "8"),
                                BuildDaysColumn(
                                    dayName: "Tuesday",
                                    imageName: "cold_drop",
                                    temperature: "3"),
                                BuildDaysColumn(
                                    dayName: "Thursday",
                                    imageName: "lighting",
                                    temperature: "5"),
                                BuildDaysColumn(
                                    dayName: "Friday",
                                    imageName: "cloudy",
                                    temperature: "9")
                              ],
                            ),
                          ]),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          } else if (state is GetWeatherDataErrorState) {
            return Center(child: Text(state.error));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
