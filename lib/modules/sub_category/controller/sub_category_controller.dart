

import 'package:dio/dio.dart';
import 'package:ethos/modules/homepage/model/productlist_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../product/model/product_detail_model.dart';



class SubCategoryController extends GetxController {
  SubCategoryController (this.category,this.subCategory);
  // ProductDetailModel? productDetailModel;
  var category;
  var subCategory;

  var productList = <ProductListResponse>[].obs;
  ProductDetailModel? productDetailModel;

  var isSearched =false.obs;
  var isProductListLoading =0.obs;
  var cartItemCount =0.obs;
  var wishListItemCount =0.obs;
  // late Dio _dio;
  late Dio _dio = Dio(BaseOptions(baseUrl:"http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/"));



  Future<void> getProductList(String category,String subCategory) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String? userId = prefs.getString('userId');
    // var formdata = {"business_id": id,"date": "",};

    Options options = Options(
      // contentType: 'application/json',
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    // var response;
    var response = await _dio.get('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/mobile/product/productList?searchtext=&userID=$userId&lang=en&cate=$category&sortBy=&subCate=$subCategory&action=&pageNo=1&size=50',options: options);
    // if(searchText =="")
    // {
    //   response = await _dio.get('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/mobile/product/productList?searchtext=&userID=$userId&lang=en&cate=&sortBy=&subCate=&action=&pageNo=1&size=15',options: options);
    // }
    // else{
    //   response = await _dio.get('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/mobile/product/productList?searchtext=$searchText&userID=$userId&lang=en&cate=&sortBy=&subCate=&action=&pageNo=1&size=15',options: options);
    // }
    // ApiResponse responsedata = await Application.restApiService?.getApiCall(addressListUrl);
    // print(userId);
    print("product list>> ");
    debugPrint(response.data.toString());
    // log('data: ${response.data.toString()}');
    if (response.statusCode == 200) {
      if (response.data['status'] == true) {
        ProductListModel productListModel = ProductListModel.fromJson(response.data);
        productList.assignAll(productListModel.response!);

        isProductListLoading.value= 1;
      } else {
        isProductListLoading.value= 2;
      }
    } else if (response.statusCode != 200) {
      print("Status.ERROR");
      isProductListLoading.value=3;
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


  @override
  void onInit() {
    super.onInit();

    getProductList(category,subCategory);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
  }




}
