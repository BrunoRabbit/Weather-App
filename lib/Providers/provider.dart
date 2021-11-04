import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/clima_model.dart';

//TODO: PROVIDER, FUNCTION TO MOEDELS
//Principais configurações a serem utilizadas nas requisições.

// https://api.hgbrasil.com/weather?array_limit=2&format=json-cors&key=674bb69c&city_name=Campinas,SP
// api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=0b7018c308211ac129e84c539125420e

// print('Result: ' + returnData['results']['city']);

class ApiProvider {
  final String url =
      'https://api.hgbrasil.com/weather?array_limit=2&format=json-cors&key=0f35c887';

  Future<ClimaModel> getHttp(String city) async {
    Map<String, dynamic> returnData;
    http.Response response;

    response = await http.get(
      Uri.parse(url + '&city_name=$city'),
    );

    returnData = json.decode(response.body);

    return ClimaModel.fromMap(returnData);
  }
}
