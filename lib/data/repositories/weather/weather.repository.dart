import '/data/data.dart';

class WeatherRepository {
  WeatherAPI? _searchCityAPI;
  WeatherRepository() {
    _searchCityAPI = WeatherAPI();
  }

  Future<dynamic> searchCities({
    required String cityKey,
  }) async {
    try {
      final data = await _searchCityAPI?.searchCities(cityKey: cityKey);
      if (data != null) {
        List<SearchCityModel> temp = (data as List)
            .map((itemWord) => SearchCityModel.fromJson(itemWord))
            .toList();
        return temp;
      } else {
        throw ("Unable to fetch data");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<HomeModel?> getWeatherForcost({
    required dynamic queryParam,
  }) async {
    try {
      final data =
          await _searchCityAPI?.getWeatherForcost(queryParam: queryParam);
      if (data != null) {
        return HomeModel.fromMap(data);
      } else {
        throw ("Unable to fetch data");
      }
    } catch (e) {
      rethrow;
    }
  }
}
