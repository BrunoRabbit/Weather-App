import 'dart:convert';

import 'package:weather_app/models/temperature_model.dart';

class ClimaModel {
  int humidity;
  int temp;
  String city;
  String date;
  List<TemperatureModel> temperatures;
  String wingSpeed;
  String sunrise;
  String sunset;

  ClimaModel({
    required this.humidity,
    required this.temp,
    required this.city,
    required this.date,
    required this.temperatures,
    required this.wingSpeed,
    required this.sunrise,
    required this.sunset,
  });

  Map<String, dynamic> toMap() {
    return {
      'humidity': humidity,
      'temp': temp,
      'city': city,
      'date': date,
      'temperatures': temperatures.map((x) => x.toMap()).toList(),
      'wingSpeed': wingSpeed,
      'sunrise': sunrise,
      'sunset': sunset,
    };
  }

  factory ClimaModel.fromMap(Map<String, dynamic> map) {
    return ClimaModel(
      humidity: map['results']['humidity'],
      temp: map['results']['temp'],
      city: map['results']['city'],
      date: map['results']['date'],
      temperatures: List<TemperatureModel>.from(
          map['results']['forecast']?.map((x) => TemperatureModel.fromMap(x))),
      wingSpeed: map['results']['wind_speedy'],
      sunrise: map['results']['sunrise'],
      sunset: map['results']['sunset'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ClimaModel.fromJson(String source) =>
      ClimaModel.fromMap(json.decode(source));
}
