class ProductRatingModel {
  bool? status;
  List<ProductRatingResponse>? response;

  ProductRatingModel({this.status, this.response});

  ProductRatingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['response'] != null) {
      response = <ProductRatingResponse>[];
      json['response'].forEach((v) {
        response!.add(new ProductRatingResponse.fromJson(v));
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

class ProductRatingResponse {
  String? profilePic;
  String? name;
  String? ratId;
  String? rate;
  String? createdOn;
  String? review;
  List<String>? images;

  ProductRatingResponse(
      {this.profilePic,
        this.name,
        this.ratId,
        this.rate,
        this.createdOn,
        this.review,
        this.images});

  ProductRatingResponse.fromJson(Map<String, dynamic> json) {
    profilePic = json['profilePic'];
    name = json['name'];
    ratId = json['ratId'];
    rate = json['rate'];
    createdOn = json['createdOn'];
    review = json['review'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profilePic'] = this.profilePic;
    data['name'] = this.name;
    data['ratId'] = this.ratId;
    data['rate'] = this.rate;
    data['createdOn'] = this.createdOn;
    data['review'] = this.review;
    data['images'] = this.images;
    return data;
  }
}
