
class Data {
  String iconImg;
  String communityIcon;

  Data({this.iconImg});

  Data.fromJson(Map<String, dynamic> json) {
    iconImg = json['icon_img'];
    communityIcon = json['community_icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon_img'] = this.iconImg;
    data['community_icon'] = this.communityIcon;
    return data;
  }
}