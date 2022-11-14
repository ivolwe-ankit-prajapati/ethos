class CategoriesModel {
  bool? status;
  List<CategoriesResponse>? response;

  CategoriesModel({this.status, this.response});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['response'] != null) {
      response = <CategoriesResponse>[];
      json['response'].forEach((v) {
        response!.add(new CategoriesResponse.fromJson(v));
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

class CategoriesResponse {
  String? sId;
  String? parentId;
  Name? name;
  String? description;
  String? image;
  List<Children>? children;

  CategoriesResponse(
      {this.sId,
        this.parentId,
        this.name,
        this.description,
        this.image,
        this.children});

  CategoriesResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    parentId = json['parentId'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    description = json['description'];
    image = json['image'];
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(new Children.fromJson(v));
      });
    }
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
    if (this.children != null) {
      data['children'] = this.children!.map((v) => v.toJson()).toList();
    }
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

class Children {
  String? sId;
  String? parentId;
  Name? name;
  String? description;
  String? image;

  Children({this.sId, this.parentId, this.name, this.description, this.image});

  Children.fromJson(Map<String, dynamic> json) {
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
