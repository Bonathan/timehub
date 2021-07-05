// @dart=2.10
import 'package:flutter/material.dart';
import 'package:timehub/globals.dart' as globals;
import 'package:ionicons/ionicons.dart';
import 'package:material_clock/material_clock.dart' as materialClock;

double cardWidth = 400;

//
//  Time
//

class Time extends StatelessWidget {
  const Time({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      decoration: BoxDecoration(
          borderRadius: globals.borderRadius,
          color: globals.lightBlack,
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
        theme: Brightness.dark,
        backgroundStyle: PaintingStyle.stroke,
        secondHandColor: globals.desaturatedRed,
        live: true,
        time: DateTime.now(),
      ),
    );
  }
}

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
        color: globals.lightBlack,
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
    return Column(
      children: [MondayFore()],
    );
  }
}

class MondayFore extends StatelessWidget {
  const MondayFore({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Container(
          width: cardWidth - 20,
          child: Column(
            children: [
              Text(globals.time.add(new Duration(hours: 3)).toString()),
              /*globals.plus3ForecastIcon*/
            ],
          ),
        ));
  }
}
