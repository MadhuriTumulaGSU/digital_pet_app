import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//chicken rice is amazing
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
  String _cityName = '';
  String _temperature = '';
  String _weatherCondition = '';

  // Simulated weather data
  void _fetchWeather() {
    setState(() {
      _cityName = _cityController.text;
      _temperature = '${(20 + (5 - 1) * 3)}°C'; // Random temperature example
      _weatherCondition = 'Clear Sky'; // Random weather condition example
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simulated Weather App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Enter City',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchWeather,
              child: Text('Fetch Weather'),
            ),
            SizedBox(height: 20),
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