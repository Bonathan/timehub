// @dart=2.10
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:timehub/functions.dart';
import 'package:timehub/globals.dart' as globals;
import 'package:ionicons/ionicons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:material_clock/material_clock.dart' as materialClock;

double cardWidth = 400;
final DateFormat formatterTime = DateFormat('HH:mm');
var mondayIcon = Icon(Ionicons.cloud_outline);

//
//  Time
//
/*
class Time extends StatelessWidget {
  const Time({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      decoration: BoxDecoration(
          borderRadius: globals.borderRadius,
          color: globals.cardBack,
          boxShadow: globals.boxShadow),
      width: cardWidth,
      child: Clock1(),
    );
  }
}

class Clock1 extends StatelessWidget {
  const Clock1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: materialClock.Clock(
        theme: Brightness.light,
        backgroundStyle: PaintingStyle.stroke,
        secondHandColor: globals.desaturatedRed,
        live: true,
        time: DateTime.now(),
      ),
    );
  }
}
*/
//
//  Forecast
//

class Forecast extends StatelessWidget {
  const Forecast({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: globals.borderRadius,
        color: globals.cardBack,
        boxShadow: globals.boxShadow,
      ),
      width: cardWidth,
      child: ForecastWrapper(),
    );
  }
}

class ForecastWrapper extends StatelessWidget {
  const ForecastWrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [MondayFore(), TuesFore()],
    );
  }
}

class MondayFore extends StatefulWidget {
  const MondayFore({Key key}) : super(key: key);

  @override
  _MondayForeState createState() => _MondayForeState();
}

class _MondayForeState extends State<MondayFore> {
  void initState() {
    Timer.periodic(new Duration(minutes: 1), (timer) {
      setState(() {
        globals.time = DateTime.now();
        globals.forecastIcon[0] =
            getWeatherIcon(globals.forecast[0].weatherIcon);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(1),
          width: cardWidth / 5,
          height: cardWidth / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              globals.forecastIcon[0],
              Text(
                  formatterTime
                      .format(globals.time.add(new Duration(hours: 3))),
                  style: GoogleFonts.redHatDisplay(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          color: globals.trueBlack))),
            ],
          ),
        ));
  }
}

class TuesFore extends StatefulWidget {
  const TuesFore({Key key}) : super(key: key);

  @override
  TuesForeState createState() => TuesForeState();
}

class TuesForeState extends State<TuesFore> {
  void initState() {
    Timer.periodic(new Duration(minutes: 1), (timer) {
      setState(() {
        globals.time = DateTime.now();
        globals.forecastIcon[1] =
            getWeatherIcon(globals.forecast[1].weatherIcon);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(1),
          width: cardWidth / 5,
          height: cardWidth / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              globals.forecastIcon[1],
              Text(
                  formatterTime
                      .format(globals.time.add(new Duration(hours: 6))),
                  style: GoogleFonts.redHatDisplay(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          color: globals.trueBlack))),
            ],
          ),
        ));
  }
}
