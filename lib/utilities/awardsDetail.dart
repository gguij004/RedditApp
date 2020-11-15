import 'package:flutter/material.dart';
import 'package:reddit_app/dataModel/redditHomeJson/allAwards.dart';

class Awards {
  BuildContext context;

  // final Data1 post;
  List<AllAwarding> awards;

  Awards(this.context, this.awards);

  dynamic _getAwardIcon(String url) {
    print(url);

    try {
      return Image.network(
        url.replaceAll(RegExp('amp;'), ''),
        height: 30,
        width: 30,
      );
    } catch (e) {
      print(e.toString());
      return Icon(Icons.print);
    }
  }

  showAwards() {
    showBottomSheet(
        context: context,
        builder: (context) => Container(
              child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.black87,
                    );
                  },
                  padding: const EdgeInsets.only(top: 20.0, left: 4, right: 4),
                  itemCount: awards.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(),
                      child: Row(children: <Widget>[
                        Text('  ' + awards[index].count.toString() + '     '),
                        _getAwardIcon(awards[index].iconUrl),
                        Text('   ' + awards[index].name),
                      ]),
                    );

                  }),
              color: Colors.white,
            ));
  }
}


