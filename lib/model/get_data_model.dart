class GetDataModel {
  Data? data;

  GetDataModel({this.data});

  GetDataModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? gender;
  int? weight;
  int? height;
  int? age;
  String? activity;
  int? caloriesNeeded;
  int? caloriesAdded;
  int? stepsNumber;
  int? waterNeeded;
  int? waterQuantity;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.gender,
      this.weight,
      this.height,
      this.age,
      this.activity,
      this.caloriesNeeded,
      this.caloriesAdded,
      this.stepsNumber,
      this.waterNeeded,
      this.waterQuantity,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    weight = json['weight'];
    height = json['height'];
    age = json['age'];
    activity = json['activity'];
    caloriesNeeded = json['caloriesNeeded'];
    caloriesAdded = json['caloriesAdded'];
    stepsNumber = json['stepsNumber'];
    waterNeeded = json['waterNeeded'];
    waterQuantity = json['waterQuantity'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gender'] = gender;
    data['weight'] = weight;
    data['height'] = height;
    data['age'] = age;
    data['activity'] = activity;
    data['caloriesNeeded'] = caloriesNeeded;
    data['caloriesAdded'] = caloriesAdded;
    data['stepsNumber'] = stepsNumber;
    data['waterNeeded'] = waterNeeded;
    data['waterQuantity'] = waterQuantity;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
