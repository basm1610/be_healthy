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

//////////////////////////////////////////////////

// class FoodCategoryModel {
//   String? status;
//   int? results;
//   List<DataTranslated>? dataTranslated;

//   FoodCategoryModel({this.status, this.results, this.dataTranslated});

//   FoodCategoryModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     results = json['results'];
//     if (json['dataTranslated'] != null) {
//       dataTranslated = <DataTranslated>[];
//       json['dataTranslated'].forEach((v) {
//         dataTranslated!.add(new DataTranslated.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['results'] = this.results;
//     if (this.dataTranslated != null) {
//       data['dataTranslated'] =
//           this.dataTranslated!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class DataTranslated {
//   String? name;
//   String? image;
//   String? sId;

//   DataTranslated({this.name, this.image, this.sId});

//   DataTranslated.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     image = json['image'];
//     sId = json['_id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['image'] = this.image;
//     data['_id'] = this.sId;
//     return data;
//   }
// }



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
