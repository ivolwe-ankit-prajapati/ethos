import 'dart:convert';
import 'package:ethos/application.dart';
import 'package:ethos/modules/product/model/product_rating_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../../config/const/api_path.dart';
import '../../../../services/rest_api_service/rest_api_service.dart';
import 'package:dio/dio.dart';
import '../../../models/onboarding_info.dart';
import '../../cart/model/cart_model.dart';
import '../../wishlist/model/wishlist_model.dart';
import '../model/product_detail_model.dart';

class ProductDetailController extends GetxController{
  ProductDetailController (this.productId,this.esin);
  // ProductDetailModel? productDetailModel;
  var esin;
  var productId;
  var myData;
  final productDetailModel = ProductDetailModel().obs;
  final user = Rxn<ProductDetailModel>();

  // final productRating = <ProductRatingResponse>[].obs;
  var productRating = <ProductRatingResponse>[].obs;
  var productImages = <String>[].obs;
  var productColor = <String>[].obs;
  var colorModel = <OptionColor>[].obs;
  var productSize = <String>[].obs;
  // List<ProductImages> productImages = [].obs;
  var pageController = PageController();
  // int currentPage = 0.obs as int;

  // onchanged(int index) {
  //
  //     currentPage = index;
  //   update();
  //   print(currentPage);
  // }
  var cartItemCount =0.obs;
  var wishListItemCount =0.obs;
  var isProductDetailLoading =0.obs;
  var ratingAvg =0.0.obs;
  // late Dio _dio;
  late Dio _dio = Dio(BaseOptions(baseUrl:"http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/"));
  var selectedPageIndex = 0.obs;
  // bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;


  @override
  void onInit() {
    getProductDetail(productId!, esin!,"","");
    getCartCount();
    getProductRating(productId);
    getWishListCount();
    super.onInit();
  }

  Future<void> getProductDetail(String productId,String esin,String color,String size) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String? userId = prefs.getString('userId');
    productImages.clear();
    productSize.clear();
    productColor.clear();


    // var formdata = {"business_id": id,"date": "",};
    // String? token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InByYWthc2hAaXZvbHdlLmNvbSIsImlkIjoiNjI0ODIyMmM0NzlkZDQ2YTE5ZTM5ODE2IiwiaWF0IjoxNjU4MTI4MzIyLCJleHAiOjE2NTgyMTQ3MjJ9.uhQy82xvD1DdQlPXcCks1zAa-bX-haAgBJrxUIx_PQg";
    // var url = Uri.parse('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/mobile/user/addressList');
    Options options = Options(
      // contentType: 'application/json',
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    var response;
    if(color!=""&&size!="")
      {
        response = await _dio.get('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/mobile/product/getProductdetail/$esin?lang=en&pid=$productId&userID=$userId&color=$color&size=$size',options: options);
      }
    else if(color==""&&size!="")
      {
        // response = await _dio.get('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/mobile/product/getProductdetail/$esin?lang=en&pid=$productId&userID=$userId&color=&size=$size',options: options);
        // response = await _dio.get('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/mobile/product/getProductdetail/$esin?lang=en&pid=$productId&color=&size=$size',options: options);
        response = await _dio.get('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/mobile/product/getProductdetail/$esin?lang=en&pid=$productId&userID=$userId&size=$size',options: options);
      }
    else if(color==""&&size=="")
      {
        response = await _dio.get('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/mobile/product/getProductdetail/$esin?lang=en&pid=$productId&userID=$userId',options: options);
      }

    // ApiResponse responsedata = await Application.restApiService?.getApiCall(addressListUrl);
    print("product details>> ");
    // debugPrint(response.data.toString());

    // print(response.data['status']);
    if (response.statusCode == 200) {
      // print(response.data['response']);
      if (response.data['status'] == true) {
        ProductDetailModel productDetailModel = ProductDetailModel.fromJson(response.data);

        user.value=productDetailModel;
        // colorModel.value=productDetailModel.variation.colorAvalablity;

        colorModel.assignAll(productDetailModel.variation!.optionColor!);
        // print(productDetailModel.response?.images![0]);
        if(productDetailModel.response?.images?.length!=0)
          {
            for(int i=0;i<productDetailModel.response!.images!.length;i++)
              {
                productImages.add("${productDetailModel.response?.images![i]}");
              }
          }
        if(productDetailModel.variation?.optionColor?.length!=0)
        {
          for(int i=0;i<productDetailModel.variation!.optionColor!.length;i++)
          {
            productColor.add("${productDetailModel.variation?.optionColor![i].toString().toLowerCase()}");
          }
        }
        if(productDetailModel.variation?.optionSIze?.length!=0)
        {
          for(int i=0;i<productDetailModel.variation!.optionSIze!.length;i++)
          {
            productSize.add("${productDetailModel.variation?.optionSIze![i].toString().toUpperCase()}");
          }
        }

        ratingAvg.value = double.parse("${productDetailModel.variation?.ratingsAverage}");

        print("ratingAvg.value");
        print(ratingAvg.value);
        // productDetailModel.update((val) {
        //   val?.response=response.data['response'];
        //   val?.status=response.data['status'];
        //   val?.variation=response.data['variation'];
        //   // val.status
        // });

        // productDetailModel =  ProductDetailModel.fromJson(response.data);

        // myData=ProductDetailModel.fromJson(response.data) as RxString;
        // myData = response.data;
        isProductDetailLoading.value= 1;
      } else {
        isProductDetailLoading.value= 2;
      }
    } else if (response.statusCode != 200) {
      print("Status.ERROR");
      isProductDetailLoading.value=2;
    }
  }

