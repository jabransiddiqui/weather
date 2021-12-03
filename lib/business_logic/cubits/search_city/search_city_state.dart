part of 'search_city_cubit.dart';

class SearchCityState extends Equatable {
  final SearchCityModel? selectedCity;
  const SearchCityState({this.selectedCity});
  
  @override
   List<Object?> get props => [selectedCity];

  SearchCityState copyWith({
    SearchCityModel? selectedCity,
  }) {
    return SearchCityState(
      selectedCity: selectedCity ?? this.selectedCity,
    );
  }
}

class SearchCityLoading extends SearchCityState {
  @override
  List<Object?> get props => [];
}

class SearchComplete extends SearchCityState {
  final List<SearchCityModel>? citiesData;
  const SearchComplete(this.citiesData);
   @override
   List<Object?> get props => [citiesData];
}

class SearchError extends SearchCityState {
  final String message;

  const SearchError(this.message);
}
