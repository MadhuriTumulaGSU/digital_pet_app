import 'package:flutter/material.dart';
import 'dart:math'; // For generating random numbers

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherPage(),
    );
  }
}

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  TextEditingController _cityController = TextEditingController();

  // Placeholder data for weather
  String _cityName = '';
  List<Map<String, String>> _forecast = [];

  // Function to simulate fetching weather data
  void _fetchWeather() {
    // Get the city name entered by the user
    String city = _cityController.text;

    // Generate a 7-day forecast with random temperatures and weather conditions
    Random random = Random();
    List<String> weatherConditions = ['Sunny', 'Cloudy', 'Rainy'];
    
    List<Map<String, String>> forecast = [];
    for (int i = 0; i < 7; i++) {
      int temp = random.nextInt(16) + 15; // Generates a temperature between 15°C and 30°C
      String condition = weatherConditions[random.nextInt(weatherConditions.length)];
      forecast.add({
        'day': 'Day ${i + 1}',
        'temperature': '$temp°C',
        'condition': condition,
      });
    }

    // Update the UI with the simulated data
    setState(() {
      _cityName = city;
      _forecast = forecast;
    });
  }

  // Function to simulate fetching 7-day forecast data
  void _fetch7DayForecast() {
    // Generate a 7-day forecast with random temperatures and weather conditions
    Random random = Random();
    List<String> weatherConditions = ['Sunny', 'Cloudy', 'Rainy'];

    List<Map<String, String>> forecast = [];
    for (int i = 0; i < 7; i++) {
      int temp = random.nextInt(16) + 15; // Generates a temperature between 15°C and 30°C
      String condition = weatherConditions[random.nextInt(weatherConditions.length)];
      forecast.add({
        'day': 'Day ${i + 1}',
        'temperature': '$temp°C',
        'condition': condition,
      });
    }

    // Update the UI with the simulated data
    setState(() {
      _forecast = forecast;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('7-Day Weather Forecast')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TextField for city input
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Enter City',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // Fetch weather button
            ElevatedButton(
              onPressed: _fetchWeather,
              child: Text('Fetch Current Weather'),
            ),
            SizedBox(height: 20),
            // Fetch 7-day forecast button
            ElevatedButton(
              onPressed: _fetch7DayForecast,
              child: Text('Fetch 7-Day Forecast'),
            ),
            SizedBox(height: 20),
            // Displaying weather data
            if (_forecast.isNotEmpty) ...[
              Text(
                'City: $_cityName',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              // Display the 7-day forecast
              Expanded(
                child: ListView.builder(
                  itemCount: _forecast.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(_forecast[index]['day']!),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Temperature: ${_forecast[index]['temperature']}'),
                            Text('Condition: ${_forecast[index]['condition']}'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
