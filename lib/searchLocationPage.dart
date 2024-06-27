// searchLocationPage.dart
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
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

  void _locateMe() {
    // Will work on later
    print('Locate me button pressed');
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
                SizedBox(height: 16.0),
                Align(
                  alignment: Alignment.centerRight,
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
                      padding: EdgeInsets.symmetric(horizontal: 35, vertical: 13),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: _searchWeather,
                child: Text(
                  'Search',
                  style: TextStyle(
                    fontFamily: 'Inder-Regular',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff686868),
                  minimumSize: Size(156, 57),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 17),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
