part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class GetWeatherDataLoadingState extends WeatherState {}

class GetWeatherDataSuccessState extends WeatherState {}

class GetWeatherDataErrorState extends WeatherState {
  final String error;

  GetWeatherDataErrorState(this.error);
}
