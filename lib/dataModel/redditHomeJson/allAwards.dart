import 'package:reddit_app/dataModel/redditHomeJson/ResizedIcons.dart';

class AllAwarding {
  String iconUrl;
  String name;
  int count;
  List<ResizedIcons> resizedIcons;

  AllAwarding({this.iconUrl, this.resizedIcons, this.count, this.name});

  AllAwarding.fromJson(Map<String, dynamic> json) {
    iconUrl = json['icon_url'];
    name = json['name'];
    count = json['count'];
    if (json['resized_icons'] != null) {
      resizedIcons = new List<ResizedIcons>();
      json['resized_icons'].forEach((v) {
        resizedIcons.add(new ResizedIcons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['name'] = this.name;
    data['icon_url'] = this.iconUrl;
    if (this.resizedIcons != null) {
      data['resized_icons'] = this.resizedIcons.map((v) => v.toJson()).toList();
    }

    return data;
  }
}
