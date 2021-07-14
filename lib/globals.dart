// @dart=2.10
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:ionicons/ionicons.dart';
import 'package:timehub/private_keys.dart' as privatekey;

double cardWidth = 400;
var deviceSize;

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
var weatherLocation = 'Mazan';
var currentWeather;
var currentWeatherId;
var currentWeatherTemp;
var currentWeatherTempFeel;
var weatherIcon;

List<Weather> forecast;
var forecastIcon = List.filled(
    5,
    Icon(
      Ionicons.build_outline,
      size: 50,
      color: trueWhite,
    ),
    growable: true);

final cardBack = Colors.grey[900];
final desaturatedRed = Colors.red[600];
final darkGrey = Colors.grey[900];
final trueBlack = Colors.black;
final trueWhite = Colors.white;

final timeDateSmall = 0;
