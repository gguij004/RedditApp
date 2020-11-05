import 'package:reddit_app/dataModel/redditHomeJson/data1.dart';

class RedditPost {
  String kind;
  Data1 data;

  RedditPost({this.kind, this.data});

  RedditPost.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    data = json['data'] != null ? new Data1.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kind'] = this.kind;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}