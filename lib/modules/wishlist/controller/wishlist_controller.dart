import 'dart:convert';

import 'package:ethos/application.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../../config/const/api_path.dart';
import '../../../../services/rest_api_service/rest_api_service.dart';

import 'package:dio/dio.dart';

import '../model/wishlist_model.dart';


class WishListController extends GetxController{

  var wishList = <WishListResponse>[].obs;

  var isWishListLoading =0.obs;
  // late Dio _dio;
  late Dio _dio = Dio(BaseOptions(baseUrl:"http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/"));
  @override
  void onInit() {
    getWishList();
    super.onInit();
  }
  Future<void> getWishList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    // var formdata = {"business_id": id,"date": "",};
    // String? token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InByYWthc2hAaXZvbHdlLmNvbSIsImlkIjoiNjI0ODIyMmM0NzlkZDQ2YTE5ZTM5ODE2IiwiaWF0IjoxNjU4MTI4MzIyLCJleHAiOjE2NTgyMTQ3MjJ9.uhQy82xvD1DdQlPXcCks1zAa-bX-haAgBJrxUIx_PQg";
    var url = Uri.parse('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/user/addressList');
    Options options = Options(
      // contentType: 'application/json',
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    var response = await _dio.get('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/mobile/user/wishList?pageNo=1&size=15&lang=en&Gtext=',options: options);
    // ApiResponse responsedata = await Application.restApiService?.getApiCall(addressListUrl);
    print("wish list>> ");
    // debugPrint(response.data.toString());
    print(response.data['status']);
    if (response.statusCode == 200) {
      print(response.data['status']);
      if (response.data['status'] == true) {
        WishListModel wishListModel = WishListModel.fromJson(response.data);
        wishList.assignAll(wishListModel.response!);

        isWishListLoading.value= 1;
      } else {
        isWishListLoading.value= 2;
      }
    } else if (response.statusCode != 200) {
      print("Status.ERROR");
      isWishListLoading.value=2;
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
      var url = Uri.parse('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/user/AddwishList');
      var response = await _dio.post('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/mobile/user/removewishList',options: options,data: data);

      // http.Response response = await http.post(
      //     url,
      //     body: data,
      //
      // );
      if(response.statusCode == 200){
        ///data successfully

        // var result = jsonDecode(response.data.toString());
        print(response.data.toString());

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
      var url = Uri.parse('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/product/addToCart');
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
}
