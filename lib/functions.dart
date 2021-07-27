import 'dart:async';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:timehub/globals.dart' as globals;
import 'package:weather/weather.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:webfeed/domain/atom_feed.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'package:flutter/material.dart';

final DateFormat formatter = DateFormat('d MMMM');
final DateFormat formatterTime = DateFormat('HH:mm');
var forecastIcon;

void getWeather() async {
  Weather weather = await globals.weatherFactory
      .currentWeatherByCityName(globals.weatherLocation);
  globals.weather = weather;
  globals.currentWeather = weather.weatherDescription;
  globals.currentWeatherId = weather.weatherConditionCode;
  globals.currentWeatherTemp = weather.temperature;
  globals.currentWeatherTempFeel = weather.tempFeelsLike;
  globals.weatherIcon = getWeatherIcon(weather.weatherIcon, Colors.black);
  globals.forecast = await globals.weatherFactory
      .fiveDayForecastByCityName(globals.weatherLocation);
  print(globals.weatherLocation);
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

class Feed1 {
  final _targetUrl = Uri.parse('https://www.srf.ch/news/bnf/rss/1890');

  Future<RssFeed> getFeed() =>
      http.read(_targetUrl).then((xmlString) => RssFeed.parse(xmlString));
}

final targetUrl = Uri.parse('https://www.becompany.ch/en/blog/feed.xml');

void getFeedRss() async {
  final RssFeed feed = await Feed1().getFeed();
  globals.feed = feed;
}

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getFeedRss();
    return ListView.builder(
        itemCount: 15,
        itemBuilder: (BuildContext ctxt, int index) {
          final item = globals.feed.items![index];
          return ListTile(
            contentPadding: EdgeInsets.fromLTRB(35, 2, 45, 2),
            title: Text(item.title.toString(),
                style: GoogleFonts.redHatText(
                    textStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 18))),
          );
        });
  }
}
