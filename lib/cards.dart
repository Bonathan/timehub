// @dart=2.10
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:timehub/functions.dart';
import 'package:timehub/globals.dart' as globals;
import 'package:timehub/screens.dart';
import 'package:ionicons/ionicons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:webfeed/webfeed.dart';
import 'dart:async';
import 'package:material_clock/material_clock.dart' as materialClock;

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
    return UniCard(
        content: Container(
          margin: EdgeInsets.only(
            top: 175,
          ),
          child: ForecastWrapper(),
        ),
        title: "Forecast");
  }
}

class ForecastWrapper extends StatelessWidget {
  const ForecastWrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    globals.deviceSize = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
  var time = DateTime.now();
  var forecastNumber;

  @override
  _ForecastElementState createState() => _ForecastElementState();
}

class _ForecastElementState extends State<ForecastElement> {
  void initState() {
    Timer(new Duration(seconds: 1), () {
      setState(() {
        widget.icon = getWeatherIcon(
            globals.forecast[widget.forecastNumber].weatherIcon, Colors.black);
        widget.time = DateTime.now();
      });
    });
    Timer.periodic(new Duration(seconds: 5), (timer) {
      setState(() {
        widget.icon = getWeatherIcon(
            globals.forecast[widget.forecastNumber].weatherIcon, Colors.black);
        widget.time = DateTime.now();
        if (widget.icon == null) {
          setState(() {
            widget.icon = Icon(
              Ionicons.build_outline,
              size: 50,
              color: globals.trueBlack,
            );
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(1),
          width: globals.cardWidth / 5,
          height: globals.cardWidth / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.icon,
              Text(
                  formatterTime.format(
                      widget.time.add(Duration(hours: widget.addedTime))),
                  style: GoogleFonts.redHatDisplay(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          color: globals.trueBlack))),
              Text(
                "+${widget.addedTime} hours",
                style: TextStyle(color: globals.trueBlack),
              ),
            ],
          ),
        ));
  }
}

//
// RSS reader widget
//

class RssReader extends StatelessWidget {
  const RssReader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getFeedRss();
    return UniCard(content: Feed(), title: "News");
  }
}

////////////////////////////////////////
//                                    //
// Unicard                            //
//                                    //
////////////////////////////////////////

class UniCard extends StatelessWidget {
  const UniCard({
    Key key,
    @required this.content,
    @required this.title,
  }) : super(key: key);

  final content;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: globals.borderRadius,
        color: globals.cardBack,
        boxShadow: globals.boxShadow,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: 25),
            child: Text(this.title,
                style: GoogleFonts.redHatDisplay(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 30,
                        color: globals.trueBlack))),
            height: 75,
          ),
          Container(
            height: 375,
            child: this.content,
            margin: EdgeInsets.only(right: 5, bottom: 35),
          ),
          Container(
            margin: EdgeInsets.only(top: 25, bottom: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: globals.darkGrey),
            height: 5,
            width: 150,
          )
        ],
      ),
    );
  }
}
