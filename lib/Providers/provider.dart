import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/clima_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiProvider {
  final key = dotenv.env['KEY'];
  late final String url =
      "https://api.hgbrasil.com/weather?array_limit=2&format=json-cors&key=$key";

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
