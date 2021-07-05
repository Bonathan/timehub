import 'dart:async';

import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:timehub/globals.dart' as globals;
import 'package:weather/weather.dart';
import 'package:flutter/material.dart';

void getWeather() async {
  Weather weather =
      await globals.weatherFactory.currentWeatherByCityName("Basel");
  globals.weather = weather;
  globals.currentWeather = weather.weatherDescription;
  globals.currentWeatherId = weather.weatherConditionCode;
  globals.currentWeatherTemp = weather.temperature;
  globals.currentWeatherTempFeel = weather.tempFeelsLike;
  globals.weatherIcon = getWeatherIcon(globals.weather.weatherIcon);
}

getWeatherIcon(requestedIcon) {
  //set icon
  if (requestedIcon.toString() == '01d') {
    globals.currentWeatherId = Icon(Ionicons.sunny_outline);
  } else if (requestedIcon.toString() == '02d') {
    return Icon(
      Ionicons.cloud_outline,
      size: 50,
    );
  } else if (requestedIcon == '03d') {
    return Icon(
      Ionicons.cloud_outline,
      size: 50,
    );
  } else if (requestedIcon == '04d') {
    return Icon(
      Ionicons.cloud_outline,
      size: 50,
    );
  } else if (requestedIcon == '09d') {
    return Icon(
      Ionicons.rainy_outline,
      size: 50,
    );
  } else if (requestedIcon == '10d') {
    return Icon(
      Ionicons.rainy_outline,
      size: 50,
    );
  } else if (requestedIcon == '11d') {
    return Icon(
      Ionicons.thunderstorm_outline,
      size: 50,
    );
  } else if (requestedIcon == '13d') {
    return Icon(
      Ionicons.snow_outline,
      size: 50,
    );
  } else if (requestedIcon == '50d') {
    return Icon(Ionicons.cloud_outline, size: 50);
  } else if (requestedIcon == '01n') {
    return Icon(Ionicons.sunny_outline, size: 50);
  } else if (requestedIcon == '02n') {
    return Icon(
      Ionicons.cloud_outline,
      size: 50,
    );
  } else if (requestedIcon == '03n') {
    return Icon(
      Ionicons.cloud_outline,
      size: 50,
    );
  } else if (requestedIcon == '04n') {
    return Icon(
      Ionicons.cloud_outline,
      size: 50,
    );
  } else if (requestedIcon == '09n') {
    return Icon(
      Ionicons.rainy_outline,
      size: 50,
    );
  } else if (requestedIcon == '10n') {
    return Icon(
      Ionicons.rainy_outline,
      size: 50,
    );
  } else if (requestedIcon == '11n') {
    return Icon(
      Ionicons.thunderstorm_outline,
      size: 50,
    );
  } else if (requestedIcon == '13n') {
    return Icon(
      Ionicons.snow_outline,
      size: 50,
    );
  } else if (requestedIcon == '50d') {
    return Icon(
      Ionicons.cloud_outline,
      size: 50,
    );
  }
}

setForecastIcon(requestedIcon, iconLocation) {
  var icon;
  getWeatherIcon(requestedIcon);
  Timer.periodic(Duration(minutes: 5), (Timer t) {
    getWeatherIcon(requestedIcon);
    iconLocation = icon;
  });
}

void getForecast() async {
  List<Weather> forecast =
      await globals.weatherFactory.fiveDayForecastByCityName('Basel');
  globals.forecast = forecast;
  globals.plus3Forecast = globals.forecast[0];
  globals.plus6Forecast = globals.forecast[1];
  globals.plus9Forecast = globals.forecast[2];
  globals.plus12Forecast = globals.forecast[3];
  globals.plus15Forecast = globals.forecast[4];
  setForecastIcon(globals.forecast[0], globals.plus3ForecastIcon);
  setForecastIcon(globals.forecast[1], globals.plus6ForecastIcon);
  setForecastIcon(globals.forecast[2], globals.plus9ForecastIcon);
  setForecastIcon(globals.forecast[3], globals.plus12ForecastIcon);
  setForecastIcon(globals.forecast[4], globals.plus15ForecastIcon);
}

getTime() {
  globals.time = DateTime.now();
  return globals.time;
}

//><