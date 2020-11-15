import 'package:reddit_app/dataModel/redditHomeJson/preview.dart';
import 'package:reddit_app/dataModel/redditHomeJson/allAwards.dart';

class Data1 {
  String title;
  String subreddit_name_prefixed;
  String postAuthor;
  Preview preview;
  int totalAwards;
  List<AllAwarding> awards;
  int comments;
  int score;

  Data1(
      {this.title,
      this.preview,
      this.postAuthor,
      this.subreddit_name_prefixed,
      this.awards,
      this.totalAwards,
      this.comments,
      this.score});

  Data1.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    totalAwards = json['total_awards_received'];
    subreddit_name_prefixed = json['subreddit_name_prefixed'];
    postAuthor = json['author'];
    preview = json['preview'] != null ? new Preview.fromJson(json['preview']) : null;
    comments = json['num_comments'];
    score = json['score'];

    if (json['all_awardings'] != null) {
      awards = new List<AllAwarding>();
      json['all_awardings'].forEach((v) {
        awards.add(new AllAwarding.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['author'] = this.postAuthor;
    data['subreddit_name_prefixed'] = this.subreddit_name_prefixed;
    data['total_awards_received'] = this.totalAwards;
    data['num_comments'] = this.comments;
    data['score'] = this.score;

    if (this.preview != null) {
      data['preview'] = this.preview.toJson();
    }

    if (this.awards != null) {
      data['all_awardings'] = this.awards.map((v) => v.toJson()).toList();
    }

    return data;
  }
}
