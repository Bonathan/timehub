import 'package:flutter/material.dart';
import 'package:timehub/functions/news.dart';
import 'package:timehub/cards/cards.dart' as cards;

class RssReader extends StatelessWidget {
  const RssReader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getFeedRss();
    return cards.UniCard(content: Feed(), title: "News");
  }
}