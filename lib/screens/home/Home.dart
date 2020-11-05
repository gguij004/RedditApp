import 'dart:async';
import 'package:flutter/material.dart';
import 'package:reddit_app/dataModel/redditHomeJson/data.dart';
import 'package:reddit_app/dataModel/redditHomeJson/data1.dart';
import 'package:reddit_app/dataModel/redditHomeJson/reddit.dart';
import 'package:reddit_app/screens/home/postTileView.dart';
import 'package:reddit_app/services/redditHomeRequest.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

String subRedditUrl;

class _MyHomePageState extends State<MyHomePage> {
  Future<Reddit> futureReddit;

  @override
  void initState() {
    super.initState();
    RedditHomeRequest home = RedditHomeRequest();
    futureReddit = home.fetchReddit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<Reddit>(
          future: futureReddit,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data.data.redditPosts);
              Data homePage = snapshot.data.data;
              return Scaffold(
                  body: Column(children: <Widget>[
                Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: homePage.redditPosts.length,
                      itemBuilder: (BuildContext context, int index) {
                        Data1 post = homePage.redditPosts[index].data;
                       // print(post.subreddit_name_prefixed);
                        return PostTileView(post, post.subreddit_name_prefixed);  //post tile
                      }),
                ),
                RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/detail');
                    },
                    child: Text('One sub reddit'))
              ]));
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            print('este: $subRedditUrl');
            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
