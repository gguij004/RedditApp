
import 'package:reddit_app/dataModel/redditHomeJson/source.dart';

class Images {
  Source source;

  Images({this.source});

  Images.fromJson(Map<String, dynamic> json) {
    source =
    json['source'] != null ? new Source.fromJson(json['source']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.source != null) {
      data['source'] = this.source.toJson();
    }
    return data;
  }
}