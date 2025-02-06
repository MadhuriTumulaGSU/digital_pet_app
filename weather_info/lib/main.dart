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
  String _temperature = '';
  String _weatherCondition = '';

  // Function to simulate fetching weather data
  void _fetchWeather() {
    // Get the city name entered by the user
    String city = _cityController.text;

    // Generate a random temperature between 15°C and 30°C
    Random random = Random();
    int temp = random.nextInt(16) + 15; // Generates a number between 15 and 30

    // Randomly select a weather condition from a list of options
    List<String> weatherConditions = ['Sunny', 'Cloudy', 'Rainy'];
    String condition = weatherConditions[random.nextInt(weatherConditions.length)];

    // Update the UI with the simulated data
    setState(() {
      _cityName = city;
      _temperature = '$temp°C';
      _weatherCondition = condition;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather App')),
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
              child: Text('Fetch Weather'),
            ),
            SizedBox(height: 20),
            // Displaying weather data
            Text(
              'City: $_cityName',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Temperature: $_temperature',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Condition: $_weatherCondition',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
