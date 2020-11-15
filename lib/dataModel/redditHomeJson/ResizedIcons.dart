class ResizedIcons {
  String url;

  ResizedIcons({this.url});

  ResizedIcons.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}