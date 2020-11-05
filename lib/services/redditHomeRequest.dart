import 'package:reddit_app/dataModel/redditHomeJson/reddit.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class RedditHomeRequest{

Future<Reddit> fetchReddit() async {
  final response = await http.get('https://www.reddit.com/.json');

  if (response.statusCode == 200) {
    // print('${response.body}');
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Reddit.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Reddit Home Page');
  }
}

}