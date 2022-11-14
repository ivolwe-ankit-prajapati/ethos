class ProductListModel {
  bool? status;
  List<ProductListResponse>? response;
  int? totalCount;

  ProductListModel({this.status, this.response, this.totalCount});

  ProductListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['response'] != null) {
      response = <ProductListResponse>[];
      json['response'].forEach((v) {
        response!.add(new ProductListResponse.fromJson(v));
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

class ProductListResponse {
  String? sId;
  String? productId;
  String? esin;
  String? productName;
  int? productType;
  List<String>? images;
  String? description;
  String? manufacturer;
  String? bannerImage;
  String? brand;
  En? en;
  String? subcategory;
  SubCateName? subCateName;
  String? categoryId;
  SubCateName? cateName;
  String? seller;
  int? deleted;
  int? status;
  int? approved;
  int? featured;
  int? todayDeal;
  String? purchasePrice;
  String? salePrice;
  int? ratingsAverage;
  int? ratingsCount;
  int? discountP;
  bool? isWishListed;

  ProductListResponse(
      {this.sId,
        this.productId,
        this.esin,
        this.productName,
        this.productType,
        this.images,
        this.description,
        this.manufacturer,
        this.bannerImage,
        this.brand,
        this.en,
        this.subcategory,
        this.subCateName,
        this.categoryId,
        this.cateName,
        this.seller,
        this.deleted,
        this.status,
        this.approved,
        this.featured,
        this.todayDeal,
        this.purchasePrice,
        this.salePrice,
        this.ratingsAverage,
        this.ratingsCount,
        this.discountP,
        this.isWishListed});

  ProductListResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    productId = json['productId'];
    esin = json['esin'];
    productName = json['productName'];
    productType = json['productType'];
    images = json['images'].cast<String>();
    description = json['description'];
    manufacturer = json['manufacturer'];
    bannerImage = json['bannerImage'];
    brand = json['brand'];
    en = json['en'] != null ? new En.fromJson(json['en']) : null;
    subcategory = json['subcategory'];
    subCateName = json['SubCateName'] != null
        ? new SubCateName.fromJson(json['SubCateName'])
        : null;
    categoryId = json['categoryId'];
    cateName = json['CateName'] != null
        ? new SubCateName.fromJson(json['CateName'])
        : null;
    seller = json['seller'];
    deleted = json['deleted'];
    status = json['status'];
    approved = json['approved'];
    featured = json['featured'];
    todayDeal = json['todayDeal'];
    purchasePrice = json['purchasePrice'].toString();
    salePrice = json['salePrice'].toString();
    ratingsAverage = json['ratings_average'];
    ratingsCount = json['ratings_Count'];
    discountP = json['discountP'];
    isWishListed = json['isWishListed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['productId'] = this.productId;
    data['esin'] = this.esin;
    data['productName'] = this.productName;
    data['productType'] = this.productType;
    data['images'] = this.images;
    data['description'] = this.description;
    data['manufacturer'] = this.manufacturer;
    data['bannerImage'] = this.bannerImage;
    data['brand'] = this.brand;
    if (this.en != null) {
      data['en'] = this.en!.toJson();
    }
    data['subcategory'] = this.subcategory;
    if (this.subCateName != null) {
      data['SubCateName'] = this.subCateName!.toJson();
    }
    data['categoryId'] = this.categoryId;
    if (this.cateName != null) {
      data['CateName'] = this.cateName!.toJson();
    }
    data['seller'] = this.seller;
    data['deleted'] = this.deleted;
    data['status'] = this.status;
    data['approved'] = this.approved;
    data['featured'] = this.featured;
    data['todayDeal'] = this.todayDeal;
    data['purchasePrice'] = this.purchasePrice;
    data['salePrice'] = this.salePrice;
    data['ratings_average'] = this.ratingsAverage;
    data['ratings_Count'] = this.ratingsCount;
    data['discountP'] = this.discountP;
    data['isWishListed'] = this.isWishListed;
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

class SubCateName {
  String? en;
  String? de;
  String? fr;

  SubCateName({this.en, this.de, this.fr});

  SubCateName.fromJson(Map<String, dynamic> json) {
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
