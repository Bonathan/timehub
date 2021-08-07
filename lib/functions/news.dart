import 'package:http/http.dart' as http;
import 'package:webfeed/domain/rss_feed.dart';
import 'package:flutter/material.dart';
import 'package:timehub/globals/styles.dart' as styles;
import 'package:timehub/globals.dart' as globals;

class Feed1 {
  final _targetUrl = Uri.parse('https://www.srf.ch/news/bnf/rss/1890');

  Future<RssFeed> getFeed() =>
      http.read(_targetUrl).then((xmlString) => RssFeed.parse(xmlString));
}

final targetUrl = Uri.parse('https://www.becompany.ch/en/blog/feed.xml');

void getFeedRss() async {
  final RssFeed feed = await Feed1().getFeed();
  globals.feed = feed;
}

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getFeedRss();
    return ListView.builder(
        itemCount: 15,
        itemBuilder: (BuildContext ctxt, int index) {
          final item = globals.feed.items![index];
          return ListTile(
            contentPadding: EdgeInsets.fromLTRB(35, 3, 45, 3),
            title: Text(item.title.toString(), style: styles.smallText),
          );
        });
  }
}
