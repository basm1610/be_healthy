class RestaurantModel {
  bool? success;
  Data? data;

  RestaurantModel({this.success, this.data});

  RestaurantModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? name;
  String? description;
  String? image;
  late double rate;
  String? link;

  Data(
      {this.sId,
      this.name,
      this.description,
      this.image,
     required this.rate,
      this.link});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    rate = json['rate'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['rate'] = this.rate;
    data['link'] = this.link;
    return data;
  }
}