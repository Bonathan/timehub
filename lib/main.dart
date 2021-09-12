// @dart=2.10
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:timehub/frontend/wrapper.dart';
import 'package:timehub/functions/weather.dart';
import 'package:timehub/functions/news.dart';
import 'package:timehub/globals.dart' as globals;
import 'package:intl/intl.dart';

var formattedTime;
final DateFormat formatter = DateFormat('d MMMM');
final DateFormat formatterTime = DateFormat('HH:mm');
final pageController = PageController(initialPage: 0);
var time = DateTime.now();
var month;
var hour;
var deviceSize;

void setTime() {
  globals.time = DateTime.now();
  month = formatter.format(time);
  hour = formatterTime.format(time);
}

void main() async {
  await getFeedRss();
  setTime();
  await getWeather();
  Timer.periodic(Duration(seconds: 1), (Timer t) => setTime());
  Timer.periodic(Duration(seconds: 5), (Timer t) => getWeather());
  Timer(new Duration(seconds: 5), () => print(globals.deviceSize));
  runApp(MainWrapper());
}
