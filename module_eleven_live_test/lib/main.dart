import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart as http;
import 'Weather.dart';
import 'WeatherCard.dart';

void main() => runApp(WeatherApp());

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather Information'),
        ),
        body: WeatherList(),
      ),
    );
  }
}

class WeatherList extends StatefulWidget {
  @override
  _WeatherListState createState() => _WeatherListState();
}

class _WeatherListState extends State<WeatherList> {
  List<Weather> weatherData = [];

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    final response = await http.get(Uri.parse('https://github.com/saeid721/json/blob/main/elevenLiveTest.json'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;

      weatherData = data.map((item) {
        return Weather(
          city: item['city'],
          temperature: item['temperature'].toDouble(),
          condition: item['condition'],
          humidity: item['humidity'],
          windSpeed: item['windSpeed'].toDouble(),
        );
      }).toList();

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: weatherData.length,
      itemBuilder: (context, index) {
        return WeatherCard(weather: weatherData[index]);
      },
    );
  }
}
