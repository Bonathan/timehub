import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:ionicons/ionicons.dart';
import 'package:timehub/private_keys.dart' as privatekey;

final boxShadow = [
  BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 20)
];

final borderRadius = BorderRadius.circular(25);
WeatherFactory weatherFactory =
    new WeatherFactory(privatekey.OpenWeatherAPIKey);

var time;
var formattedTimeHour;
var formattedTimeMonth;

var weather;
var currentWeather;
var currentWeatherId;
var currentWeatherTemp;
var currentWeatherTempFeel;
var weatherIcon;

var forecast;
var plus3Forecast;
var plus6Forecast;
var plus9Forecast;
var plus12Forecast;
var plus15Forecast;
var plus3ForecastIcon;
var plus6ForecastIcon;
var plus9ForecastIcon;
var plus12ForecastIcon;
var plus15ForecastIcon;

final lightBlack = Colors.grey[900];
final desaturatedRed = Colors.red[300];

final timeDateSmall = 0;
