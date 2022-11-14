class ProductDetailModel {
  bool? status;
  Response? response;
  Variation? variation;
  int? tax;

  ProductDetailModel({this.status, this.response, this.variation, this.tax});

  ProductDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
    variation = json['variation'] != null
        ? new Variation.fromJson(json['variation'])
        : null;
    tax = json['tax'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    if (this.variation != null) {
      data['variation'] = this.variation!.toJson();
    }
    data['tax'] = this.tax;
    return data;
  }
}

class Response {
  String? sId;
  String? categoryId;
  CateName? cateName;
  CateName? subCateName;
  int? deleted;
  String? company;
  String? productName;
  int? productType;
  String? subcategory;
  String? returnIn;
  String? returnType;
  En? en;
  En? de;
  String? sellerId;
  int? status;
  int? approved;
  int? featured;
  int? todayDeal;
  List<Dimention>? dimention;
  List<String>? points;
  List<Attribute>? attribute;
  List<String>? tags;
  List<String>? images;
  String? bannerImage;
  String? slug;
  Weight? weight;
  String? productId;
  String? mesin;
  String? esin;
  String? sku;
  String? manufacturer;
  String? brand;
  String? model;
  String? description;
  String? quantity;
  String? salePriceWtax;
  String? purchasePrice;
  String? salePrice;
  String? discountP;
  String? size;
  String? color;
  String? colorMap;
  bool? isWishListed;

  Response(
      {this.sId,
        this.categoryId,
        this.cateName,
        this.subCateName,
        this.deleted,
        this.company,
        this.productName,
        this.productType,
        this.subcategory,
        this.returnIn,
        this.returnType,
        this.en,
        this.de,
        this.sellerId,
        this.status,
        this.approved,
        this.featured,
        this.todayDeal,
        this.dimention,
        this.points,
        this.attribute,
        this.tags,
        this.images,
        this.bannerImage,
        this.slug,
        this.weight,
        this.productId,
        this.mesin,
        this.esin,
        this.sku,
        this.manufacturer,
        this.brand,
        this.model,
        this.description,
        this.quantity,
        this.salePriceWtax,
        this.purchasePrice,
        this.salePrice,
        this.discountP,
        this.size,
        this.color,
        this.colorMap,
        this.isWishListed});

  Response.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    categoryId = json['categoryId'];
    cateName = json['CateName'] != null
        ? new CateName.fromJson(json['CateName'])
        : null;
    subCateName = json['SubCateName'] != null
        ? new CateName.fromJson(json['SubCateName'])
        : null;
    deleted = json['deleted'];
    company = json['company'];
    productName = json['productName'];
    productType = json['productType'];
    subcategory = json['subcategory'];
    returnIn = json['returnIn'];
    returnType = json['returnType'];
    en = json['en'] != null ? new En.fromJson(json['en']) : null;
    de = json['de'] != null ? new En.fromJson(json['de']) : null;
    sellerId = json['sellerId'];
    status = json['status'];
    approved = json['approved'];
    featured = json['featured'];
    todayDeal = json['todayDeal'];
    if (json['dimention'] != null) {
      dimention = <Dimention>[];
      json['dimention'].forEach((v) {
        dimention!.add(new Dimention.fromJson(v));
      });
    }
    points = json['points'].cast<String>();
    if (json['attribute'] != null) {
      attribute = <Attribute>[];
      json['attribute'].forEach((v) {
        attribute!.add(new Attribute.fromJson(v));
      });
    }
    tags = json['tags'].cast<String>();
    images = json['images'].cast<String>();
    bannerImage = json['bannerImage'];
    slug = json['slug'];
    weight =
    json['weight'] != null ? new Weight.fromJson(json['weight']) : null;
    productId = json['productId'];
    mesin = json['mesin'];
    esin = json['esin'];
    sku = json['sku'];
    manufacturer = json['manufacturer'];
    brand = json['brand'];
    model = json['model'];
    description = json['description'];
    quantity = json['quantity'].toString();
    salePriceWtax = json['salePriceWtax'].toString();
    purchasePrice = json['purchasePrice'].toString();
    salePrice = json['salePrice'].toString();
    discountP = json['discountP'].toString();
    size = json['size'];
    color = json['color'];
    colorMap = json['colorMap'];
    isWishListed = json['isWishListed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['categoryId'] = this.categoryId;
    if (this.cateName != null) {
      data['CateName'] = this.cateName!.toJson();
    }
    if (this.subCateName != null) {
      data['SubCateName'] = this.subCateName!.toJson();
    }
    data['deleted'] = this.deleted;
    data['company'] = this.company;
    data['productName'] = this.productName;
    data['productType'] = this.productType;
    data['subcategory'] = this.subcategory;
    data['returnIn'] = this.returnIn;
    data['returnType'] = this.returnType;
    if (this.en != null) {
      data['en'] = this.en!.toJson();
    }
    if (this.de != null) {
      data['de'] = this.de!.toJson();
    }
    data['sellerId'] = this.sellerId;
    data['status'] = this.status;
    data['approved'] = this.approved;
    data['featured'] = this.featured;
    data['todayDeal'] = this.todayDeal;
    if (this.dimention != null) {
      data['dimention'] = this.dimention!.map((v) => v.toJson()).toList();
    }
    data['points'] = this.points;
    if (this.attribute != null) {
      data['attribute'] = this.attribute!.map((v) => v.toJson()).toList();
    }
    data['tags'] = this.tags;
    data['images'] = this.images;
    data['bannerImage'] = this.bannerImage;
    data['slug'] = this.slug;
    if (this.weight != null) {
      data['weight'] = this.weight!.toJson();
    }
    data['productId'] = this.productId;
    data['mesin'] = this.mesin;
    data['esin'] = this.esin;
    data['sku'] = this.sku;
    data['manufacturer'] = this.manufacturer;
    data['brand'] = this.brand;
    data['model'] = this.model;
    data['description'] = this.description;
    data['quantity'] = this.quantity;
    data['salePriceWtax'] = this.salePriceWtax;
    data['purchasePrice'] = this.purchasePrice;
    data['salePrice'] = this.salePrice;
    data['discountP'] = this.discountP;
    data['size'] = this.size;
    data['color'] = this.color;
    data['colorMap'] = this.colorMap;
    data['isWishListed'] = this.isWishListed;
    return data;
  }
}

