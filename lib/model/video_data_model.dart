class VideoDataModel {
  Data? data;

  VideoDataModel({this.data});

  VideoDataModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
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

  Data(
      {this.sId,
      this.name,
      this.image,
      this.description,
       this.link,
      this.category,
      this.level});

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['description'] = this.description;
    data['link'] = this.link;
    data['category'] = this.category;
    data['level'] = this.level;
    return data;
  }
}