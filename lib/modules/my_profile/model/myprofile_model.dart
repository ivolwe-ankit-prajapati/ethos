class ProfileModel {
  bool? status;
  Response? response;

  ProfileModel({this.status, this.response});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    response = json['response'] != null ? new Response.fromJson(json['response']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    return data;
  }
}

class Response {
  String? sId;
  List<Addresses>? addresses;
  List<WishList>? wishList;
  String? firstName;
  String? middleName;
  String? lastName;
  String? emailId;
  Phone? phone;
  String? password;
  int? status;
  String? createdOn;
  int? iV;
  String? city;
  String? country;
  String? state;
  String? updatedBy;
  String? updatedOn;
  String? zipCode;
  String? profilePic;
  String? deviceId;
  int? deviceType;
  String? countryName;
  String? stateName;
  String? cityName;

  Response({this.sId, this.addresses, this.wishList, this.firstName, this.middleName, this.lastName, this.emailId, this.phone, this.password, this.status, this.createdOn, this.iV, this.city, this.country, this.state, this.updatedBy, this.updatedOn, this.zipCode, this.profilePic, this.deviceId, this.deviceType, this.countryName, this.stateName, this.cityName});

  Response.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) { addresses!.add(new Addresses.fromJson(v)); });
    }
    if (json['wishList'] != null) {
      wishList = <WishList>[];
      json['wishList'].forEach((v) { wishList!.add(new WishList.fromJson(v)); });
    }
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    emailId = json['emailId'];
    phone = json['phone'] != null ? new Phone.fromJson(json['phone']) : null;
    password = json['password'];
    status = json['status'];
    createdOn = json['createdOn'];
    iV = json['__v'];
    city = json['city'];
    country = json['country'];
    state = json['state'];
    updatedBy = json['updatedBy'];
    updatedOn = json['updatedOn'];
    zipCode = json['zipCode'];
    profilePic = json['profilePic'];
    deviceId = json['deviceId'];
    deviceType = json['deviceType'];
    countryName = json['countryName'];
    stateName = json['stateName'];
    cityName = json['cityName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.addresses != null) {
      data['addresses'] = this.addresses!.map((v) => v.toJson()).toList();
    }
    if (this.wishList != null) {
      data['wishList'] = this.wishList!.map((v) => v.toJson()).toList();
    }
    data['firstName'] = this.firstName;
    data['middleName'] = this.middleName;
    data['lastName'] = this.lastName;
    data['emailId'] = this.emailId;
    if (this.phone != null) {
      data['phone'] = this.phone!.toJson();
    }
    data['password'] = this.password;
    data['status'] = this.status;
    data['createdOn'] = this.createdOn;
    data['__v'] = this.iV;
    data['city'] = this.city;
    data['country'] = this.country;
    data['state'] = this.state;
    data['updatedBy'] = this.updatedBy;
    data['updatedOn'] = this.updatedOn;
    data['zipCode'] = this.zipCode;
    data['profilePic'] = this.profilePic;
    data['deviceId'] = this.deviceId;
    data['deviceType'] = this.deviceType;
    data['countryName'] = this.countryName;
    data['stateName'] = this.stateName;
    data['cityName'] = this.cityName;
    return data;
  }
}

class Addresses {
  String? name;
  Phone? phone;
  String? country;
  String? state;
  String? city;
  String? zipCode;
  int? addressType;
  String? address;
  int? id;
  int? defult;

  Addresses({this.name, this.phone, this.country, this.state, this.city, this.zipCode, this.addressType, this.address, this.id, this.defult});

Addresses.fromJson(Map<String, dynamic> json) {
name = json['name'];
phone = json['phone'] != null ? new Phone.fromJson(json['phone']) : null;
country = json['country'];
state = json['state'];
city = json['city'];
zipCode = json['zipCode'];
addressType = json['addressType'];
address = json['address'];
id = json['id'];
defult = json['defult'];
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['name'] = this.name;
  if (this.phone != null) {
    data['phone'] = this.phone!.toJson();
  }
  data['country'] = this.country;
  data['state'] = this.state;
  data['city'] = this.city;
  data['zipCode'] = this.zipCode;
  data['addressType'] = this.addressType;
  data['address'] = this.address;
  data['id'] = this.id;
  data['defult'] = this.defult;
  return data;
}
}

class Phone {
  String? number;
  String? internationalNumber;
  String? nationalNumber;
  String? e164Number;
  String? countryCode;
  String? dialCode;

  Phone({this.number, this.internationalNumber, this.nationalNumber, this.e164Number, this.countryCode, this.dialCode});

  Phone.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    internationalNumber = json['internationalNumber'];
    nationalNumber = json['nationalNumber'];
    e164Number = json['e164Number'];
    countryCode = json['countryCode'];
    dialCode = json['dialCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['internationalNumber'] = this.internationalNumber;
    data['nationalNumber'] = this.nationalNumber;
    data['e164Number'] = this.e164Number;
    data['countryCode'] = this.countryCode;
    data['dialCode'] = this.dialCode;
    return data;
  }
}

class WishList {
  String? productId;
  String? esin;
  String? date;

  WishList({this.productId, this.esin, this.date});

  WishList.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    esin = json['esin'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['esin'] = this.esin;
    data['date'] = this.date;
    return data;
  }
}
