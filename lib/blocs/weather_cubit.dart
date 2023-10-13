import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:session_21/model/weather_model.dart';
import 'package:session_21/service/dio_helper.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  static WeatherCubit get(context) => BlocProvider.of(context);

  WeatherModel? weatherModel;

  void getWeatherData() {
    emit(GetWeatherDataLoadingState());
    DioHelper.getData(
            url:
                "https://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=2d48b1d7080d09ea964e645ccd1ec93f&units=metric")
        .then((value) {
      var jsonData = jsonDecode(value.data);
      weatherModel = WeatherModel.fromJson(jsonData);
      emit(GetWeatherDataSuccessState());
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(GetWeatherDataErrorState(onError.toString()));
    });
  }
}
