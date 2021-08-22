// @dart=2.10
//import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'package:ionicons/ionicons.dart';
import 'package:timehub/private_keys.dart' as privatekey;
import 'package:timehub/globals/styles.dart' as styles;

double cardWidth = 400;
var deviceSize;

final boxShadow = [
  BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 20)
];

final borderRadius = BorderRadius.circular(10);
WeatherFactory weatherFactory =
    new WeatherFactory(privatekey.OpenWeatherAPIKey);

var time;
var formattedTimeHour;
var formattedTimeMonth;

var weather;
var weatherLocation = 'Basel';
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
      color: styles.trueBlack,
    ),
    growable: true);

final timeDateSmall = 0;

RssFeed feed;
