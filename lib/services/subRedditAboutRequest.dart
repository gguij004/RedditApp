import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_test_utils/image_test_utils.dart';

//data models
import 'package:reddit_app/dataModel/subRedditJson/subReddit.dart';


class SubRedditAboutRequest
{

Future<SubReddit> fetchSubReddit(String subReddit) async {

 // String subReddit;
 // print(('https://www.reddit.com/' + subReddit + '/about.json').replaceAll(new RegExp('amp;'), ''));
  //print('inside fetch subre' + subReddit);
  final response = await http.get('https://www.reddit.com/' + subReddit + '/about.json');

 // print('te Lo dije'+ 'https://www.reddit.com/' + subReddit +  '/about.json');

  if (response.statusCode == 200) {
    // print('${response.body}');
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return SubReddit.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load subReddit');
  }
}

}