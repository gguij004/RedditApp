


class AllAwarding {
  AllAwarding({
    this.iconUrl,
  });

  String iconUrl;

  factory AllAwarding.fromJson(Map<String, dynamic> json) => AllAwarding(
    iconUrl: json["icon_url"],
  );

  Map<String, dynamic> toJson() => {
    "icon_url": iconUrl,
  };
}
