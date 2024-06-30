import 'package:weather/weather.dart';

class WeatherService {
  final WeatherFactory _weatherFactory;
  WeatherService(String apiKey) : _weatherFactory = WeatherFactory(apiKey);

  Future<List<Weather>> getFiveDayForecast(String cityName) async {
    return await _weatherFactory.fiveDayForecastByCityName(cityName);
  }
}