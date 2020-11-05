import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

class Source {
  String url;
  int height;
  int width;

  Source({this.url, this.height, this.width});


  Source.fromJson(Map<String, dynamic> json) {

    height = json['height'];
    width = json['width'];
    url = json['url'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['url'] = this.url;
    data['height'] = this.height;
    data['width'] = this.width;


    return data;
  }
}
