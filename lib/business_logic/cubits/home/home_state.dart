part of 'home_cubit.dart';

class HomeState{
  HomeState();
}

class HomeInitial extends HomeState {}

class HomeWeatherLoaded extends HomeState {
  final HomeModel homeModel;
  HomeWeatherLoaded(this.homeModel);
}

class HomeWeatherFetchError extends HomeState {
  final String message;
  HomeWeatherFetchError(this.message);
}
