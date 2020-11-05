import 'package:reddit_app/dataModel/subRedditJson/data.dart';

class SubReddit {
  Data data;

  SubReddit({this.data});

  SubReddit.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}
