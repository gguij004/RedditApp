

class AllAwarding {

  String iconUrl;

  AllAwarding({this.iconUrl});

  AllAwarding.fromJson(Map<String, dynamic> json) {

    iconUrl = json['icon_url'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['icon_url'] = this.iconUrl;

    return data;
  }
}



