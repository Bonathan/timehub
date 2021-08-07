// @dart=2.10
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:timehub/functions.dart';
import 'package:timehub/globals.dart' as globals;
import 'package:timehub/globals/styles.dart' as styles;
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
          color: styles.cardBack,
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
        secondHandColor: styles.desaturatedRed,
        live: true,
        
      ),
    );
  }
}
*/

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
        color: styles.cardBack,
        boxShadow: globals.boxShadow,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: 25, right: 290),
            child: Text(this.title, style: styles.text),
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
                borderRadius: BorderRadius.circular(5), color: styles.darkGrey),
            height: 5,
            width: 150,
          )
        ],
      ),
    );
  }
}
