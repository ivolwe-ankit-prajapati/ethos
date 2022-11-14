class CategoryModel {
  bool? status;
  List<CategoryResponse>? response;

  CategoryModel({this.status, this.response});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['response'] != null) {
      response = <CategoryResponse>[];
      json['response'].forEach((v) {
        response!.add(new CategoryResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.response != null) {
      data['response'] = this.response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryResponse {
  String? sId;
  String? parentId;
  Name? name;
  String? description;
  String? image;

  CategoryResponse({this.sId, this.parentId, this.name, this.description, this.image});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    parentId = json['parentId'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['parentId'] = this.parentId;
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    data['description'] = this.description;
    data['image'] = this.image;
    return data;
  }
}

class Name {
  String? en;
  String? de;
  String? fr;

  Name({this.en, this.de, this.fr});

  Name.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    de = json['de'];
    fr = json['fr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this.en;
    data['de'] = this.de;
    data['fr'] = this.fr;
    return data;
  }
}
