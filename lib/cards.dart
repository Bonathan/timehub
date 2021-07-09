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
      child: Center(
        child: ForecastWrapper(),
      ),
    );
  }
}

class ForecastWrapper extends StatelessWidget {
  const ForecastWrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ForecastElement(
            addedTime: 3, icon: globals.forecastIcon[0], forecastNumber: 0),
        ForecastElement(
          addedTime: 6,
          icon: globals.forecastIcon[1],
          forecastNumber: 1,
        ),
        ForecastElement(
          addedTime: 9,
          icon: globals.forecastIcon[2],
          forecastNumber: 2,
        ),
        ForecastElement(
          addedTime: 12,
          icon: globals.forecastIcon[3],
          forecastNumber: 3,
        ),
        ForecastElement(
          addedTime: 15,
          icon: globals.forecastIcon[4],
          forecastNumber: 4,
        ),
      ],
    );
  }
}

class ForecastElement extends StatefulWidget {
  ForecastElement({
    Key key,
    @required this.addedTime,
    @required this.icon,
    @required this.forecastNumber,
  }) : super(key: key);

  final int addedTime;
  var icon;
  var forecastNumber;

  @override
  _ForecastElementState createState() => _ForecastElementState();
}

class _ForecastElementState extends State<ForecastElement> {
  void initState() {
    Timer.periodic(new Duration(seconds: 10), (timer) {
      setState(() {
        widget.icon =
            getWeatherIcon(globals.forecast[widget.forecastNumber].weatherIcon);
        globals.time = DateTime.now();
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
              widget.icon,
              Text(
                  formatterTime.format(
                      globals.time.add(new Duration(hours: widget.addedTime))),
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
