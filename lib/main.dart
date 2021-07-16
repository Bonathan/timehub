// @dart=2.10
import 'dart:async';
import 'dart:io';
import 'package:timehub/cards.dart' as cards;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timehub/functions.dart';
import 'package:timehub/globals.dart' as globals;
import 'package:intl/intl.dart';

var formattedTime;
final DateFormat formatter = DateFormat('d MMMM');
final DateFormat formatterTime = DateFormat('HH:mm');
final pageController = PageController(initialPage: 0);
var time = DateTime.now();
var month;
var hour;

void setTime() {
  globals.time = DateTime.now();
  month = formatter.format(time);
  hour = formatterTime.format(time);
}

void main() {
  setTime();
  //getForecast();
  getWeather();
  //Timer.periodic(Duration(seconds: 1), (Timer t) => getTime());
  Timer.periodic(Duration(seconds: 1), (Timer t) => setTime());
  Timer.periodic(Duration(seconds: 5), (Timer t) => getWeather());
  //Timer.periodic(Duration(minutes: 5), (Timer t) => getForecast());
  Timer(new Duration(seconds: 5), () => print(globals.deviceSize));
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
          children: [/*cards.Time(),*/ cards.Forecast()],
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
  void initState() {
    Timer.periodic(new Duration(seconds: 1), (timer) {
      setState(() {
        time = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
          Container(
            child: Column(children: [
              Text(formatterTime.format(time),
                  style: GoogleFonts.redHatDisplay(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: /*125*/ 125))),
              Text(
                formatter.format(time),
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
