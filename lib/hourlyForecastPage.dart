
import 'package:flutter/material.dart';
import 'package:clima_nova_app1/hourlyForecastCard.dart';

class hourlyForecastPage extends StatelessWidget {
  const hourlyForecastPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Clima Nova',
          style: TextStyle(
            fontFamily: 'Inder-Regular',
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Color(0xff313131),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          hourlyForecastCard(
            time: '08:00 AM',
            weatherIcon: Icons.wb_sunny,
            temperature: '25°C',
          ),
          hourlyForecastCard(
            time: '09:00 AM',
            weatherIcon: Icons.wb_cloudy,
            temperature: '22°C',
          ),
          hourlyForecastCard(
            time: '10:00 AM',
            weatherIcon: Icons.wb_sunny,
            temperature: '26°C',
          ),
          // Add more HourlyForecastCard widgets here...
        ],
      ),
    );
  }
}
