
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddit_app/dataModel/redditHomeJson/data1.dart';
import 'package:reddit_app/dataModel/subRedditJson/data.dart';
import 'package:reddit_app/dataModel/subRedditJson/subReddit.dart';
import 'package:reddit_app/screens/home/postTileViewBottonMenu.dart';
import 'package:reddit_app/services/subRedditAboutRequest.dart';
import 'package:reddit_app/utilities/awardsDetail.dart';

class PostTileView extends StatelessWidget {
  final Data1 post;
  final String subReddit;
  final String text = 'https://www.reddit.com/';
  final String subject = 'follow me';

  PostTileView(this.post, this.subReddit);

  awardsDetails(BuildContext context) {
    Awards postAwards = Awards(context, post.awards);

    postAwards.showAwards();
  }

  onTapSubreddit() {
    print('No tabia llegua');
  }

  onTapAuthor() {
    print('No tabia Creida');
  }

  dynamic _getImage(String url) {
    print(url);

    try {
      return Image.network(url.replaceAll(RegExp('amp;'), ''));
    } catch (e) {
      print(e.toString());
      return Icon(Icons.print);
    }
  }

  dynamic _getAwardIcon(String url) {
    print(url);

    try {
      return Image.network(
        url.replaceAll(RegExp('amp;'), ''),
        height: 16,
        width: 16,
      );
    } catch (e) {
      print(e.toString());
      return Icon(Icons.print);
    }
  }

  // sub reddit icon
  Widget _getSubRedditIcon(String url) {
    try {
      return Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(
                url.replaceAll(RegExp('amp;'), ''),
              ),
              fit: BoxFit.fill),
        ),
      );
    } catch (e) {
      print(e.toString());
      return Icon(Icons.print);
    }
  }

  FutureBuilder<SubReddit> displaySubRedditIcon() {
    return FutureBuilder<SubReddit>(
      future: SubRedditAboutRequest().fetchSubReddit(subReddit),
      builder: (context, subRedditResponse) {
        if (subRedditResponse.hasData) {
          Data subRedditData = subRedditResponse.data.data;
          if (subRedditData.iconImg == '' || subRedditData.iconImg == null) {
            // print('Icon is empty or null');

            if (subRedditData.communityIcon != '' && subRedditData.communityIcon != null) {
              //print('Community Icon is not empty or null');
              //print(subRedditData.communityIcon);
              return _getSubRedditIcon(subRedditData.communityIcon);
            }
            // print('Community is empty or null');
            return _getSubRedditIcon(
                'https://b.thumbs.redditmedia.com/EndDxMGB-FTZ2MGtjepQ06cQEkZw_YQAsOUudpb9nSQ.png');
          } else {
            return _getSubRedditIcon(subRedditData.iconImg);
          }
        } else {
          //loading
          return _getSubRedditIcon('https://b.thumbs.redditmedia.com/EndDxMGB-FTZ2MGtjepQ06cQEkZw_YQAsOUudpb9nSQ.png');
        }
      },
    );
  }

  _displayAwards( post, BuildContext context) {
    if (post.awards.length > 5) {
      return Padding(
        padding: EdgeInsets.only(left: 8.0, bottom: 10.0),
        child: Row(children: <Widget>[
          Row(
              children: List.generate(5, (index) {
            return Padding(
                child: _getAwardIcon(post.awards[index].resizedIcons[0].url), padding: EdgeInsets.only(right: 4.0));
          })),
          GestureDetector(
            child: Text(
              post.totalAwards.toString() + ' Awards',
              style: TextStyle(fontSize: 12),
            ),
            onTap: () {
              awardsDetails(context);
            },
          )
        ]),
      );
    } else {
      return Padding(
        padding: EdgeInsets.only(left: 8.0, bottom: 12.0),
        child: Row(children: <Widget>[
          Row(
              children: List.generate(post.awards.length, (index) {
            return Padding(
                child: _getAwardIcon(post.awards[index].resizedIcons[0].url), padding: EdgeInsets.only(right: 4.0));
          })),
          GestureDetector(
            child: Text(
              post.totalAwards.toString() + ' Awards',
              style: TextStyle(fontSize: 12),
            ),
            onTap: () {
              awardsDetails(context);
            },
          )
        ]),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(children: <Widget>[
      ListTile(
        //contentPadding: EdgeInsets.only(bottom: -1.0),
        leading: GestureDetector(
          child: displaySubRedditIcon(),
          onTap: () {
            onTapSubreddit();
          },
        ),
        title: GestureDetector(
          child: Text(
            post.subreddit_name_prefixed,
            style: TextStyle(fontSize: 14.0),
          ),
          onTap: () {
            onTapSubreddit();
          },
        ),
        subtitle: GestureDetector(
            child: Text(
              'Posted by ${post.postAuthor}',
              style: TextStyle(fontSize: 12.0),
            ),
            onTap: () {
              onTapAuthor();
            }),
      ),

      _displayAwards(post, context),

      GestureDetector(
        child: Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 4.0),
          child: Text(
            post.title,
            style: TextStyle(fontSize: 14.0),
          ),
        ),
        onTap: () {
          onTapSubreddit();
        },
      ),
      // check if post have image skip if not image found
      post.preview != null ? _getImage(post.preview.images.first.source.url) : SizedBox.shrink(),

      Padding(
        child: BottomMenu(post),
        padding: const EdgeInsets.only(left: 0.0, right: 0.0, bottom: 4.0),
      ),
    ]));
  }
}
