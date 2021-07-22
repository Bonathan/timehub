import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';

class feed1 {
  final targetURL = 'https://www.becompany.ch/en/blog/feed.xml' as Uri;

  Future<AtomFeed> getFeed() =>
      http.read(targetURL).then((xmlString) => AtomFeed.parse(xmlString));
}

void main(){

  test('Test the RSS: ', () {
    final service = feed1();

    service.getFeed().then((feed) {
      expect(feed.title, 'BeCompany Blog');
      expect(feed.rights, 'BeCompany GmbH');
    });
  });
}