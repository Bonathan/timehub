// @dart=2.10
import 'dart:async';
import 'package:timehub/cards.dart' as cards;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timehub/functions.dart';
import 'package:timehub/globals.dart' as globals;
import 'package:intl/intl.dart';

final DateFormat formatter = DateFormat('d MMMM');
final DateFormat formatterTime = DateFormat('hh:mm');
var formattedTime;
final pageController = PageController(initialPage: 0);
var time;

void main() async {
  getTime();
  getForecast();
  getWeather();
  Timer.periodic(Duration(seconds: 1), (Timer t) => getTime());
  Timer.periodic(Duration(seconds: 1), (Timer t) => getWeather());
  Timer.periodic(Duration(seconds: 1), (Timer t) => getForecast());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.fromLTRB(200, 100, 200, 100),
          child: CardManager(),
        ),
      ),
    );
  }
}

class CardManager extends StatefulWidget {
  const CardManager({Key key}) : super(key: key);

  @override
  _CardManagerState createState() => _CardManagerState();
}

class _CardManagerState extends State<CardManager> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Time(),
      Container(
        width: 500,
        child: PageView(
          controller: pageController,
          children: [cards.Time(), cards.Forecast()],
        ),
      ),
    ]);
  }
}

class Time extends StatefulWidget {
  const Time({Key key}) : super(key: key);

  @override
  _TimeState createState() => _TimeState();
}

class _TimeState extends State<Time> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
          Container(
            child: Column(children: [
              Text(formatterTime.format(globals.time),
                  style: GoogleFonts.redHatDisplay(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 125))),
              Text(
                formatter.format(globals.time),
                style: GoogleFonts.redHatDisplay(
                    textStyle:
                        TextStyle(fontWeight: FontWeight.w300, fontSize: 25)),
              ),
            ]),
          ),
          Container(
              child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Text(
                      globals.currentWeatherTempFeel.toString(),
                      style: GoogleFonts.redHatDisplay(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 30)),
                    ),
                    Text(
                      globals.currentWeatherTemp.toString(),
                      style: GoogleFonts.redHatDisplay(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 15)),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 25),
                child: globals.weatherIcon,
              )
            ],
          ))
        ]));
  }
}