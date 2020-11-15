
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:reddit_app/utilities/awardsDetail.dart';
import 'package:reddit_app/screens/home/Home.dart';
import 'package:reddit_app/screens/postDetail.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        title: 'Navigation',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          //backgroundColor: Colors.black12,
                canvasColor: Colors.black12
        ),
        home: MyHomePage(title: 'Reddit Demod Home Page'),

        routes:  <String, WidgetBuilder> {
          //'/home': (BuildContext context) => Home(),
          '/detail': (BuildContext context) => Detail()
        },

    );
  }

}













