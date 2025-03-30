import 'package:flutter/cupertino.dart';
import 'package:yet_another_json_isolate/yet_another_json_isolate.dart';
import 'dart:convert';


enum PlaceType {
  city,
  metro_station,
  tram_station,
  train_station,
  point_of_interest,
}

class Place {
  final PlaceType type;
  final String city;
  final String region;
  final String? name;
  final bool? hasTgv;
  final List<Line>? linesList;

  Place({
    required this.type,
    required this.city,
    required this.region,
    this.name,
    this.hasTgv,
    this.linesList,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      type: PlaceType.values.firstWhere((e) => e.toString().split('.').last == json['type']),
      city: json['city'],
      region: json['region'],
      name: json['name'],
      hasTgv: json['has_tgv'],
      linesList: json['lines_list'] != null
          ? (json['lines_list'] as List).map((i) => Line.fromJson(i)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type.toString().split('.').last,
      'city': city,
      'region': region,
      'name': name,
      'has_tgv': hasTgv,
      'lines_list': linesList?.map((i) => i.toJson()).toList(),
    };
  }

  static Future<List<Place>> readJsonData(BuildContext context, String path) async {
    final jsonString = await DefaultAssetBundle.of(context).loadString(path);
    final isolate = YAJsonIsolate()..initialize();
    final List<dynamic> json = await isolate.decode(jsonString);
    isolate.dispose();
    return (json).map((item) => Place.fromJson(item)).toList();
  }
}

class Line {
  final String name;
  final String color;

  Line({
    required this.name,
    required this.color,
  });

  factory Line.fromJson(Map<String, dynamic> json) {
    return Line(
      name: json['name'],
      color: json['color'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'color': color,
    };
  }
}