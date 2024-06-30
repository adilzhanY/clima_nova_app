import 'package:flutter/material.dart';

class DailyForecastCard extends StatelessWidget {
  final String day;
  final String temperature;
  final String avg_humidity;
  final String avg_wind_speed;

  const DailyForecastCard({
    Key? key,
    required this.day,
    required this.temperature,
    required this.avg_humidity,
    required this.avg_wind_speed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      height: 150.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [Colors.black, Color(0xFF474444)]),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  day,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inder-Regular',
                    fontSize: 15.0,
                  ),
                ),
                Text(
                  temperature,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inder-Regular',
                    fontSize: 25.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Avg. Humidity: $avg_humidity',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inder-Regular',
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  'Avg. Wind Speed: $avg_wind_speed m/s',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inder-Regular',
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
