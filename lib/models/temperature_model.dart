import 'dart:convert';

class TemperatureModel {
  int max;
  int min;
  String weekday;
  String date;
  String description;

  TemperatureModel({
    required this.max,
    required this.min,
    required this.weekday,
    required this.date,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'max': max,
      'min': min,
      'weekday': weekday,
      'date': date,
      'description': description,
    };
  }

  factory TemperatureModel.fromMap(Map<String, dynamic> map) {
    return TemperatureModel(
      max: map['max'],
      min: map['min'],
      weekday: map['weekday'],
      date: map['date'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TemperatureModel.fromJson(String source) =>
      TemperatureModel.fromMap(json.decode(source));
}
