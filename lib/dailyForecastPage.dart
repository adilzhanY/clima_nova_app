import 'package:flutter/material.dart';
import 'package:clima_nova_app1/dailyForecastCard.dart';

class dailyForecastPage extends StatelessWidget {
  const dailyForecastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 10), // Adjust the height as needed
        child: AppBar(
          title: Text(
            'Daily Forecast',
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
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            dailyForecastCard(
              day: 'Monday',
              temperature: '25°C',
              avg_humidity: '80',
              avg_wind_speed: '7',
            ),
            dailyForecastCard(
              day: 'Tuesday',
              temperature: '25°C',
              avg_humidity: '80',
              avg_wind_speed: '7',
            ),
            dailyForecastCard(
              day: 'Wednesday',
              temperature: '25°C',
              avg_humidity: '80',
              avg_wind_speed: '7',
            ),
            dailyForecastCard(
              day: 'Thursday',
              temperature: '25°C',
              avg_humidity: '80',
              avg_wind_speed: '7',
            ),
            dailyForecastCard(
              day: 'Friday',
              temperature: '25°C',
              avg_humidity: '80',
              avg_wind_speed: '7',
            ),
            dailyForecastCard(
              day: 'Saturday',
              temperature: '25°C',
              avg_humidity: '80',
              avg_wind_speed: '7',
            ),
            dailyForecastCard(
              day: 'Sunday',
              temperature: '25°C',
              avg_humidity: '80',
              avg_wind_speed: '7',
            ),
            // Add more HourlyForecastCard widgets here...
          ],
        ),
      ),
    );
  }
}
