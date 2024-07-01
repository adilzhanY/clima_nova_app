// weather_screen.dart
import 'package:clima_nova_app1/dailyForecastPage.dart';
import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  final String cityName;
  final String countryName;
  final double temperature;
  final String description;
  final double windSpeed;
  final double humidity;
  final String iconCode;
  final double tempMax;
  final double tempMin;
  final double pressure;


  WeatherScreen({
    required this.cityName,
    required this.countryName,
    required this.temperature,
    required this.description,
    required this.windSpeed,
    required this.humidity,
    required this.iconCode,
    required this.tempMax,
    required this.tempMin,
    required this.pressure,
  });

  // Weather Icon url's
  String _getWeatherImage(String iconCode) {
    if (iconCode.contains('01d')) {
      return 'images/clear-day.png';
    }else if(iconCode.contains('02d')){
      return 'images/day_partial_png.png';
    }else if(iconCode.contains('03d')){
      return 'images/day_partial_cloud.png';
    }else if(iconCode.contains('04d')){
      return 'images/cloudy.png';
    }else if(iconCode.contains('09d')){
      return 'images/rain.png';
    }else if(iconCode.contains('10d')){
      return 'images/rain.png';
    }else if(iconCode.contains('11d')){
      return 'images/rain_thunder.png';
    }else if(iconCode.contains('13d')){
      return 'images/snow.png';
    }else if(iconCode.contains('50d')){
      return 'images/mist.png';
    }else if(iconCode.contains('01n')){
      return 'images/night_clear.png';
    } else if(iconCode.contains('02n')){
      return 'images/night_clear.png';
    }else if(iconCode.contains('03n')){
      return 'images/cloudy.png';
    }else if(iconCode.contains('04n')){
      return 'images/cloudy.png';
    }else if(iconCode.contains('09n')){
      return 'images/night_rain.png';
    }else if(iconCode.contains('10n')){
      return 'images/night_rain.png';
    }else if(iconCode.contains('11n')){
      return 'images/night_rain_thunder.png';
    }else if(iconCode.contains('13d')){
      return 'images/night_snow.png';
    }else if(iconCode.contains('50n')){
      return 'images/mist.png';
    }
    return 'https://i.ibb.co/rb4rrJL/26.png'; // default
  }

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
        centerTitle: true, // Center the title in the AppBar
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
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
                    style: TextStyle(
                      fontFamily: 'Inder-Regular',
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Center(
                  child: Column(children: [
                    SizedBox(
                      width: 250,
                      height: 250,
                      child: Image.asset(
                        _getWeatherImage(iconCode),
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(Icons.error, color: Colors.white);
                        },
                      ),
                    ),
                    Text(
                      '${temperature.toStringAsFixed(0)}°C',
                      style: TextStyle(
                        fontFamily: 'Inder-Regular',
                        fontSize: 70,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ]),
                ),
                Center(
                  child: Text(
                    'Max: ${tempMax.toStringAsFixed(0)}°C Min: ${tempMin.toStringAsFixed(0)}°C',
                    style: TextStyle(
                      fontFamily: 'Inder-Regular',
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    description,
                    style: TextStyle(
                      fontFamily: 'Inder-Regular',
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Wind Speed: $windSpeed m/s',
                  style: TextStyle(
                    fontFamily: 'Inder-Regular',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Humidity: $humidity %',
                  style: TextStyle(
                    fontFamily: 'Inder-Regular',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Pressure: $pressure hPa',
                  style: TextStyle(
                    fontFamily: 'Inder-Regular',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16.0),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => dailyForecastPage(cityName: cityName)),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                              Color(0xFF303030), // Background color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: Text(
                              'See daily forecast',
                              style: TextStyle(
                                fontFamily: 'Inder-Regular',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
