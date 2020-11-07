import 'package:reddit_app/dataModel/redditHomeJson/children.dart';

class Data {
  String modhash;
  int dist;
  List<RedditPost> redditPosts;

  Data({this.modhash, this.dist, this.redditPosts});

  Data.fromJson(Map<String, dynamic> json) {
    modhash = json['modhash'];
    dist = json['dist'];

    if (json['children'] != null) {
      redditPosts = new List<RedditPost>();
      json['children'].forEach((v) {
        redditPosts.add(new RedditPost.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['modhash'] = this.modhash;
    data['dist'] = this.dist;
    if (this.redditPosts != null) {
      data['children'] = this.redditPosts.map((v) => v.toJson()).toList();
    }
    return data;
  }
}