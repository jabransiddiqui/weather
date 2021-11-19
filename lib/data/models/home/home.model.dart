import 'dart:convert';

class HomeModel {
    HomeModel({
        required this.lat,
        required this.lon,
        required this.timezone,
        required this.timezoneOffset,
        required this.current,
        required this.hourly,
        required this.daily,
    });

    dynamic lat;
    dynamic lon;
    String timezone;
    dynamic timezoneOffset;
    Current current;
    List<Hourly> hourly;
    List<Daily> daily;

    factory HomeModel.fromJson(String str) => HomeModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory HomeModel.fromMap(Map<String, dynamic> json) => HomeModel(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        timezone: json["timezone"],
        timezoneOffset: json["timezone_offset"],
        current: Current.fromMap(json["current"]),
        hourly: List<Hourly>.from(json["hourly"].map((x) => Hourly.fromMap(x))),
        daily: List<Daily>.from(json["daily"].map((x) => Daily.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "lat": lat,
        "lon": lon,
        "timezone": timezone,
        "timezone_offset": timezoneOffset,
        "current": current.toMap(),
        "hourly": List<dynamic>.from(hourly.map((x) => x.toMap())),
        "daily": List<dynamic>.from(daily.map((x) => x.toMap())),
    };
}

class Current {
    Current({
        required this.dt,
        required this.sunrise,
        required this.sunset,
        required this.temp,
        required this.feelsLike,
        required this.pressure,
        required this.humidity,
        required this.dewPoint,
        required this.uvi,
        required this.clouds,
        required this.visibility,
        required this.windSpeed,
        required this.windDeg,
        required this.weather,
        required this.windGust,
        required this.pop,
    });

    dynamic dt;
    dynamic sunrise;
    dynamic sunset;
    dynamic temp;
    dynamic feelsLike;
    dynamic pressure;
    dynamic humidity;
    dynamic dewPoint;
    dynamic uvi;
    dynamic clouds;
    dynamic visibility;
    dynamic windSpeed;
    dynamic windDeg;
    List<Weather> weather;
    dynamic windGust;
    dynamic pop;

    factory Current.fromJson(String str) => Current.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Current.fromMap(Map<String, dynamic> json) => Current(
        dt: json["dt"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
        dewPoint: json["dew_point"].toDouble(),
        uvi: json["uvi"].toDouble(),
        clouds: json["clouds"],
        visibility: json["visibility"],
        windSpeed: json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"],
        weather: List<Weather>.from(json["weather"].map((x) => Weather.fromMap(x))),
        windGust: json["wind_gust"],
        pop: json["pop"],
    );

    Map<String, dynamic> toMap() => {
        "dt": dt,
        "sunrise": sunrise ,
        "sunset": sunset,
        "temp": temp,
        "feels_like": feelsLike,
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "uvi": uvi,
        "clouds": clouds,
        "visibility": visibility,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "weather": List<dynamic>.from(weather.map((x) => x.toMap())),
        "wind_gust": windGust,
        "pop": pop,
    };
}
class Hourly {
    Hourly({
        required this.dt,
        required this.temp,
        required this.feelsLike,
        required this.pressure,
        required this.humidity,
        required this.dewPoint,
        required this.uvi,
        required this.clouds,
        required this.visibility,
        required this.windSpeed,
        required this.windDeg,
        required this.windGust,
        required this.weather,
        required this.pop,
    });

    dynamic dt;
    dynamic temp;
    dynamic feelsLike;
    dynamic pressure;
    dynamic humidity;
    dynamic dewPoint;
    dynamic uvi;
    dynamic clouds;
    dynamic visibility;
    dynamic windSpeed;
    dynamic windDeg;
    dynamic windGust;
    List<Weather> weather;
    dynamic pop;

    factory Hourly.fromJson(String str) => Hourly.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Hourly.fromMap(Map<String, dynamic> json) => Hourly(
        dt: json["dt"],
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
        dewPoint: json["dew_point"].toDouble(),
        uvi: json["uvi"],
        clouds: json["clouds"],
        visibility: json["visibility"],
        windSpeed: json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"],
        windGust: json["wind_gust"].toDouble(),
        weather: List<Weather>.from(json["weather"].map((x) => Weather.fromMap(x))),
        pop: json["pop"],
    );

    Map<String, dynamic> toMap() => {
        "dt": dt,
        "temp": temp,
        "feels_like": feelsLike,
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "uvi": uvi,
        "clouds": clouds,
        "visibility": visibility,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "wind_gust": windGust,
        "weather": List<dynamic>.from(weather.map((x) => x.toMap())),
        "pop": pop,
    };
}




class Weather {
    Weather({
        required this.id,
        required this.main,
        required this.description,
        required this.icon,
    });

    dynamic id;
    String main;
    String description;
    String icon;

    factory Weather.fromJson(String str) => Weather.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Weather.fromMap(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
    };
}


class Daily {
    Daily({
        required this.dt,
        required this.sunrise,
        required this.sunset,
        required this.moonrise,
        required this.moonset,
        required this.moonPhase,
        required this.temp,
        required this.feelsLike,
        required this.pressure,
        required this.humidity,
        required this.dewPoint,
        required this.windSpeed,
        required this.windDeg,
        required this.windGust,
        required this.weather,
        required this.clouds,
        required this.pop,
        required this.uvi,
        required this.rain,
    });

    dynamic dt;
    dynamic sunrise;
    dynamic sunset;
    dynamic moonrise;
    dynamic moonset;
    dynamic moonPhase;
    Temp temp;
    FeelsLike feelsLike;
    dynamic pressure;
    dynamic humidity;
    dynamic dewPoint;
    dynamic windSpeed;
    dynamic windDeg;
    dynamic windGust;
    List<Weather> weather;
    dynamic clouds;
    dynamic pop;
    dynamic uvi;
    dynamic rain;

    factory Daily.fromJson(String str) => Daily.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Daily.fromMap(Map<String, dynamic> json) => Daily(
        dt: json["dt"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        moonrise: json["moonrise"],
        moonset: json["moonset"],
        moonPhase: json["moon_phase"].toDouble(),
        temp: Temp.fromMap(json["temp"]),
        feelsLike: FeelsLike.fromMap(json["feels_like"]),
        pressure: json["pressure"],
        humidity: json["humidity"],
        dewPoint: json["dew_point"].toDouble(),
        windSpeed: json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"],
        windGust: json["wind_gust"].toDouble(),
        weather: List<Weather>.from(json["weather"].map((x) => Weather.fromMap(x))),
        clouds: json["clouds"],
        pop: json["pop"].toDouble(),
        uvi: json["uvi"].toDouble(),
        rain: json["rain"],
    );

    Map<String, dynamic> toMap() => {
        "dt": dt,
        "sunrise": sunrise,
        "sunset": sunset,
        "moonrise": moonrise,
        "moonset": moonset,
        "moon_phase": moonPhase,
        "temp": temp.toMap(),
        "feels_like": feelsLike.toMap(),
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "wind_gust": windGust,
        "weather": List<dynamic>.from(weather.map((x) => x.toMap())),
        "clouds": clouds,
        "pop": pop,
        "uvi": uvi,
        "rain": rain,
    };
}

class FeelsLike {
    FeelsLike({
        required this.day,
        required this.night,
        required this.eve,
        required this.morn,
    });

    dynamic day;
    dynamic night;
    dynamic eve;
    dynamic morn;

    factory FeelsLike.fromJson(String str) => FeelsLike.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory FeelsLike.fromMap(Map<String, dynamic> json) => FeelsLike(
        day: json["day"].toDouble(),
        night: json["night"].toDouble(),
        eve: json["eve"].toDouble(),
        morn: json["morn"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "day": day,
        "night": night,
        "eve": eve,
        "morn": morn,
    };
}

class Temp {
    Temp({
        required this.day,
        required this.min,
        required this.max,
        required this.night,
        required this.eve,
        required this.morn,
    });

    dynamic day;
    dynamic min;
    dynamic max;
    dynamic night;
    dynamic eve;
    dynamic morn;

    factory Temp.fromJson(String str) => Temp.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Temp.fromMap(Map<String, dynamic> json) => Temp(
        day: json["day"].toDouble(),
        min: json["min"].toDouble(),
        max: json["max"].toDouble(),
        night: json["night"].toDouble(),
        eve: json["eve"].toDouble(),
        morn: json["morn"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "day": day,
        "min": min,
        "max": max,
        "night": night,
        "eve": eve,
        "morn": morn,
    };
}

