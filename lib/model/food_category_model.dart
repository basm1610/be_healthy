class FoodCategoryModel {
  List<Data>? data;

  FoodCategoryModel({this.data});

  FoodCategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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

  Data({this.sId, this.name, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}



// class FoodCategoryModel {
//   String? sId;
//   String? name;
//   String? image;

//   FoodCategoryModel({this.sId, this.name, this.image});

//   FoodCategoryModel.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     name = json['name'];
//     image = json['image'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['name'] = this.name;
//     data['image'] = this.image;
//     return data;
//   }
// }
