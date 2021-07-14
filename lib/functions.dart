import 'dart:async';

import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:timehub/globals.dart' as globals;
import 'package:weather/weather.dart';
import 'package:flutter/material.dart';

final DateFormat formatter = DateFormat('d MMMM');
final DateFormat formatterTime = DateFormat('HH:mm');
var forecastIcon;

void getWeather() async {
  Weather weather =
      await globals.weatherFactory.currentWeatherByCityName(globals.weatherLocation);
  globals.weather = weather;
  globals.currentWeather = weather.weatherDescription;
  globals.currentWeatherId = weather.weatherConditionCode;
  globals.currentWeatherTemp = weather.temperature;
  globals.currentWeatherTempFeel = weather.tempFeelsLike;
  globals.weatherIcon = getWeatherIcon(weather.weatherIcon, Colors.black);
  globals.forecast =
      await globals.weatherFactory.fiveDayForecastByCityName(globals.weatherLocation);
  print(weather);
}

getWeatherIcon(requestedIcon, reqColor) {
  //set icon
  if (requestedIcon.toString() == '01d') {
    globals.currentWeatherId = Icon(Ionicons.sunny_outline);
  } else if (requestedIcon.toString() == '02d') {
    return Icon(
      Ionicons.partly_sunny_outline,
      size: 50,
      color: reqColor,
    );
  } else if (requestedIcon == '03d') {
    return Icon(
      Ionicons.cloud_outline,
      color: reqColor,
      size: 50,
    );
  } else if (requestedIcon == '04d') {
    return Icon(
      Ionicons.cloud_outline,
      color: reqColor,
      size: 50,
    );
  } else if (requestedIcon == '09d') {
    return Icon(
      Ionicons.rainy_outline,
      color: reqColor,
      size: 50,
    );
  } else if (requestedIcon == '10d') {
    return Icon(
      Ionicons.rainy_outline,
      color: reqColor,
      size: 50,
    );
  } else if (requestedIcon == '11d') {
    return Icon(
      Ionicons.thunderstorm_outline,
      color: reqColor,
      size: 50,
    );
  } else if (requestedIcon == '13d') {
    return Icon(
      Ionicons.snow_outline,
      color: reqColor,
      size: 50,
    );
  } else if (requestedIcon == '50d') {
    return Icon(
      Ionicons.cloud_outline,
      size: 50,
      color: reqColor,
    );
  } else if (requestedIcon == '01n') {
    return Icon(
      Ionicons.sunny_outline,
      size: 50,
      color: reqColor,
    );
  } else if (requestedIcon == '02n') {
    return Icon(
      Ionicons.cloud_outline,
      color: reqColor,
      size: 50,
    );
  } else if (requestedIcon == '03n') {
    return Icon(
      Ionicons.cloud_outline,
      color: reqColor,
      size: 50,
    );
  } else if (requestedIcon == '04n') {
    return Icon(
      Ionicons.cloud_outline,
      size: 50,
      color: reqColor,
    );
  } else if (requestedIcon == '09n') {
    return Icon(
      Ionicons.rainy_outline,
      color: reqColor,
      size: 50,
    );
  } else if (requestedIcon == '10n') {
    return Icon(
      Ionicons.rainy_outline,
      color: reqColor,
      size: 50,
    );
  } else if (requestedIcon == '11n') {
    return Icon(
      Ionicons.thunderstorm_outline,
      color: reqColor,
      size: 50,
    );
  } else if (requestedIcon == '13n') {
    return Icon(
      Ionicons.snow_outline,
      color: reqColor,
      size: 50,
    );
  } else if (requestedIcon == '50d') {
    return Icon(
      Ionicons.cloud_outline,
      color: reqColor,
      size: 50,
    );
  } else {
    return Icon(Ionicons.eye_off);
  }
}
/*
setForecastIcon(requestedIcon, iconLocation) {
  var icon;
  icon = getWeatherIcon(requestedIcon);
  iconLocation = icon;
  print(icon);
  print(globals.forecastIcon[1].toString());
  print(iconLocation);
  Timer.periodic(Duration(minutes: 5), (Timer t) {
    icon = getWeatherIcon(requestedIcon);
    iconLocation = icon;
    print("here");
    return iconLocation;
  });
}

getForecast() async {
  List<Weather> forecast =
      await globals.weatherFactory.fiveDayForecastByCityName('La Tzoumaz');
  globals.forecast = forecast;
  print("I'm here");
  forecastIcon[0] = getWeatherIcon(forecast[0].weatherIcon);
  forecastIcon[1] = getWeatherIcon(forecast[1].weatherIcon);
  forecastIcon[2] = getWeatherIcon(forecast[2].weatherIcon);
  forecastIcon[3] = getWeatherIcon(forecast[3].weatherIcon);
  forecastIcon[4] = getWeatherIcon(forecast[4].weatherIcon);
}

getTime() {
  globals.time = DateTime.now();
}*/

//><