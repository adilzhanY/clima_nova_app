import 'package:flutter/material.dart';

class dailyForecastCard extends StatelessWidget {
  final String time;
  final String date;
  final String day;
  final String temperature;
  final String humidity;
  final String wind_speed;

  const dailyForecastCard({
    Key? key,
    required this.date,
    required this.time,
    required this.day,
    required this.temperature,
    required this.humidity,
    required this.wind_speed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      height: 150.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black, Color(0xFF474444)],
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '$day, $date',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inder-Regular',
                    fontSize: 15.0,
                  ),
                ),
                Text(
                  time,
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
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'Humidity: ',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inder-Regular',
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      '$humidity%',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inder-Regular',
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Column(
                  children: [
                    Text(
                      'Wind Speed: ',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inder-Regular',
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      '$wind_speed m/s',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inder-Regular',
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
