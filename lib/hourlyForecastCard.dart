import 'package:flutter/material.dart';

class hourlyForecastCard extends StatelessWidget {
  final String time;
  final String weatherImageUrl;
  final String temperature;
  final String uv_index;
  final String wind_speed;

  const hourlyForecastCard({
    Key? key,
    required this.time,
    required this.weatherImageUrl,
    required this.temperature,
    required this.uv_index,
    required this.wind_speed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      height: 100.0,
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
          Column(
            children: [
              Image.network(
                weatherImageUrl,
                width: 32.0,
                height: 32.0,
              ),
              SizedBox(
                width: 8.0,
              ), //space between image and temperature
              Expanded(
                child: Text(
                  temperature,
                  textAlign:
                      TextAlign.left, // Align text to the left within Expanded
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inder-Regular',
                    fontSize: 25.0,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 16.0),
          // Time in the middle
          Text(
            time,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Inder-Regular',
              fontSize: 16.0,
            ),
          ),
          SizedBox(width: 16.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Align children evenly in the middle
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'UV index: ' + '' + uv_index,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Inder-Regular',
                  fontSize: 16.0,
                ),
              ),
              Text(
                'Wind speed: ' + '' + wind_speed + ' m/s',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Inder-Regular',
                  fontSize: 16.0,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
