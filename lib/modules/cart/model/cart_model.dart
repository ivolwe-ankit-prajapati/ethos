class CartModel {
  bool? status;
  List<CartResponse>? response;
  int? tax;

  CartModel({this.status, this.response, this.tax});

  CartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['response'] != null) {
      response = <CartResponse>[];
      json['response'].forEach((v) {
        response!.add(new CartResponse.fromJson(v));
      });
    }
    tax = json['tax'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.response != null) {
      data['response'] = this.response!.map((v) => v.toJson()).toList();
    }
    data['tax'] = this.tax;
    return data;
  }
}

class CartResponse {
  String? deleted;
  String? company;
  String? sId;
  String? productType;
  String? category;
  String? subcategory;
  String? childcategory;
  String? returnIn;
  String? returnType;
  En? en;
  String? seller;
  String? sellerId;
  String? product;
  String? productName;
  String? status;
  String? approved;
  List<String>? images;
  String? bannerImage;
  String? productId;
  String? esin;
  String? sku;
  String? prodQuantity;
  String? salePriceWtax;
  String? purchasePrice;
  String? salePrice;
  String? size;
  String? color;
  String? customerId;
  String? iV;
  String? productID;
  String? quantity;
  String? sessionId;

  CartResponse(
      {this.deleted,
        this.company,
        this.sId,
        this.productType,
        this.category,
        this.subcategory,
        this.childcategory,
        this.returnIn,
        this.returnType,
        this.en,
        this.seller,
        this.sellerId,
        this.product,
        this.productName,
        this.status,
        this.approved,
        this.images,
        this.bannerImage,
        this.productId,
        this.esin,
        this.sku,
        this.prodQuantity,
        this.salePriceWtax,
        this.purchasePrice,
        this.salePrice,
        this.size,
        this.color,
        this.customerId,
        this.iV,
        this.productID,
        this.quantity,
        this.sessionId});

  CartResponse.fromJson(Map<String, dynamic> json) {
    deleted = json['deleted'].toString();
    company = json['company'];
    sId = json['_id'];
    productType = json['productType'].toString();
    category = json['category'];
    subcategory = json['subcategory'];
    childcategory = json['childcategory'];
    returnIn = json['returnIn'];
    returnType = json['returnType'];
    en = json['en'] != null ? new En.fromJson(json['en']) : null;
    seller = json['seller'];
    sellerId = json['sellerId'];
    product = json['product'];
    productName = json['productName'];
    status = json['status'].toString();
    approved = json['approved'].toString();
    images = json['images'].cast<String>();
    bannerImage = json['bannerImage'];
    productId = json['productId'];
    esin = json['esin'];
    sku = json['sku'];
    prodQuantity = json['ProdQuantity'].toString();
    salePriceWtax = json['salePriceWtax'].toString();
    purchasePrice = json['purchasePrice'].toString();
    salePrice = json['salePrice'].toString();
    size = json['size'];
    color = json['color'];
    customerId = json['customerId'];
    iV = json['__v'].toString();
    productID = json['productID'];
    quantity = json['quantity'].toString();
    sessionId = json['sessionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deleted'] = this.deleted;
    data['company'] = this.company;
    data['_id'] = this.sId;
    data['productType'] = this.productType;
    data['category'] = this.category;
    data['subcategory'] = this.subcategory;
    data['childcategory'] = this.childcategory;
    data['returnIn'] = this.returnIn;
    data['returnType'] = this.returnType;
    if (this.en != null) {
      data['en'] = this.en!.toJson();
    }
    data['seller'] = this.seller;
    data['sellerId'] = this.sellerId;
    data['product'] = this.product;
    data['productName'] = this.productName;
    data['status'] = this.status;
    data['approved'] = this.approved;
    data['images'] = this.images;
    data['bannerImage'] = this.bannerImage;
    data['productId'] = this.productId;
    data['esin'] = this.esin;
    data['sku'] = this.sku;
    data['ProdQuantity'] = this.prodQuantity;
    data['salePriceWtax'] = this.salePriceWtax;
    data['purchasePrice'] = this.purchasePrice;
    data['salePrice'] = this.salePrice;
    data['size'] = this.size;
    data['color'] = this.color;
    data['customerId'] = this.customerId;
    data['__v'] = this.iV;
    data['productID'] = this.productID;
    data['quantity'] = this.quantity;
    data['sessionId'] = this.sessionId;
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
