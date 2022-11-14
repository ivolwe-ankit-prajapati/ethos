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

import '../model/cart_model.dart';


class CartController extends GetxController{
  // final GlobalKey<FormState> cartFormKey = GlobalKey<FormState>();

  late TextEditingController emailController;
  var cart = <CartResponse>[].obs;
  List<dynamic> listOne = List.empty(growable : true).obs;
  var isCartLoading =0.obs;
  // late Dio _dio;
  late Dio _dio = Dio(BaseOptions(baseUrl:"http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/"));
  @override
  void onInit() {
    getCartList();
    super.onInit();
  }
  Future<void> getCartList() async {
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
    var response = await _dio.get('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/mobile/product/cartList?sessionId=&userId=$userId&lang=en',options: options);
    // ApiResponse responsedata = await Application.restApiService?.getApiCall(addressListUrl);
    print("cart list>> ");
    // debugPrint(response.data.toString());
    print(response.data['status']);
    if (response.statusCode == 200) {
      print(response.data['status']);
      if (response.data['status'] == true) {
        CartModel cartModel = CartModel.fromJson(response.data);
        listOne.assignAll(cartModel.response!);
        cart.assignAll(cartModel.response!);

        isCartLoading.value= 1;
      } else {
        isCartLoading.value= 2;
      }
    } else if (response.statusCode != 200) {
      print("Status.ERROR");
      isCartLoading.value=2;
    }
  }
  Future<void> updateCart(String productId,String quantity) async {
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
        "id": productId,
        "quantity": quantity,
      };
      var url = Uri.parse('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/product/addToCart');
      var response = await _dio.post('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/mobile/product/updateCart',options: options,data: data);


      if(response.statusCode == 200){
        ///data successfully
        // var result = jsonDecode(response.data.toString());
        print(response.data);

        // user_model =  User_Model.fromJson(result);
        Fluttertoast.showToast(
            msg: "Cart Updated",
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
  Future<void> deleteCartItem(String productId) async {
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

      // Map data = {
      //   "id": productId,
      //   "quantity": quantity,
      // };
      var url = Uri.parse('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/product/deleteToCart/$productId');
      var response = await _dio.get('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/mobile/product/deleteToCart/$productId',options: options);


      if(response.statusCode == 200){
        ///data successfully
        // var result = jsonDecode(response.data.toString());
        print(response.data);

        // user_model =  User_Model.fromJson(result);
        Fluttertoast.showToast(
            msg: "Removed from Cart",
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
}
