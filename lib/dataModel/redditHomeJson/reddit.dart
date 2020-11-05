import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:reddit_app/dataModel/redditHomeJson/data.dart';

class Reddit {
  String kind;
  String name;
  String email;
  Data data;

  Reddit({this.kind, this.name, this.email, this.data});

  Reddit.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    name = json['name'];
    email = json['email'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kind'] = this.kind;
    data['name'] = this.name;
    data['email'] = this.email;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}
