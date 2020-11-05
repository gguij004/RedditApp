import 'package:reddit_app/dataModel/redditHomeJson/preview.dart';
import 'package:reddit_app/dataModel/redditHomeJson/allAwards.dart';

class Data1 {
  String title;
  String subreddit_name_prefixed;
  String postAuthor;
  Preview preview;
  List<AllAwarding> awards;

  Data1({this.title, this.preview, this.postAuthor, this.subreddit_name_prefixed, this.awards});

  Data1.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subreddit_name_prefixed = json['subreddit_name_prefixed'];
    postAuthor = json['author'];
    preview = json['preview'] != null ? new Preview.fromJson(json['preview']) : null;

    if (json['all_awardings'] != null) {
      awards = new List<AllAwarding>();
      json['children'].forEach((v) {
        awards.add(new AllAwarding.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['author'] = this.postAuthor;
    data['subreddit_name_prefixed'] = this.subreddit_name_prefixed;

    if (this.preview != null) {
      data['preview'] = this.preview.toJson();
    }

    if (this.awards != null) {
      data['children'] = this.awards.map((v) => v.toJson()).toList();
    }

    return data;
  }
}
