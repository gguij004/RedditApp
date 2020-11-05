//import 'package:share/share.dart';
import 'package:flutter/material.dart';
import 'package:reddit_app/dataModel/redditHomeJson/data1.dart';
import 'package:reddit_app/dataModel/subRedditJson/data.dart';
import 'package:reddit_app/dataModel/subRedditJson/subReddit.dart';
import 'package:reddit_app/services/subRedditAboutRequest.dart';
import 'package:share/share.dart';

class PostTileView extends StatelessWidget {
  final Data1 post;
  final String subReddit;
  String text = 'https://www.reddit.com/';
  String subject = 'follow me';

  PostTileView(this.post, this.subReddit);

  onTapSubreddit() {
    print('No tabia llegua');
  }

  onTapAuthor() {
    print('No tabia Creida');
  }

  dynamic _getImage(String url) {
    print(url);

    try {

      return Image.network(url.replaceAll(new RegExp('amp;'), '')
          //height: 108.0,
          //width: 144.0,
          );
    } catch (e) {
      print(e.toString());
      print('error with image');
      return Icon(Icons.print);
    }
  }

  // sub reddit icon
   Widget _getSubRedditIcon(String url) {
    print('isnide get subIcon' + url);

    try {

      return Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(url.replaceAll(new RegExp('amp;'), ''),),
              fit: BoxFit.fill
          ),
        ),
      );
    } catch (e) {
      print(e.toString());
      print('error with image');
      return Icon(Icons.print);
    }
  }
  //url.replaceAll(new RegExp('amp;'), ''),
  FutureBuilder<SubReddit> displaySubRedditIcon() {
    print('andtes del if: ' + subReddit);
    return FutureBuilder<SubReddit>(
      future: SubRedditAboutRequest().fetchSubReddit(subReddit),
      builder: (context, subRedditResponse) {
        if (subRedditResponse.hasData) {
          Data subRedditData = subRedditResponse.data.data;
          if (subRedditData.iconImg == '' || subRedditData.iconImg == null) {
            print('Icon is empty or null');

            if (subRedditData.communityIcon != '' &&
                subRedditData.communityIcon != null) {
              print('Community Icon is not empty or null');
              print(subRedditData.communityIcon);
              return _getSubRedditIcon(subRedditData.communityIcon);
            }
            print('Community is empty or null');
            return _getSubRedditIcon(
                'https://b.thumbs.redditmedia.com/EndDxMGB-FTZ2MGtjepQ06cQEkZw_YQAsOUudpb9nSQ.png');
          } else {
            return _getSubRedditIcon(subRedditData.iconImg);
          }

          //return _getSubRedditIcon(snapshot2.subRedditData.subRedditData.iconImg);
        } else {
          //loading
          return _getSubRedditIcon(
              'https://b.thumbs.redditmedia.com/EndDxMGB-FTZ2MGtjepQ06cQEkZw_YQAsOUudpb9nSQ.png');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(children: <Widget>[
      ListTile(
        leading: GestureDetector(
          child: displaySubRedditIcon(),
          onTap: () {
            onTapSubreddit();
          },
        ),
        title: GestureDetector(
          child: Text(post.subreddit_name_prefixed),
          onTap: () {
            onTapSubreddit();
          },
        ),
        subtitle: GestureDetector(
            child: Text('Posted by ${post.postAuthor}'),
            onTap: () {
              onTapAuthor();
            }),
      ),

      GestureDetector(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 8.0, top: 0.0, right: 8.0, bottom: 4.0),
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
      post.preview != null
          ? _getImage(post.preview.images.first.source.url)
          : SizedBox.shrink(),

      Padding(
        child: BottomMenu(),
        padding:
            const EdgeInsets.only(left: 0.0, top: 6.0, right: 4.0, bottom: 4.0),
      ),
    ]));
  }
}

class BottomMenu extends StatelessWidget {
  _getFirst() {
    return Row(children: <Widget>[
      Icon(Icons.keyboard_arrow_up),
      Text('amout'),
      Icon(Icons.keyboard_arrow_down),
    ]);
  }

  _getMid() {
    return Expanded(
      child: Row(
        children: <Widget>[
          Icon(Icons.add_comment),
          Text("amount"),
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }

  _share(BuildContext context) async {

    String text = 'https://www.reddit.com';
    String subject = 'follow me';
    
    final RenderBox box = context.findRenderObject();

   try {
     await Share.share(text,
         subject: subject,
         sharePositionOrigin:
         box.localToGlobal(Offset.zero) &
         box.size);
   }catch(e){
        print(e);

      }


  }

  _getLast(BuildContext context) {
    return Row(children: <Widget>[

      IconButton(icon: Icon(Icons.share), onPressed: (){_share(context);},),
      Text('share'),
     // Icon(Icons.card_giftcard),
    ]);
  }

  @override
  Widget build(BuildContext context) {
   
    return Row(
      children: <Widget>[_getFirst(), _getMid(), _getLast(context),



      ],

    );
  }
}
