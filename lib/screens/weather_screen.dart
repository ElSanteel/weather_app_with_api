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
                  fit: BoxFit.fill,
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
                        content:
                            "Today, ${cubit.weatherModel?.location?.localtime ?? ''}",
                        size: 14,
                        textColor: Colors.white,
                      ),
                      CustomText(
                          content: "${cubit.weatherModel!.location!.name}",
                          size: 40,
                          textColor: Colors.white),
                      CustomText(
                          content: "${cubit.weatherModel!.location!.country}",
                          size: 20,
                          textColor: Colors.white),
                      const SizedBox(
                        height: 20,
                      ),
                      CircleAvatar(
                        radius: 110,
                        backgroundColor: Colors.white,
                        child: Column(
                          children: [
                            Image.network(
                              "https:${cubit.weatherModel!.current!.condition!.icon}",
                              width: 100,
                              height: 100,
                            ),
                            // Image.asset("assets/images/rainy.png"),
                            CustomText(
                                content:
                                    "${cubit.weatherModel!.current!.tempC}°C",
                                size: 60,
                                textColor: Colors.black)
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          BuildColumn(
                            text1: "Wind status",
                            text2: "${cubit.weatherModel!.current!.windMph}",
                            isBold1: true,
                          ),
                          const SizedBox(
                            width: 100,
                          ),
                          BuildColumn(
                            text1: "Visibility",
                            text2: "${cubit.weatherModel!.current!.visMiles}",
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
                            text1: "Humidity",
                            text2: "${cubit.weatherModel!.current!.humidity}%",
                            isBold1: true,
                          ),
                          const SizedBox(
                            width: 100,
                          ),
                          BuildColumn(
                            text1: "Air pressure",
                            text2: "${cubit.weatherModel!.current!.pressureMb}",
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
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                BuildDaysColumn(
                                    urlIcon: cubit.weatherModel?.forecast
                                        ?.forecastday?[0].day?.condition?.icon,
                                    dayName: "Sunday",
                                    temperature:
                                        "${cubit.weatherModel?.forecast?.forecastday?[0].day?.avgtempC}"),
                                BuildDaysColumn(
                                    urlIcon: cubit.weatherModel?.forecast
                                        ?.forecastday?[1].day?.condition?.icon,
                                    dayName: "Monday",
                                    temperature:
                                        "${cubit.weatherModel?.forecast?.forecastday?[1].day?.avgtempC}"),
                                BuildDaysColumn(
                                    dayName: "Tuesday",
                                    urlIcon: cubit.weatherModel?.forecast
                                        ?.forecastday?[2].day?.condition?.icon,
                                    temperature:
                                        "${cubit.weatherModel?.forecast?.forecastday?[2].day?.avgtempC}"),
                                BuildDaysColumn(
                                    dayName: "Thursday",
                                    urlIcon: cubit.weatherModel?.forecast
                                        ?.forecastday?[3].day?.condition?.icon,
                                    temperature:
                                        "${cubit.weatherModel?.forecast?.forecastday?[3].day?.avgtempC}"),
                                BuildDaysColumn(
                                    dayName: "Friday",
                                    urlIcon: cubit.weatherModel?.forecast
                                        ?.forecastday?[4].day?.condition?.icon,
                                    temperature:
                                        "${cubit.weatherModel?.forecast?.forecastday?[4].day?.avgtempC}")
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
