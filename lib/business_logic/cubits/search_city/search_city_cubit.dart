import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import '/data/data.dart';

part 'search_city_state.dart';

class SearchCityCubit extends Cubit<SearchCityState> {
  final WeatherRepository _weatherRepository;
  SearchCityCubit(this._weatherRepository)
      : super(SearchCityLoading()) {
    searchCities(" ");
  }

  Future<void> searchCities(String key) async {
    try {
      final response = await _weatherRepository.searchCities(cityKey: key);
      if (response != null) {
        emit(SearchComplete(response));
      } else {
        emit(const SearchError('Failed to retreive data'));
      }
    }on DioError catch(dioE){
      if(dioE.response?.statusCode == 403){
        emit(const SearchError('No data found'));
      }else{
        emit(SearchError(dioE.message));
      }
    }catch (e) {
       emit(const SearchError('something went wrong'));
    }
  }

  setSelectedCity(SearchCityModel cityModel){
    emit(state.copyWith(selectedCity: cityModel));
  }

  SearchCityModel? get cityModel =>  state.selectedCity;

}
