import 'dart:convert';

class ClimaModel {
  int humidity;
  int temp;
  String city;
  String date;
  String description;

  ClimaModel({
    required this.humidity,
    required this.temp,
    required this.city,
    required this.date,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'humidity': humidity,
      'temp': temp,
      'city': city,
      'date': date,
      'description': description,
    };
  }

  factory ClimaModel.fromMap(Map<String, dynamic> map) {
    return ClimaModel(
      humidity: map['results']['humidity'],
      temp: map['results']['temp'],
      city: map['results']['city'],
      date: map['results']['date'],
      description: map['results']['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ClimaModel.fromJson(String source) =>
      ClimaModel.fromMap(json.decode(source));
}
