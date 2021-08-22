import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timehub/functions/weather.dart';
import 'package:timehub/globals.dart' as globals;
import 'package:timehub/cards/cards.dart' as cards;
import 'package:timehub/functions/time.dart' as times;
import 'package:timehub/globals/styles.dart' as styles;
import 'dart:async';
import 'package:ionicons/ionicons.dart';

final DateFormat formatter = DateFormat('d MMMM');
final DateFormat formatterTime = DateFormat('HH:mm');
var forecastIcon;

class Forecast extends StatelessWidget {
  const Forecast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return cards.UniCard(
      content: Container(
        margin: EdgeInsets.only(
          top: 175,
        ),
        child: Container(
            margin: EdgeInsets.only(top: 100), child: ForecastWrapper()),
      ),
      title: "Forecast",
      style: styles.text,
    );
  }
}

class ForecastWrapper extends StatelessWidget {
  const ForecastWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    globals.deviceSize = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ForecastElement(addedTime: 3, forecastNumber: 0),
        ForecastElement(
          addedTime: 6,
          forecastNumber: 1,
        ),
        ForecastElement(
          addedTime: 9,
          forecastNumber: 2,
        ),
        ForecastElement(
          addedTime: 12,
          forecastNumber: 3,
        ),
        ForecastElement(
          addedTime: 15,
          forecastNumber: 4,
        ),
      ],
    );
  }
}

class ForecastElement extends StatelessWidget {
  ForecastElement(
      {Key? key, @required this.addedTime, @required this.forecastNumber})
      : super(key: key);

  final addedTime;
  var icon;
  var time = DateTime.now();
  final forecastNumber;

  void initState() {
    this.icon = getWeatherIcon(
        globals.forecast[this.forecastNumber].weatherIcon, Colors.black);
    Timer.periodic(new Duration(seconds: 5), (timer) {
      this.time = DateTime.now();
      if (this.icon != null) {
        this.icon = getWeatherIcon(
            globals.forecast[this.forecastNumber].weatherIcon, Colors.black);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    initState();
    return GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(1),
          width: globals.cardWidth / 5,
          height: globals.cardWidth / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              this.icon,
              Text(
                "+${this.addedTime} h",
                style: styles.smallText,
              ),
            ],
          ),
        ));
  }
}
