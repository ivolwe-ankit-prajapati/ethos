


class WishListModel {
  bool? status;
  List<WishListResponse>? response;
  int? totalCount;

  WishListModel({this.status, this.response, this.totalCount});

  WishListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['response'] != null) {
      response = <WishListResponse>[];
      json['response'].forEach((v) {
        response!.add(new WishListResponse.fromJson(v));
      });
    }
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.response != null) {
      data['response'] = this.response!.map((v) => v.toJson()).toList();
    }
    data['totalCount'] = this.totalCount;
    return data;
  }
}

class WishListResponse {
  Id? iId;
  String? pid;
  En? en;
  De? de;
  String? fr;
  int? status;
  int? approved;
  String? productName;
  String? company;
  int? deleted;
  int? productType;
  String? bannerImage;
  String? slug;
  String? purchasePrice;
  String? salePrice;
  String? esin;
  bool? isWishListed;
  String? quantity;

  WishListResponse(
      {this.iId,
        this.pid,
        this.en,
        this.de,
        this.fr,
        this.status,
        this.approved,
        this.productName,
        this.company,
        this.deleted,
        this.productType,
        this.bannerImage,
        this.slug,
        this.purchasePrice,
        this.salePrice,
        this.esin,
        this.isWishListed,
        this.quantity});

  WishListResponse.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? new Id.fromJson(json['_id']) : null;
    pid = json['pid'];
    en = json['en'] != null ? new En.fromJson(json['en']) : null;
    de = json['de'] != null ? new De.fromJson(json['de']) : null;
    fr = json['fr'].toString();
    status = json['status'];
    approved = json['approved'];
    productName = json['productName'];
    company = json['company'];
    deleted = json['deleted'];
    productType = json['productType'];
    bannerImage = json['bannerImage'];
    slug = json['slug'];
    purchasePrice = json['purchasePrice'].toString();
    salePrice = json['salePrice'].toString();
    esin = json['esin'];
    isWishListed = json['isWishListed'];
    quantity = json['quantity'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iId != null) {
      data['_id'] = this.iId!.toJson();
    }
    data['pid'] = this.pid;
    if (this.en != null) {
      data['en'] = this.en!.toJson();
    }
    if (this.de != null) {
      data['de'] = this.de!.toJson();
    }
    data['fr'] = this.fr;
    data['status'] = this.status;
    data['approved'] = this.approved;
    data['productName'] = this.productName;
    data['company'] = this.company;
    data['deleted'] = this.deleted;
    data['productType'] = this.productType;
    data['bannerImage'] = this.bannerImage;
    data['slug'] = this.slug;
    data['purchasePrice'] = this.purchasePrice;
    data['salePrice'] = this.salePrice;
    data['esin'] = this.esin;
    data['isWishListed'] = this.isWishListed;
    data['quantity'] = this.quantity;
    return data;
  }
}

class Id {
  String? sId;

  Id({this.sId});

  Id.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    return data;
  }
}

class En {
  List<String>? points;
  List<Attribute>? attribute;
  List<String>? tags;
  List<String>? images;
  String? sId;
  String? productName;
  String? slug;
  String? description;
  String? manufacturer;
  String? brand;
  String? model;
  String? bannerImage;

  En(
      {this.points,
        this.attribute,
        this.tags,
        this.images,
        this.sId,
        this.productName,
        this.slug,
        this.description,
        this.manufacturer,
        this.brand,
        this.model,
        this.bannerImage});

  En.fromJson(Map<String, dynamic> json) {
    points = json['points'].cast<String>();
    if (json['attribute'] != null) {
      attribute = <Attribute>[];
      json['attribute'].forEach((v) {
        attribute!.add(new Attribute.fromJson(v));
      });
    }
    tags = json['tags'].cast<String>();
    images = json['images'].cast<String>();
    sId = json['_id'];
    productName = json['productName'];
    slug = json['slug'];
    description = json['description'];
    manufacturer = json['manufacturer'];
    brand = json['brand'];
    model = json['model'];
    bannerImage = json['bannerImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['points'] = this.points;
    if (this.attribute != null) {
      data['attribute'] = this.attribute!.map((v) => v.toJson()).toList();
    }
    data['tags'] = this.tags;
    data['images'] = this.images;
    data['_id'] = this.sId;
    data['productName'] = this.productName;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['manufacturer'] = this.manufacturer;
    data['brand'] = this.brand;
    data['model'] = this.model;
    data['bannerImage'] = this.bannerImage;
    return data;
  }
}

class Attribute {
  String? name;
  String? value;

  Attribute({this.name, this.value});

  Attribute.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}

class De {
  List<String>? points;
  List<Attribute>? attribute;
  List<String>? tags;
  List<String>? images;
  String? sId;
  String? productName;
  String? slug;
  String? description;
  String? manufacturer;
  String? brand;
  String? model;
  String? bannerImage;

  De(
      {this.points,
        this.attribute,
        this.tags,
        this.images,
        this.sId,
        this.productName,
        this.slug,
        this.description,
        this.manufacturer,
        this.brand,
        this.model,
        this.bannerImage});

  De.fromJson(Map<String, dynamic> json) {
    points = json['points'].cast<String>();
    if (json['attribute'] != null) {
      attribute = <Attribute>[];
      json['attribute'].forEach((v) {
        attribute!.add(new Attribute.fromJson(v));
      });
    }
    tags = json['tags'].cast<String>();
    images = json['images'].cast<String>();
    sId = json['_id'];
    productName = json['productName'];
    slug = json['slug'];
    description = json['description'];
    manufacturer = json['manufacturer'];
    brand = json['brand'];
    model = json['model'];
    bannerImage = json['bannerImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['points'] = this.points;
    if (this.attribute != null) {
      data['attribute'] = this.attribute!.map((v) => v.toJson()).toList();
    }
    data['tags'] = this.tags;
    data['images'] = this.images;
    data['_id'] = this.sId;
    data['productName'] = this.productName;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['manufacturer'] = this.manufacturer;
    data['brand'] = this.brand;
    data['model'] = this.model;
    data['bannerImage'] = this.bannerImage;
    return data;
  }
}