  Future<void> getProductRating(String productId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String? userId = prefs.getString('userId');
    productImages.clear();
    productSize.clear();
    productColor.clear();


    // var formdata = {"business_id": id,"date": "",};
    // String? token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InByYWthc2hAaXZvbHdlLmNvbSIsImlkIjoiNjI0ODIyMmM0NzlkZDQ2YTE5ZTM5ODE2IiwiaWF0IjoxNjU4MTI4MzIyLCJleHAiOjE2NTgyMTQ3MjJ9.uhQy82xvD1DdQlPXcCks1zAa-bX-haAgBJrxUIx_PQg";
    // var url = Uri.parse('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/user/addressList');
    Options options = Options(
      // contentType: 'application/json',
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    var response= await _dio.get('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/mobile/product/getProductRating/62482a479c7e7f15698519a8',options: options);


    // ApiResponse responsedata = await Application.restApiService?.getApiCall(addressListUrl);
    print("product rating>> ");
    // debugPrint(response.data.toString());

    // print(response.data['status']);
    if (response.statusCode == 200) {
      // print(response.data['response']);
      if (response.data['status'] == true) {

        ProductRatingModel productRatingModel = ProductRatingModel.fromJson(response.data);

        // productRating.value=productRatingModel;
        productRating.assignAll(productRatingModel.response!);
        // colorModel.value=productDetailModel.variation.colorAvalablity;

      } else {

      }
    } else if (response.statusCode != 200) {
      print("Status.ERROR");

    }
  }

  Future<void> addToCart(String productId,String quantity,String esin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String? userId = prefs.getString('userId');

    try{

      Options options = Options(
        // contentType: 'application/json',
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
      );

      Map data = {
        "customerId": userId,
        "productID": productId,
        "quantity": quantity,
        "sessionId": userId,
        "esin": esin,
      };
      var url = Uri.parse('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/mobile/product/addToCart');
      var response = await _dio.post('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/mobile/product/addToCart',options: options,data: data);


      if(response.statusCode == 200){
        ///data successfully
        // var result = jsonDecode(response.data.toString());
        // print(result);

        // user_model =  User_Model.fromJson(result);
        Fluttertoast.showToast(
            msg: "Added to Cart",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            timeInSecForIosWeb: 1);

      }else{
        ///error
      }
    }catch(e){
      // log('Error while getting data is $e');
      print('Error while getting data is $e');
    }finally{

    }
  }

  Future<void> getCartCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String? userId = prefs.getString('userId');
    // var formdata = {"business_id": id,"date": "",};
    // String? token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InByYWthc2hAaXZvbHdlLmNvbSIsImlkIjoiNjI0ODIyMmM0NzlkZDQ2YTE5ZTM5ODE2IiwiaWF0IjoxNjU4MTI4MzIyLCJleHAiOjE2NTgyMTQ3MjJ9.uhQy82xvD1DdQlPXcCks1zAa-bX-haAgBJrxUIx_PQg";
    // var url = Uri.parse('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/user/addressList');
    Options options = Options(
      // contentType: 'application/json',
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    cartItemCount.value=0;
    var response = await _dio.get('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/mobile/product/cartList?sessionId=&userId=$userId&lang=en',options: options);
    // ApiResponse responsedata = await Application.restApiService?.getApiCall(addressListUrl);
    print("cart list>> ");
    debugPrint(response.data.toString());
    print(response.data['status']);
    if (response.statusCode == 200) {
      print(response.data['status']);
      if (response.data['status'] == true) {
        CartModel cartModel = CartModel.fromJson(response.data);
        // listOne.assignAll(cartModel.response!);
        // cart.assignAll(cartModel.response!);
        if(cartModel.response?.length!=0)
        {
          for(int i=0;i<cartModel.response!.length;i++)
          {
            cartItemCount = cartItemCount +int.parse("${cartModel.response![i].quantity}");
            // productImages.add("${productDetailModel.response?.images![i]}");
          }
        }
        print(cartItemCount);

      } else {

      }
    } else if (response.statusCode != 200) {
      print("Status.ERROR");

    }
  }

  Future<String?> convertDate(String date) async {
    String d=DateFormat("dd/MM/yyyy hh:mm").format(DateTime.parse("2022-03-30T18:56:17.33Z"),);
    return d;
  }
  Future<void> addToWishlist(String productId,String esin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    try{

      Options options = Options(
        // contentType: 'application/json',
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
      );
      Map data = {
        "productId": productId,
        "esin": esin,
      };
      var url = Uri.parse('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/mobile/user/AddwishList');
      var response = await _dio.post('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/mobile/user/AddwishList',options: options,data: data);

      // http.Response response = await http.post(
      //     url,
      //     body: data,
      //
      // );

      if(response.statusCode == 200){
        ///data successfully

        // var result = jsonDecode(response.data.toString());
        // print(result);

        // user_model =  User_Model.fromJson(result);
        Fluttertoast.showToast(
            msg: "Added to wishlist",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            timeInSecForIosWeb: 1);

      }else{
        ///error
      }
    }catch(e){
      // log('Error while getting data is $e');
      print('Error while getting data is $e');
    }finally{

    }
  }


  Future<void> getWishListCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    Options options = Options(
      // contentType: 'application/json',
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    var response = await _dio.get('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/mobile/user/wishList?pageNo=1&size=15&lang=en&Gtext=',options: options);
    // ApiResponse responsedata = await Application.restApiService?.getApiCall(addressListUrl);
    print("wish list count>> ");
    // debugPrint(response!.data);
    if (response.statusCode == 200) {
      print(response.data['status']);
      if (response.data['status'] == true) {

        WishListModel wishListModel = WishListModel.fromJson(response.data);
        // wishList.assignAll(wishListModel.response!);
        wishListItemCount.value = wishListModel.totalCount!;

        print(wishListModel.response!.length);
      } else {

      }
    } else if (response.statusCode != 200) {
      print("Status.ERROR");

    }
  }
}
