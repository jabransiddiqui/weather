
import 'package:flutter/material.dart';
import '/business_logic/business_logic.dart';
import '/data/data.dart';
import '/utils/utils.dart';
import '/presentation/presentation.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case splashRoute:
      return MaterialPageRoute(builder: (context) => const  SplashScreen());
    case searchCitiesRoute: 
    return MaterialPageRoute(builder: (context) => const  SearchCityScreen());
    case homeRoute:
      return MaterialPageRoute(builder: (context) => const  HomeScreen());
    case weatherDeatilRoute:
      return MaterialPageRoute(builder: (context) =>  WeatherDetailScreen(settings.arguments as Daily));
    case favouriteRoute:
      return MaterialPageRoute(builder: (context) => FavouriteScreen(settings.arguments as FavouriteCubit));
    case nodataRoute:
      return MaterialPageRoute(builder: (context) => const  NodataScreen());
    default:
      throw("no route found");
  }
}