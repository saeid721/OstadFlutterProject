import 'package:flutter/material.dart';
import 'Weather.dart';

class WeatherCard extends StatelessWidget {
  final Weather weather;

  WeatherCard({required this.weather});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text("City: ${weather.city}"),
          Text("Temperature: ${weather.temperature}°C"),
          Text("Condition: ${weather.condition}"),
          Text("Humidity: ${weather.humidity}%"),
          Text("Wind Speed: ${weather.windSpeed} m/s"),
        ],
      ),
    );
  }
}