class CateName {
  String? en;
  String? de;
  String? fr;

  CateName({this.en, this.de, this.fr});

  CateName.fromJson(Map<String, dynamic> json) {
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

class Dimention {
  String? heigth;
  String? unit;
  String? width;
  String? length;

  Dimention({this.heigth, this.unit, this.width, this.length});

  Dimention.fromJson(Map<String, dynamic> json) {
    heigth = json['heigth'];
    unit = json['unit'];
    width = json['width'];
    length = json['length'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['heigth'] = this.heigth;
    data['unit'] = this.unit;
    data['width'] = this.width;
    data['length'] = this.length;
    return data;
  }
}

class Weight {
  String? weight;
  String? unit;

  Weight({this.weight, this.unit});

  Weight.fromJson(Map<String, dynamic> json) {
    weight = json['weight'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['weight'] = this.weight;
    data['unit'] = this.unit;
    return data;
  }
}

class Variation {
  int? ratingsAverage;
  int? ratingsCount;
  List<String>? optionSIze;
  List<OptionColor>? optionColor;
  List<ColorAvalablity>? colorAvalablity;
  List<String>? sizeAvalablity;

  Variation(
      {this.ratingsAverage,
        this.ratingsCount,
        this.optionSIze,
        this.optionColor,
        this.colorAvalablity,
        this.sizeAvalablity});

  Variation.fromJson(Map<String, dynamic> json) {
    ratingsAverage = json['ratings_average'];
    ratingsCount = json['ratings_Count'];
    optionSIze = json['optionSIze'].cast<String>();
    if (json['optionColor'] != null) {
      optionColor = <OptionColor>[];
      json['optionColor'].forEach((v) {
        optionColor!.add(new OptionColor.fromJson(v));
      });
    }
    if (json['colorAvalablity'] != null) {
      colorAvalablity = <ColorAvalablity>[];
      json['colorAvalablity'].forEach((v) {
        colorAvalablity!.add(new ColorAvalablity.fromJson(v));
      });
    }
    sizeAvalablity = json['sizeAvalablity'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ratings_average'] = this.ratingsAverage;
    data['ratings_Count'] = this.ratingsCount;
    data['optionSIze'] = this.optionSIze;
    if (this.optionColor != null) {
      data['optionColor'] = this.optionColor!.map((v) => v.toJson()).toList();
    }
    if (this.colorAvalablity != null) {
      data['colorAvalablity'] =
          this.colorAvalablity!.map((v) => v.toJson()).toList();
    }
    data['sizeAvalablity'] = this.sizeAvalablity;
    return data;
  }
}

class OptionColor {
  String? id;
  String? value;
  CateName? name;

  OptionColor({this.id, this.value, this.name});

  OptionColor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    name = json['name'] != null ? new CateName.fromJson(json['name']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    return data;
  }
}

class ColorAvalablity {
  String? id;
  String? value;
  CateName? name;

  ColorAvalablity({this.id, this.value, this.name});

  ColorAvalablity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    name = json['name'] != null ? new CateName.fromJson(json['name']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    return data;
  }
}