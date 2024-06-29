import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import the intl package for date formatting
import 'package:clima_nova_app1/hourlyForecastCard.dart';

class hourlyForecastPage extends StatelessWidget {
  const hourlyForecastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('EEEE, dd MMMM yyyy').format(DateTime.now());

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 10), // Adjust the height as needed
        child: AppBar(
          title: Text(
            'Hourly Forecast',
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
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(30.0),
            child: Text(
              formattedDate,
              style: TextStyle(
                fontFamily: 'Inder-Regular',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
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
            hourlyForecastCard(
              time: '02:00 AM',
              weatherImageUrl: 'https://i.ibb.co/rb4rrJL/26.png',
              temperature: '25°C',
              uv_index: 'Low',
              wind_speed: '7',
            ),
            hourlyForecastCard(
              time: '05:00 AM',
              weatherImageUrl: 'https://i.ibb.co/rb4rrJL/26.png',
              temperature: '22°C',
              uv_index: 'Low',
              wind_speed: '7',
            ),
            hourlyForecastCard(
              time: '8:00 AM',
              weatherImageUrl: 'https://i.ibb.co/rb4rrJL/26.png',
              temperature: '26°C',
              uv_index: 'Low',
              wind_speed: '7',
            ),
            hourlyForecastCard(
              time: '11:00 AM',
              weatherImageUrl: 'https://i.ibb.co/rb4rrJL/26.png',
              temperature: '26°C',
              uv_index: 'Low',
              wind_speed: '7',
            ),
            hourlyForecastCard(
              time: '2:00 PM',
              weatherImageUrl: 'https://i.ibb.co/rb4rrJL/26.png',
              temperature: '26°C',
              uv_index: 'Low',
              wind_speed: '7',
            ),
            hourlyForecastCard(
              time: '5:00 PM',
              weatherImageUrl: 'https://i.ibb.co/rb4rrJL/26.png',
              temperature: '26°C',
              uv_index: 'Low',
              wind_speed: '7',
            ),
            hourlyForecastCard(
              time: '8:00 PM',
              weatherImageUrl: 'https://i.ibb.co/rb4rrJL/26.png',
              temperature: '26°C',
              uv_index: 'Low',
              wind_speed: '7',
            ),
            hourlyForecastCard(
              time: '11:00 PM',
              weatherImageUrl: 'https://i.ibb.co/rb4rrJL/26.png',
              temperature: '26°C',
              uv_index: 'Low',
              wind_speed: '7',
            ),
            // Add more HourlyForecastCard widgets here...
          ],
        ),
      ),
    );
  }
}
