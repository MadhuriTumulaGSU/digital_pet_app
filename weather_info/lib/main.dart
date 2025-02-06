import 'package:flutter/material.dart';

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
              onPressed: () {
                setState(() {
                  _cityName = _cityController.text;
                  // For now, simulating some weather data
                  _temperature = '25°C'; 
                  _weatherCondition = 'Sunny'; 
                });
              },
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