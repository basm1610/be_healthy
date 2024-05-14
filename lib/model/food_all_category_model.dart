class FoodAllCategoryModel {
  int? results;
  PaginationResult? paginationResult;
  List<Data>? data;

  FoodAllCategoryModel({this.results, this.paginationResult, this.data});

  FoodAllCategoryModel.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    paginationResult = json['paginationResult'] != null
        ? PaginationResult.fromJson(json['paginationResult'])
        : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = results;
    if (paginationResult != null) {
      data['paginationResult'] = paginationResult!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PaginationResult {
  int? currentPage;
  int? limit;
  int? numberOfPages;
  int? next;

  PaginationResult(
      {this.currentPage, this.limit, this.numberOfPages, this.next});

  PaginationResult.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    limit = json['limit'];
    numberOfPages = json['numberOfPages'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['limit'] = limit;
    data['numberOfPages'] = numberOfPages;
    data['next'] = next;
    return data;
  }
}

class Data {
  String? sId;
  String? name;
  String? categoryId;
  String? calorie;

  Data({this.sId, this.name, this.categoryId, this.calorie});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    categoryId = json['categoryId'];
    calorie = json['calorie'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['categoryId'] = categoryId;
    data['calorie'] = calorie;
    return data;
  }
}