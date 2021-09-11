// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:timehub/globals/styles.dart' as styles;
import 'package:timehub/globals/device.dart';
import 'package:timehub/globals.dart' as globals;
import 'package:timehub/frontend/todo.dart' as todocard;
import 'package:timehub/frontend/news.dart' as newscard;

class MainWrapper extends StatelessWidget {
  const MainWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StandardViewhub',
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            padding: EdgeInsets.fromLTRB(50, 25, 50, 25), child: Wrapper()),
      ),
    );
  }
}

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [StandardView(), CardManager()],
    );
  }
}

//////////////////////////////////////////////////////
//                                                  //
// Standard, always visible information             //
//                                                  //
//////////////////////////////////////////////////////

class StandardView extends StatelessWidget {
  StandardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return Container(
        child: Column(
      children: [
        Time(),
      ],
    ));
  }
}

class Time extends StatelessWidget {
  Time({Key? key}) : super(key: key);

  var time = DateTime.now();
  final DateFormat formatter = DateFormat('d MMMM');
  final DateFormat formatterTime = DateFormat('HH:mm');

  void initState() {
    Timer.periodic(new Duration(seconds: 1), (timer) {
      time = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          formatterTime.format(time) + ' | ' + formatter.format(time),
          style: styles.text,
        ),
        Text(globals.currentWeatherTemp.celsius.round().toString() + '°',
            style: styles.head),
        Text(globals.currentWeather.toString(), style: styles.text)
      ],
    ));
  }
}

class CardManager extends StatelessWidget {
  CardManager({Key? key}) : super(key: key);

  final pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: deviceSize.width / 2 - deviceSize.width / 9,
      child: PageView(
        controller: pageController,
        children: [
          newscard.RssReader(),
          todocard.ToDoLogin(),
        ],
      ),
    );
  }
}
