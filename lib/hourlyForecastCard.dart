import 'package:flutter/material.dart';

class hourlyForecastCard extends StatelessWidget {
  final String time;
  final IconData weatherIcon;
  final String temperature;

  const hourlyForecastCard({
    Key? key,
    required this.time,
    required this.weatherIcon,
    required this.temperature,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.symmetric(vertical: 4.0),
      decoration: BoxDecoration(
        color: Color(0xff313131),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            time,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Inder-Regular',
              fontSize: 16.0,
            ),
          ),
          Icon(
            weatherIcon,
            color: Colors.white,
            size: 32.0,
          ),
          Text(
            temperature,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Inder-Regular',
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
