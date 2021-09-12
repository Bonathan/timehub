import 'package:flutter/material.dart';
import 'package:timehub/globals.dart' as globals;
import 'package:timehub/globals/device.dart';
import 'package:timehub/globals/styles.dart' as styles;
import 'package:intl/intl.dart';

final DateFormat formatterTime = DateFormat('HH:mm');

//one reusable card, so that the code is simpler
//needs content, title and title textstyle
//background color defaults to white, overrideable

class UniCard extends StatelessWidget {
  const UniCard({
    Key? key,
    this.content,
    required this.title,
    this.color = Colors.white,
    required this.style,
    this.swipeColor = styles.darkGrey,
  }) : super(key: key);

  final content;
  final String title;
  final Color color;
  final TextStyle style;
  final swipeColor;

  @override
  Widget build(BuildContext context) {
    //the container is the card

    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: globals.borderRadius,
        color: this.color,
        boxShadow: styles.boxShadow,
      ),
      child: Column(
        //Column has the title, content and swipe indicator

        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //title

          Container(
            child: Text(this.title, style: this.style),
          ),

          //content

          Container(
            height: deviceSize.height / 1.6,
            child: this.content,
            margin: EdgeInsets.only(right: 5),
          ),

          //swipe indicator

          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
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
