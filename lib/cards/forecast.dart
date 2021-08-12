import 'package:flutter/material.dart';
import 'package:timehub/functions.dart';
import 'package:timehub/globals.dart' as globals;
import 'package:timehub/cards/cards.dart' as cards;
import 'package:timehub/functions/time.dart' as times;
import 'package:timehub/globals/styles.dart' as styles;
import 'dart:async';
import 'package:ionicons/ionicons.dart';

class Forecast extends StatelessWidget {
  const Forecast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return cards.UniCard(
        content: Container(
          margin: EdgeInsets.only(
            top: 175,
          ),
          child: ForecastWrapper(),
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
    Key? key,
    @required this.addedTime,
    @required this.icon,
    @required this.forecastNumber,
  }) : super(key: key);

  final addedTime;
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
              color: styles.trueBlack,
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
                  style: styles.text),
              Text(
                "+${widget.addedTime} hours",
                style: styles.smallText,
              ),
            ],
          ),
        ));
  }
}
