// weather_screen.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherScreen extends StatelessWidget {
  final String cityName;
  final String countryName;
  final double temperature;
  final String description;

  WeatherScreen({
    required this.cityName,
    required this.countryName,
    required this.temperature,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Clima Nova',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          centerTitle: true, // Center the title in the AppBar
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          // You can add more styles to the AppBar here
          backgroundColor: Color(0xff313131),
        ),
        body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black, Color(0xff383838)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        '$cityName , $countryName',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Center(
                      child: Text(
                        '${temperature.toStringAsFixed(1)} °C',
                        style: TextStyle(fontSize: 70, fontWeight: FontWeight.w400, color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Weather: $description',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ]
        )
    );
  }
}
