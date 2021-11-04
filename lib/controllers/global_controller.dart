import 'package:flutter/material.dart';
import 'package:weather_app/Providers/provider.dart';
import 'package:weather_app/models/clima_model.dart';

class GlobalController extends ChangeNotifier {
  final service = ApiProvider();

  TextEditingController? searchController = TextEditingController();

  String search = 'Procurando';

  int currentViewIndex = 1;

  Future<void> getValue(String cityName) async {
    currentClima = await service.getHttp(cityName);
    search = currentClima!.city;
    notifyListeners();
  }

  setCurrentViewIndex(int newValue) {
    currentViewIndex = newValue;
    notifyListeners();
  }

  ClimaModel? currentClima;
}
