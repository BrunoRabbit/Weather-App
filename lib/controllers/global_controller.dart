import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/Providers/provider.dart';
import 'package:weather_app/models/card_model.dart';
import 'package:weather_app/models/clima_model.dart';

class GlobalController extends ChangeNotifier {
  final service = ApiProvider();

  TextEditingController? searchController = TextEditingController();

  String search = 'Procurando';

  int currentViewIndex = 1;

  bool isLoading = false;

  ClimaModel? currentClima;

  int? currentIndex;

  double sizeIcon = 0;

  Future<void> getValue(String cityName, BuildContext context) async {
    isLoading = true;
    notifyListeners();
    try {
      currentClima = await service.getHttp(cityName);
      search = currentClima!.city;
      isLoading = false;
    } catch (e) {
      isLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Erro!'),
      ));
    }
    notifyListeners();
  }

  setCurrentViewIndex(int newValue) {
    currentViewIndex = newValue;
    notifyListeners();
  }

  Map<String, IconData?> iconMap = {
    'Tempo nublado': FontAwesomeIcons.cloud,
    'Chuvas esparsas': FontAwesomeIcons.cloudSunRain,
    'Parcialmente nublado': FontAwesomeIcons.cloudSun,
    'Chuva': FontAwesomeIcons.cloudRain,
    'Tempo limpo': FontAwesomeIcons.solidSun,
    'Neve baixa': FontAwesomeIcons.snowflake
  };

  List<CardModel>? getListCard() {
    return currentClima == null
        ? null
        : [
            CardModel(
              weekday: currentClima!.temperatures[1].weekday,
              date: currentClima!.temperatures[1].date,
              max: currentClima!.temperatures[1].max,
              min: currentClima!.temperatures[1].min,
              icon: iconMap[currentClima!.temperatures[1].description],
              description: currentClima!.temperatures[1].description,
            ),
            CardModel(
              weekday: currentClima!.temperatures[2].weekday,
              date: currentClima!.temperatures[2].date,
              max: currentClima!.temperatures[2].max,
              min: currentClima!.temperatures[2].min,
              icon: iconMap[currentClima!.temperatures[2].description],
              description: currentClima!.temperatures[2].description,
            ),
            CardModel(
              weekday: currentClima!.temperatures[3].weekday,
              date: currentClima!.temperatures[3].date,
              max: currentClima!.temperatures[3].max,
              min: currentClima!.temperatures[3].min,
              icon: iconMap[currentClima!.temperatures[3].description],
              description: currentClima!.temperatures[3].description,
            ),
            CardModel(
              weekday: currentClima!.temperatures[4].weekday,
              date: currentClima!.temperatures[4].date,
              max: currentClima!.temperatures[4].max,
              min: currentClima!.temperatures[4].min,
              icon: iconMap[currentClima!.temperatures[4].description],
              description: currentClima!.temperatures[4].description,
            ),
            CardModel(
              weekday: currentClima!.temperatures[5].weekday,
              date: currentClima!.temperatures[5].date,
              max: currentClima!.temperatures[5].max,
              min: currentClima!.temperatures[5].min,
              icon: iconMap[currentClima!.temperatures[5].description],
              description: currentClima!.temperatures[5].description,
            ),
            CardModel(
              weekday: currentClima!.temperatures[6].weekday,
              date: currentClima!.temperatures[6].date,
              max: currentClima!.temperatures[6].max,
              min: currentClima!.temperatures[6].min,
              icon: iconMap[currentClima!.temperatures[6].description],
              description: currentClima!.temperatures[6].description,
            ),
            CardModel(
              weekday: currentClima!.temperatures[7].weekday,
              date: currentClima!.temperatures[7].date,
              max: currentClima!.temperatures[7].max,
              min: currentClima!.temperatures[7].min,
              icon: iconMap[currentClima!.temperatures[7].description],
              description: currentClima!.temperatures[7].description,
            ),
          ];
  }
}
