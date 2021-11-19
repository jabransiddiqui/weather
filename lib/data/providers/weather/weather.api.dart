import 'package:weather/core/network/routes/api_routes.dart';

import '/core/network/network.dart';
import '/core/core.dart';

class WeatherAPI {
  WeatherAPI();
  final http = HTTP.instance;

  Future<dynamic> searchCities(
      {required cityKey,}) async {
    try {
      http.dio.options.baseUrl = ApiRoutes.baseUrl;
      return await http.iGet(ApiRoutes.searchCities,queryParameters: {"query": cityKey});
    }catch (e) {
      rethrow;
    }
  }
  Future<dynamic> getWeatherForcost({
    required dynamic queryParam,
  }) async {
    try {
      http.dio.options.baseUrl = ApiRoutes.baseUrlAPI;   
      return await http.iGet(ApiRoutes.weatherForcast,queryParameters: queryParam);
    } catch (e) {
      rethrow;
    }
  }
}
