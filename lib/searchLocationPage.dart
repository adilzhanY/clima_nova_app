// searchLocationPage.dart
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:geolocator/geolocator.dart';
import 'weatherInfoPage.dart';

class SearchScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  final String _apiKey = '2a000bab71b10246891168049aa8f09b'; //API key
  late WeatherFactory _weatherFactory;

  @override
  void initState() {
    super.initState();
    _weatherFactory = WeatherFactory(_apiKey);
  }

  // Locate Me button with geolocator implemented
  void _locateMe() async {
    try {
      // Check for location permissions
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // Location services are disabled
        return Future.error('Location services are disabled.');
      }
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // Permissions are denied
          return Future.error('Location permissions are denied!');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever
        return Future.error('Location permissions are permanently denied!');
      }

      // Get the current position
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      // Fetch weather data
      Weather weather = await _weatherFactory.currentWeatherByLocation(
          position.latitude, position.longitude);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WeatherScreen(
            cityName: weather.areaName ?? 'Unknown',
            countryName: weather.country ?? 'Unknown',
            temperature: weather.temperature?.celsius ?? 0.0,
            description: weather.weatherDescription ?? 'No description',
            windSpeed: weather.windSpeed ?? 0.0,
            humidity: weather.humidity ?? 0.0,
            iconCode: weather.weatherIcon ?? 'unknown',
            //tempMax: weather.tempMax?.celsius ?? 0.0,
              //tempMin: weather.tempMax?.celsius ?? 0.0,
          ),
        ),
      );
    } catch (e) {
      print('Failed to get location or weather data: $e');
      // Show an error message
    }
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
    });
  }

  void _onSearchChanged(String query) {
    print('Search query: $query');
  }

  Future<void> _fetchWeatherData(String city) async {
    try {
      Weather weather = await _weatherFactory.currentWeatherByCityName(city);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WeatherScreen(
            cityName: weather.areaName ?? 'Unknown',
            countryName: weather.country ?? 'Unknown',
            temperature: weather.temperature?.celsius ?? 0.0,
            description: weather.weatherDescription ?? 'No description',
            windSpeed: weather.windSpeed ?? 0.0,
            humidity: weather.humidity ?? 0.0,
            iconCode: weather.weatherIcon ?? 'unknown',
            //tempMax: weather.tempMax?.celsius ?? 0.0,
            //tempMin: weather.tempMax?.celsius ?? 0.0,
          ),
        ),
      );
    } catch (e) {
      print('Failed to load weather data: $e');
      // Show an error message
    }
  }

  void _searchWeather() {
    if (_searchController.text.isNotEmpty) {
      _fetchWeatherData(_searchController.text);
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
        backgroundColor: Color(0xff313131),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
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
                SizedBox(height: 16.0),
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search location...',
                    hintStyle: TextStyle(fontFamily: 'Inder-Regular'),
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: _clearSearch,
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  onChanged: _onSearchChanged,
                  onSubmitted: (_) => _searchWeather(),
                ),
                SizedBox(height: 56.0),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: _locateMe,
                    child: Text(
                      'Locate me',
                      style: TextStyle(
                        fontFamily: 'Inder-Regular',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff373737),
                      minimumSize: Size(190, 57),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 35, vertical: 13),
                    ),
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
