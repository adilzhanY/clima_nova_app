import 'package:flutter/material.dart';
import 'package:clima_nova_app1/dailyForecastCard.dart';
import 'package:weather/weather.dart';
import 'weatherService.dart';

class dailyForecastPage extends StatefulWidget {
  final String cityName;

  const dailyForecastPage({Key? key, required this.cityName}) : super(key: key);

  @override
  _DailyForecastPageState createState() => _DailyForecastPageState();
}

class _DailyForecastPageState extends State<dailyForecastPage> {
  late WeatherService _weatherService;
  List<Weather> _forecast = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _weatherService = WeatherService('2a000bab71b10246891168049aa8f09b');
    _fetchWeather(widget.cityName); // Fetch weather for the provided city
  }

  Future<void> _fetchWeather(String cityName) async {
    setState(() {
      _isLoading = true; // Start loading indicator
    });
    try {
      List<Weather> forecast =
      await _weatherService.getFiveDayForecast(cityName);
      setState(() {
        _forecast = forecast;
        _isLoading = false; // Stop loading indicator
      });
    } catch (e) {
      setState(() {
        _isLoading = false; // Stop loading indicator on error
      });
      print('Error fetching weather: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daily Forecast for ${widget.cityName}',
          style: TextStyle(
            fontFamily: 'Inder-Regular',
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff313131),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Color(0xFF343434)],
          ),
        ),
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
          padding: EdgeInsets.all(16.0),
          itemCount: _forecast.length,
          itemBuilder: (context, index) {
            Weather weather = _forecast[index];
            return DailyForecastCard(
              day: weather.date.toString().split(' ')[0],
              temperature:
              '${weather.temperature!.celsius!.toStringAsFixed(1)}°C',
              avg_humidity: weather.humidity!.toString(),
              avg_wind_speed: weather.windSpeed!.toString(),
            );
          },
        ),
      ),
    );
  }
}
