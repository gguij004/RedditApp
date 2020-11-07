
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:reddit_app/screens/home/Home.dart';
import 'package:reddit_app/screens/postDetail.dart';


void main() => runApp(MyApp());

// gery
//gery 2
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
        home: MyHomePage(title: 'Reddit Home Page'),

        routes:  <String, WidgetBuilder> {
          //'/home': (BuildContext context) => Home(),
          '/detail': (BuildContext context) => Detail(),
          //'/order': (BuildContext context) => Order()
        },
        //home: Home()
        //Detail: PostDetail()
       // home: Home()
    );
  }

}













