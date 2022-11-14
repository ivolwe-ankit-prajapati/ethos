import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ethos/modules/homepage/model/productlist_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../auth/views/verify_otp.dart';
import '../../cart/model/cart_model.dart';
import '../../product/model/product_detail_model.dart';
import '../../wishlist/model/wishlist_model.dart';
import '../model/cotegory_model.dart';

class HomePageController extends GetxController {

  var categoryList = <CategoryResponse>[].obs;
  var productList = <ProductListResponse>[].obs;
  ProductDetailModel? productDetailModel;

  var isProductDetailLoading =0.obs;
  var isDataLoading =0.obs;
  var isProductListLoading =0.obs;
  var cartItemCount =0.obs;
  var wishListItemCount =0.obs;
  var isLoggedIn =false.obs;
  // late Dio _dio;
  late Dio _dio = Dio(BaseOptions(baseUrl:"http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/"));

  Future<void> getCategoryList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    // var formdata = {"business_id": id,"date": "",};

    Options options = Options(
      // contentType: 'application/json',
      headers: {
        "Content-Type": "application/json",
        // "Authorization": "Bearer $token"
      },
    );
    var response = await _dio.get('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/product/categorylist',options: options);
    // ApiResponse responsedata = await Application.restApiService?.getApiCall(addressListUrl);
    print("category list>> ");
    // debugPrint(response.data.toString());
    if (response.statusCode == 200) {
      if (response.data['status'] == true) {
        CategoryModel categoryModel = CategoryModel.fromJson(response.data);
        categoryList.assignAll(categoryModel.response!);
        // print(favourite_model.status.toString());
        isDataLoading.value= 1;
      } else {
        isDataLoading.value= 2;
      }
    } else if (response.statusCode != 200) {
      print("Status.ERROR");
      isDataLoading.value=2;
    }
  }

  Future<void> getProductList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String? userId = prefs.getString('userId');
    bool isLogin = prefs.getBool('isLogin') ?? false;
    // var formdata = {"business_id": id,"date": "",};

    isLoggedIn.value=prefs.getBool('isLogin') ?? false;

    Options options = Options(
      // contentType: 'application/json',
      headers: {
        "Content-Type": "application/json",
        // "Authorization": "Bearer $token"
      },
    );
    // var response = await _dio.get('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/mobile/product/productList?searchtext=&userID=$userId&lang=en&cate=&sortBy=&subCate=&action=&pageNo=1&size=50',options: options);
    var response;

    if(isLogin)
      {
        response = await _dio.get('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/mobile/product/productList?searchtext=&userID=$userId&lang=en&cate=&sortBy=&subCate=&action=&pageNo=1&size=15',options: options);

      }
    else{
      response = await _dio.get('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/mobile/product/productList?searchtext=&lang=en&cate=&sortBy=&subCate=&action=&pageNo=1&size=15',options: options);

    }
    // ApiResponse responsedata = await Application.restApiService?.getApiCall(addressListUrl);
    // print(userId);
    print("product list>> ");
    debugPrint(response.data.toString());
    // log('data: ${response.data.toString()}');
    if (response.statusCode == 200) {
      if (response.data['status'] == true) {
        ProductListModel productListModel = ProductListModel.fromJson(response.data);
        productList.assignAll(productListModel.response!);
        // print(favourite_model.status.toString());

        isProductListLoading.value= 1;
      } else {
        isProductListLoading.value= 2;
      }
    } else if (response.statusCode != 200) {
      print("Status.ERROR");
      isProductListLoading.value=2;
    }
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
      var url = Uri.parse('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/user/AddwishList');
      var response = await _dio.post('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/user/AddwishList',options: options,data: data);

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
  Future<void> removeFromWishlist(String productId) async {
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
      };
      var url = Uri.parse('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/user/removewishList');
      var response = await _dio.post('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/user/removewishList',options: options,data: data);

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
            msg: "Removed from wishlist",
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


  RxBool isSelected = false.obs;

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
    print("cart count>> ");
    // debugPrint(response.data.toString());
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
        wishListItemCount.value = wishListModel.response!.length;

        print(wishListModel.response!.length);
      } else {

      }
    } else if (response.statusCode != 200) {
      print("Status.ERROR");

    }
  }

  toogle() {
    if(isSelected.value==true) {
      isSelected.value = false;
    } else {
      isSelected.value = true;
    }
  }

  @override
  void onInit() {
    getProductList();
    getCategoryList();
    getCartCount();
    getWishListCount();
    super.onInit();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
  }




}
