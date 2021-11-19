import 'package:bloc/bloc.dart';
import '/data/data.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final WeatherRepository _weatherRepository;
  HomeCubit(this._weatherRepository) : super(HomeInitial());

  getCityWeather(SearchCityModel searchCityModel) async {
    try {
      final latlong = searchCityModel.lattLong.split(",");
      final res = await _weatherRepository.getWeatherForcost(queryParam: {
        "lat": latlong[0],
        "lon": latlong[1],
        "exclude": "minutely",
        "appid": "eb228bd1181d3261f24cd05c04382ae2"
      });
      if (res != null) {
        emit(HomeWeatherLoaded(res));
      } else {
        emit(HomeWeatherFetchError('Unable to fetch data'));
      }
    } catch (e) {
      emit(HomeWeatherFetchError('something went wrong'));
    }
  }

  HomeModel get homeModel => (state as HomeWeatherLoaded).homeModel;
}

/*

{
    "lat": 33.6844,
    "lon": 73.0479,
    "timezone": "Asia/Karachi",
    "timezone_offset": 18000,
    "current": {
        "dt": 1637252611,
        "sunrise": 1637199751,
        "sunset": 1637237021,
        "temp": 286.94,
        "feels_like": 286.1,
        "pressure": 1015,
        "humidity": 66,
        "dew_point": 280.71,
        "uvi": 0,
        "clouds": 4,
        "visibility": 10000,
        "wind_speed": 1.78,
        "wind_deg": 12,
        "wind_gust": 1.88,
        "weather": [
            {
                "id": 800,
                "main": "Clear",
                "description": "clear sky",
                "icon": "01n"
            }
        ]
    },
    "hourly": [
        {
            "dt": 1637251200,
            "temp": 286.94,
            "feels_like": 286.1,
            "pressure": 1015,
            "humidity": 66,
            "dew_point": 280.71,
            "uvi": 0,
            "clouds": 4,
            "visibility": 10000,
            "wind_speed": 1.78,
            "wind_deg": 12,
            "wind_gust": 1.88,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637254800,
            "temp": 287.28,
            "feels_like": 286.29,
            "pressure": 1015,
            "humidity": 59,
            "dew_point": 279.4,
            "uvi": 0,
            "clouds": 4,
            "visibility": 10000,
            "wind_speed": 1.85,
            "wind_deg": 20,
            "wind_gust": 1.86,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637258400,
            "temp": 287.47,
            "feels_like": 286.32,
            "pressure": 1015,
            "humidity": 52,
            "dew_point": 277.76,
            "uvi": 0,
            "clouds": 4,
            "visibility": 10000,
            "wind_speed": 1.74,
            "wind_deg": 28,
            "wind_gust": 1.71,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637262000,
            "temp": 287.55,
            "feels_like": 286.25,
            "pressure": 1014,
            "humidity": 46,
            "dew_point": 276.09,
            "uvi": 0,
            "clouds": 2,
            "visibility": 10000,
            "wind_speed": 1.7,
            "wind_deg": 39,
            "wind_gust": 1.65,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637265600,
            "temp": 287.57,
            "feels_like": 286.09,
            "pressure": 1014,
            "humidity": 39,
            "dew_point": 273.8,
            "uvi": 0,
            "clouds": 1,
            "visibility": 10000,
            "wind_speed": 1.91,
            "wind_deg": 41,
            "wind_gust": 1.8,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637269200,
            "temp": 287.45,
            "feels_like": 285.82,
            "pressure": 1014,
            "humidity": 34,
            "dew_point": 271.22,
            "uvi": 0,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 1.89,
            "wind_deg": 42,
            "wind_gust": 1.83,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637272800,
            "temp": 287.22,
            "feels_like": 285.57,
            "pressure": 1014,
            "humidity": 34,
            "dew_point": 271.13,
            "uvi": 0,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 2.04,
            "wind_deg": 38,
            "wind_gust": 1.92,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637276400,
            "temp": 287,
            "feels_like": 285.33,
            "pressure": 1014,
            "humidity": 34,
            "dew_point": 271,
            "uvi": 0,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 2.04,
            "wind_deg": 35,
            "wind_gust": 1.93,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637280000,
            "temp": 286.72,
            "feels_like": 285.05,
            "pressure": 1014,
            "humidity": 35,
            "dew_point": 270.88,
            "uvi": 0,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 1.81,
            "wind_deg": 25,
            "wind_gust": 1.72,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637283600,
            "temp": 286.52,
            "feels_like": 284.83,
            "pressure": 1014,
            "humidity": 35,
            "dew_point": 270.76,
            "uvi": 0,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 1.71,
            "wind_deg": 11,
            "wind_gust": 1.68,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637287200,
            "temp": 286.54,
            "feels_like": 284.85,
            "pressure": 1014,
            "humidity": 35,
            "dew_point": 270.89,
            "uvi": 0,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 1.82,
            "wind_deg": 3,
            "wind_gust": 1.76,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637290800,
            "temp": 288.95,
            "feels_like": 287.45,
            "pressure": 1015,
            "humidity": 33,
            "dew_point": 272.11,
            "uvi": 0.29,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 1.48,
            "wind_deg": 357,
            "wind_gust": 1.55,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637294400,
            "temp": 291.67,
            "feels_like": 290.28,
            "pressure": 1015,
            "humidity": 27,
            "dew_point": 271.6,
            "uvi": 1.02,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 1.51,
            "wind_deg": 326,
            "wind_gust": 1.9,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637298000,
            "temp": 293.62,
            "feels_like": 292.32,
            "pressure": 1014,
            "humidity": 23,
            "dew_point": 271.41,
            "uvi": 2.13,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 2.05,
            "wind_deg": 305,
            "wind_gust": 2.41,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637301600,
            "temp": 295.16,
            "feels_like": 293.96,
            "pressure": 1014,
            "humidity": 21,
            "dew_point": 271.17,
            "uvi": 3.15,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 2.55,
            "wind_deg": 300,
            "wind_gust": 2.91,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637305200,
            "temp": 296.24,
            "feels_like": 295.1,
            "pressure": 1012,
            "humidity": 19,
            "dew_point": 270.99,
            "uvi": 3.72,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 2.8,
            "wind_deg": 294,
            "wind_gust": 3.07,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637308800,
            "temp": 296.87,
            "feels_like": 295.77,
            "pressure": 1011,
            "humidity": 18,
            "dew_point": 270.96,
            "uvi": 3.42,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 2.98,
            "wind_deg": 296,
            "wind_gust": 3.23,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637312400,
            "temp": 297.16,
            "feels_like": 296.09,
            "pressure": 1010,
            "humidity": 18,
            "dew_point": 271.08,
            "uvi": 2.47,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 3.04,
            "wind_deg": 297,
            "wind_gust": 3.26,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637316000,
            "temp": 296.88,
            "feels_like": 295.8,
            "pressure": 1010,
            "humidity": 19,
            "dew_point": 271.39,
            "uvi": 1.33,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 2.79,
            "wind_deg": 295,
            "wind_gust": 2.84,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637319600,
            "temp": 295.53,
            "feels_like": 294.42,
            "pressure": 1010,
            "humidity": 23,
            "dew_point": 273.15,
            "uvi": 0.46,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 2.52,
            "wind_deg": 291,
            "wind_gust": 3.28,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637323200,
            "temp": 291.9,
            "feels_like": 290.56,
            "pressure": 1010,
            "humidity": 28,
            "dew_point": 272.46,
            "uvi": 0,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 2.16,
            "wind_deg": 304,
            "wind_gust": 3,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637326800,
            "temp": 290.67,
            "feels_like": 289.23,
            "pressure": 1011,
            "humidity": 29,
            "dew_point": 272.14,
            "uvi": 0,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 1.84,
            "wind_deg": 344,
            "wind_gust": 2.48,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637330400,
            "temp": 289.96,
            "feels_like": 288.51,
            "pressure": 1011,
            "humidity": 31,
            "dew_point": 272.07,
            "uvi": 0,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 1.94,
            "wind_deg": 12,
            "wind_gust": 2.34,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637334000,
            "temp": 289.44,
            "feels_like": 287.96,
            "pressure": 1011,
            "humidity": 32,
            "dew_point": 272.02,
            "uvi": 0,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 1.83,
            "wind_deg": 25,
            "wind_gust": 2.07,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637337600,
            "temp": 289.13,
            "feels_like": 287.62,
            "pressure": 1012,
            "humidity": 32,
            "dew_point": 271.91,
            "uvi": 0,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 1.55,
            "wind_deg": 29,
            "wind_gust": 1.68,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637341200,
            "temp": 288.87,
            "feels_like": 287.33,
            "pressure": 1012,
            "humidity": 32,
            "dew_point": 271.77,
            "uvi": 0,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 1.64,
            "wind_deg": 33,
            "wind_gust": 1.59,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637344800,
            "temp": 288.57,
            "feels_like": 287,
            "pressure": 1012,
            "humidity": 32,
            "dew_point": 271.61,
            "uvi": 0,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 1.7,
            "wind_deg": 41,
            "wind_gust": 1.62,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637348400,
            "temp": 288.35,
            "feels_like": 286.76,
            "pressure": 1012,
            "humidity": 32,
            "dew_point": 271.41,
            "uvi": 0,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 1.86,
            "wind_deg": 47,
            "wind_gust": 1.79,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637352000,
            "temp": 288.13,
            "feels_like": 286.52,
            "pressure": 1012,
            "humidity": 32,
            "dew_point": 271.17,
            "uvi": 0,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 2.05,
            "wind_deg": 54,
            "wind_gust": 1.98,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637355600,
            "temp": 287.91,
            "feels_like": 286.28,
            "pressure": 1012,
            "humidity": 32,
            "dew_point": 270.9,
            "uvi": 0,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 2.29,
            "wind_deg": 55,
            "wind_gust": 2.21,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637359200,
            "temp": 287.64,
            "feels_like": 285.98,
            "pressure": 1012,
            "humidity": 32,
            "dew_point": 270.59,
            "uvi": 0,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 2.21,
            "wind_deg": 53,
            "wind_gust": 2.13,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637362800,
            "temp": 287.37,
            "feels_like": 285.68,
            "pressure": 1012,
            "humidity": 32,
            "dew_point": 270.28,
            "uvi": 0,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 2.03,
            "wind_deg": 48,
            "wind_gust": 1.96,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637366400,
            "temp": 287.16,
            "feels_like": 285.45,
            "pressure": 1012,
            "humidity": 32,
            "dew_point": 269.99,
            "uvi": 0,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 1.99,
            "wind_deg": 42,
            "wind_gust": 1.91,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637370000,
            "temp": 286.94,
            "feels_like": 285.18,
            "pressure": 1013,
            "humidity": 31,
            "dew_point": 269.73,
            "uvi": 0,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 1.88,
            "wind_deg": 37,
            "wind_gust": 1.78,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637373600,
            "temp": 286.9,
            "feels_like": 285.17,
            "pressure": 1013,
            "humidity": 32,
            "dew_point": 269.75,
            "uvi": 0,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 1.82,
            "wind_deg": 34,
            "wind_gust": 1.75,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637377200,
            "temp": 289.36,
            "feels_like": 287.82,
            "pressure": 1014,
            "humidity": 30,
            "dew_point": 271.21,
            "uvi": 0.29,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 1.52,
            "wind_deg": 27,
            "wind_gust": 1.5,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637380800,
            "temp": 292.17,
            "feels_like": 290.75,
            "pressure": 1014,
            "humidity": 24,
            "dew_point": 270.68,
            "uvi": 1.03,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 0.89,
            "wind_deg": 327,
            "wind_gust": 1.02,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637384400,
            "temp": 293.89,
            "feels_like": 292.59,
            "pressure": 1014,
            "humidity": 22,
            "dew_point": 270.77,
            "uvi": 2.16,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 1.48,
            "wind_deg": 289,
            "wind_gust": 1.33,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637388000,
            "temp": 295.36,
            "feels_like": 294.16,
            "pressure": 1014,
            "humidity": 20,
            "dew_point": 270.85,
            "uvi": 3.21,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 1.87,
            "wind_deg": 276,
            "wind_gust": 1.44,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637391600,
            "temp": 296.44,
            "feels_like": 295.29,
            "pressure": 1013,
            "humidity": 18,
            "dew_point": 270.66,
            "uvi": 3.73,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 2.21,
            "wind_deg": 269,
            "wind_gust": 1.6,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637395200,
            "temp": 297.07,
            "feels_like": 295.96,
            "pressure": 1012,
            "humidity": 17,
            "dew_point": 270.35,
            "uvi": 3.44,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 2.37,
            "wind_deg": 267,
            "wind_gust": 1.96,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637398800,
            "temp": 297.31,
            "feels_like": 296.23,
            "pressure": 1012,
            "humidity": 17,
            "dew_point": 270.21,
            "uvi": 2.48,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 2.53,
            "wind_deg": 268,
            "wind_gust": 2.12,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637402400,
            "temp": 296.94,
            "feels_like": 295.82,
            "pressure": 1011,
            "humidity": 17,
            "dew_point": 270.31,
            "uvi": 1.34,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 2.55,
            "wind_deg": 270,
            "wind_gust": 1.98,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637406000,
            "temp": 295.55,
            "feels_like": 294.39,
            "pressure": 1011,
            "humidity": 21,
            "dew_point": 271.98,
            "uvi": 0.46,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 2.41,
            "wind_deg": 272,
            "wind_gust": 3,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637409600,
            "temp": 291.9,
            "feels_like": 290.48,
            "pressure": 1012,
            "humidity": 25,
            "dew_point": 271.15,
            "uvi": 0,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 1.95,
            "wind_deg": 292,
            "wind_gust": 2.45,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637413200,
            "temp": 290.73,
            "feels_like": 289.25,
            "pressure": 1013,
            "humidity": 27,
            "dew_point": 270.81,
            "uvi": 0,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 1.64,
            "wind_deg": 332,
            "wind_gust": 2.12,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637416800,
            "temp": 290.06,
            "feels_like": 288.54,
            "pressure": 1013,
            "humidity": 28,
            "dew_point": 270.73,
            "uvi": 0,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 1.81,
            "wind_deg": 5,
            "wind_gust": 2.15,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1637420400,
            "temp": 289.54,
            "feels_like": 287.99,
            "pressure": 1014,
            "humidity": 29,
            "dew_point": 270.76,
            "uvi": 0,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 1.84,
            "wind_deg": 16,
            "wind_gust": 2.02,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        }
    ],
    "daily": [
        {
            "dt": 1637215200,
            "sunrise": 1637199751,
            "sunset": 1637237021,
            "moonrise": 1637235180,
            "moonset": 1637195520,
            "moon_phase": 0.47,
            "temp": {
                "day": 294.87,
                "min": 286.94,
                "max": 296.94,
                "night": 287.47,
                "eve": 290.91,
                "morn": 288.31
            },
            "feels_like": {
                "day": 293.65,
                "night": 286.32,
                "eve": 289.6,
                "morn": 286.69
            },
            "pressure": 1016,
            "humidity": 21,
            "dew_point": 270.89,
            "wind_speed": 2.87,
            "wind_deg": 285,
            "wind_gust": 3.45,
            "weather": [
                {
                    "id": 801,
                    "main": "Clouds",
                    "description": "few clouds",
                    "icon": "02d"
                }
            ],
            "clouds": 24,
            "pop": 0,
            "uvi": 3.35
        },
        {
            "dt": 1637301600,
            "sunrise": 1637286208,
            "sunset": 1637323392,
            "moonrise": 1637323500,
            "moonset": 1637285340,
            "moon_phase": 0.5,
            "temp": {
                "day": 295.16,
                "min": 286.52,
                "max": 297.16,
                "night": 288.57,
                "eve": 291.9,
                "morn": 286.72
            },
            "feels_like": {
                "day": 293.96,
                "night": 287,
                "eve": 290.56,
                "morn": 285.05
            },
            "pressure": 1014,
            "humidity": 21,
            "dew_point": 271.17,
            "wind_speed": 3.04,
            "wind_deg": 297,
            "wind_gust": 3.28,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": 0,
            "pop": 0,
            "uvi": 3.72
        },
        {
            "dt": 1637388000,
            "sunrise": 1637372664,
            "sunset": 1637409764,
            "moonrise": 1637412060,
            "moonset": 1637375220,
            "moon_phase": 0.53,
            "temp": {
                "day": 295.36,
                "min": 286.9,
                "max": 297.31,
                "night": 288.5,
                "eve": 291.9,
                "morn": 287.16
            },
            "feels_like": {
                "day": 294.16,
                "night": 286.87,
                "eve": 290.48,
                "morn": 285.45
            },
            "pressure": 1014,
            "humidity": 20,
            "dew_point": 270.85,
            "wind_speed": 2.55,
            "wind_deg": 270,
            "wind_gust": 3,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": 0,
            "pop": 0,
            "uvi": 3.73
        },
        {
            "dt": 1637474400,
            "sunrise": 1637459120,
            "sunset": 1637496138,
            "moonrise": 1637500860,
            "moonset": 1637465040,
            "moon_phase": 0.56,
            "temp": {
                "day": 295.19,
                "min": 286.7,
                "max": 297.58,
                "night": 288.71,
                "eve": 291.96,
                "morn": 287.03
            },
            "feels_like": {
                "day": 293.89,
                "night": 287,
                "eve": 290.5,
                "morn": 285.28
            },
            "pressure": 1017,
            "humidity": 17,
            "dew_point": 268.83,
            "wind_speed": 2.57,
            "wind_deg": 294,
            "wind_gust": 3.34,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": 0,
            "pop": 0,
            "uvi": 3.74
        },
        {
            "dt": 1637560800,
            "sunrise": 1637545576,
            "sunset": 1637582514,
            "moonrise": 1637590080,
            "moonset": 1637554740,
            "moon_phase": 0.59,
            "temp": {
                "day": 295.74,
                "min": 287.06,
                "max": 297.71,
                "night": 288.73,
                "eve": 292.08,
                "morn": 287.06
            },
            "feels_like": {
                "day": 294.45,
                "night": 286.97,
                "eve": 290.6,
                "morn": 285.19
            },
            "pressure": 1014,
            "humidity": 15,
            "dew_point": 267.08,
            "wind_speed": 3.14,
            "wind_deg": 289,
            "wind_gust": 3.4,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": 0,
            "pop": 0,
            "uvi": 3.82
        },
        {
            "dt": 1637647200,
            "sunrise": 1637632032,
            "sunset": 1637668892,
            "moonrise": 1637679540,
            "moonset": 1637644260,
            "moon_phase": 0.62,
            "temp": {
                "day": 295.45,
                "min": 286.83,
                "max": 297.81,
                "night": 288.6,
                "eve": 291.83,
                "morn": 286.83
            },
            "feels_like": {
                "day": 294.02,
                "night": 286.78,
                "eve": 290.22,
                "morn": 284.83
            },
            "pressure": 1013,
            "humidity": 11,
            "dew_point": 263.54,
            "wind_speed": 2.29,
            "wind_deg": 56,
            "wind_gust": 2.19,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": 0,
            "pop": 0,
            "uvi": 4
        },
        {
            "dt": 1637733600,
            "sunrise": 1637718488,
            "sunset": 1637755271,
            "moonrise": 1637769300,
            "moonset": 1637733480,
            "moon_phase": 0.65,
            "temp": {
                "day": 295.25,
                "min": 287.02,
                "max": 297.03,
                "night": 288.63,
                "eve": 291.61,
                "morn": 287.02
            },
            "feels_like": {
                "day": 293.88,
                "night": 286.81,
                "eve": 290.03,
                "morn": 285.04
            },
            "pressure": 1016,
            "humidity": 14,
            "dew_point": 266.38,
            "wind_speed": 2.35,
            "wind_deg": 47,
            "wind_gust": 2.22,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": 0,
            "pop": 0,
            "uvi": 4
        },
        {
            "dt": 1637820000,
            "sunrise": 1637804943,
            "sunset": 1637841652,
            "moonrise": 1637859240,
            "moonset": 1637822400,
            "moon_phase": 0.68,
            "temp": {
                "day": 295.06,
                "min": 286.96,
                "max": 296.9,
                "night": 288.05,
                "eve": 291.4,
                "morn": 286.96
            },
            "feels_like": {
                "day": 293.72,
                "night": 286.33,
                "eve": 289.88,
                "morn": 284.97
            },
            "pressure": 1016,
            "humidity": 16,
            "dew_point": 267.96,
            "wind_speed": 2.85,
            "wind_deg": 278,
            "wind_gust": 2.89,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": 0,
            "pop": 0,
            "uvi": 4
        }
    ]
}
*/