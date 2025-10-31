import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/additional_info_item.dart';
import 'package:weather_app/weather_forecast_item.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  Future getCurrentWeather() async {
    String cityName = 'London';
    final res = await http.get(
      Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$cityName&uk&APPID=943ed94217d578f71feb8b8aadb85b02'
     )
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh)),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            '300F',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16),
                          Icon(Icons.cloud, size: 64),
                          SizedBox(height: 16),
                          Text('Rain', style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Weather Forecast',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyForecastItem(
                    time: '00:00',
                    icon: Icons.cloud,
                    temperature: '301.00',
                  ),
                  HourlyForecastItem(
                    time: '03:00',
                    icon: Icons.sunny,
                    temperature: '272.02',
                  ),
                  HourlyForecastItem(
                    time: '04:00',
                    icon: Icons.cloud,
                    temperature: '301.00',
                  ),
                  HourlyForecastItem(
                    time: '09:00',
                    icon: Icons.sunny,
                    temperature: '301.00',
                  ),
                  HourlyForecastItem(
                    time: '00:00',
                    icon: Icons.cloud,
                    temperature: '301.00',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            Text(
              'Additional Informations',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionalInfoItem(
                  icon: Icons.water_drop,
                  label: 'Humidity',
                  value: '60%',
                ),
                AdditionalInfoItem(
                  icon: Icons.air,
                  label: 'Wind Speed',
                  value: '15 km/h',
                ),
                AdditionalInfoItem(
                  icon: Icons.thermostat,
                  label: 'Pressure',
                  value: '1013 hPa',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
