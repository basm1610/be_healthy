import 'dart:developer';

class FavouriteModel {
  String? status;
  int? results;
  List<Data>? data;

  FavouriteModel({this.status, this.results, this.data});

  FavouriteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    results = json['results'];
    if (json['data'] != null && json['data'] is List) {
      data = <Data>[];
      json['data'].forEach((v) {
        if (v !is Map<String, dynamic>) {
          data!.add(Data.fromJson(v));
        } else {
          log('Invalid data entry: $v');
        }
      });
    } else {
      log('Invalid data format: ${json['data']}');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['results'] = results;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? name;
  String? image;
  String? description;
  String? link;
  String? category;
  String? level;

  Data({
    this.sId,
    this.name,
    this.image,
    this.description,
    this.link,
    this.category,
    this.level,
  });

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    link = json['link'];
    category = json['category'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['image'] = image;
    data['description'] = description;
    data['link'] = link;
    data['category'] = category;
    data['level'] = level;
    return data;
  }
}
