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
            margin: EdgeInsets.only(top: 25),
            child: Text(this.title, style: styles.text),
            height: 75,
          ),
          Container(
            height: 450,
            child: this.content,
            margin: EdgeInsets.only(right: 5),
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
