class AddressListModel {
  bool? status;
  List<AddressListResult>? response;

  AddressListModel({this.status, this.response});

  AddressListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['response'] != null) {
      response = <AddressListResult>[];
      json['response'].forEach((v) { response!.add(new AddressListResult.fromJson(v)); });
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

class AddressListResult {
  String? name;
  Phone? phone;
  String? country;
  String? state;
  String? city;
  String? zipCode;
  String? addressType;
  String? address;
  String? id;
  String? defalt;
  String? countryName;
  String? stateName;
  String? cityName;

  AddressListResult({this.name, this.phone, this.country, this.state, this.city, this.zipCode, this.addressType, this.address, this.id, this.defalt, this.countryName, this.stateName, this.cityName});

AddressListResult.fromJson(Map<String, dynamic> json) {
name = json['name'];
phone = json['phone'] != null ? new Phone.fromJson(json['phone']) : null;
country = json['country'];
state = json['state'];
city = json['city'];
zipCode = json['zipCode'];
addressType = json['addressType'].toString();
address = json['address'];
id = json['id'].toString();
defalt = json['default'].toString();
countryName = json['countryName'];
stateName = json['stateName'];
cityName = json['cityName'];
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
  data['default'] = this.defalt;
  data['countryName'] = this.countryName;
  data['stateName'] = this.stateName;
  data['cityName'] = this.cityName;
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
