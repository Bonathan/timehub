// @dart=2.10
import 'dart:async';
//import 'package:flutter/services.dart';
//import 'package:timehub/frontend/cards.dart' as cards;
import 'package:flutter/material.dart';
import 'package:timehub/frontend/forecast.dart' as forecard;
//import 'package:ionicons/ionicons.dart';
import 'package:timehub/frontend/news.dart' as newscard;
import 'package:timehub/frontend/wrapper.dart';
import 'package:timehub/functions/weather.dart';
import 'package:timehub/functions/news.dart';
import 'package:timehub/globals.dart' as globals;
import 'package:timehub/globals/styles.dart' as styles;
import 'package:intl/intl.dart';
import 'package:timehub/functions/supabase.dart' as supabaseService;
import 'package:timehub/frontend/supabase.dart' as supabaseCards;

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

void main() async {
  await getFeedRss();
  setTime();
  //getForecast();
  await getWeather(); //Timer.periodic(Duration(seconds: 1), (Timer t) => getTime());
  Timer.periodic(Duration(seconds: 1), (Timer t) => setTime());
  Timer.periodic(Duration(seconds: 5), (Timer t) => getWeather());
  //Timer.periodic(Duration(minutes: 5), (Timer t) => getForecast());
  Timer(new Duration(seconds: 5), () => print(globals.deviceSize));
  runApp(MainWrapper());
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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: styles.trueWhite,
        body: Container(
          padding: EdgeInsets.fromLTRB(50, 25, 50, 25),
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
          children: [
            //forecard.Forecast(),
            newscard.RssReader(),
            supabaseCards.ToDoLogin()
          ],
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                Container(
                    margin: EdgeInsets.only(top: 25),
                    child: Text(
                      formatterTime.format(time) +
                          ' | ' +
                          formatter.format(time),
                      style: styles.text,
                    )),
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              globals.currentWeatherTemp.celsius
                                      .round()
                                      .toString() +
                                  '°',
                              style: styles.head),
                          Text(globals.currentWeather.toString(),
                              style: styles.text)
                        ],
                      ),
                    ),
                  ],
                ))
              ])),
        ]));
  }
}
