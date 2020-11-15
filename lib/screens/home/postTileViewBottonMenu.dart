import 'package:reddit_app/dataModel/redditHomeJson/data1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class BottomMenu extends StatelessWidget {
  final Data1 post;

  BottomMenu(this.post);

  _getFirst() {
    return Row(children: <Widget>[
      Icon(Icons.keyboard_arrow_up),
      Text(post.score.toString()),
      Icon(Icons.keyboard_arrow_down),
    ]);
  }

  _getMid() {
    return Expanded(
      child: Row(
        children: <Widget>[
          Icon(Icons.add_comment),
          Text(' ' + post.comments.toString()),
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }

  _share(BuildContext context) async {
    String text = 'https://www.reddit.com';
    String subject = 'Reddit Home';

    final RenderBox box = context.findRenderObject();

    try {
      await Share.share(text, subject: subject, sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    } catch (e) {
      print(e);
    }
  }

  _getLast(BuildContext context) {
    return Row(children: <Widget>[
      IconButton(
        icon: Icon(Icons.share),
        onPressed: () {
          _share(context);
        },
      ),
      Padding(padding: EdgeInsets.only(right: 4.0), child: Text('share')),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _getFirst(),
        _getMid(),
        _getLast(context),
      ],
    );
  }
}
