import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart'; // Make sure to import the correct weather package
import 'weatherService.dart'; // Import your WeatherService implementation
import 'dailyForecastCard.dart'; // Import your DailyForecastCard widget

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
    _fetchWeather(widget.cityName); // Fetch weather for the provided city on init
  }

  Future<void> _fetchWeather(String cityName) async {
    setState(() {
      _isLoading = true; // Start loading indicator
    });
    try {
      List<Weather> forecast = await _weatherService.getFiveDayForecast(cityName);
      setState(() {
        _forecast = forecast;
        _isLoading = false; // Stop loading indicator
      });
    } catch (e) {
      setState(() {
        _isLoading = false; // Stop loading indicator on error
      });
      print('Error fetching weather: $e');
      // Optionally, show a snackbar or message to the user about the error
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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Color(0xFF343434)],
          ),
        ),
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : _forecast.isEmpty
            ? Center(child: Text('No forecast available'))
            : ListView.builder(
          key: Key('weather_list'), // Provide a key for list optimization
          padding: EdgeInsets.all(16.0),
          itemCount: _forecast.length,
          itemBuilder: (context, index) {
            Weather weather = _forecast[index];
            return dailyForecastCard(
              day: DateFormat('EEEE').format(weather.date!),
                date: DateFormat('dd.MM.yyyy').format(weather.date!),
              time: DateFormat('HH:mm').format(weather.date!),
              temperature:
              '${weather.temperature!.celsius!.toStringAsFixed(1)}°C',
              humidity: weather.humidity!.toString(),
              wind_speed: weather.windSpeed!.toString(),
            );
          },
        ),
      ),
    );
  }
}
