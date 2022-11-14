import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ethos/modules/categories/model/category_model.dart';
import 'package:ethos/modules/homepage/model/cotegory_model.dart';
import 'package:ethos/modules/my_profile/model/myprofile_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:get/state_manager.dart';

class CategoriesController extends GetxController {

  var isCategoriesLoading =0.obs;
  var categoryData = <CategoriesResponse>[].obs;
  // List productList =[];
  late Dio _dio = Dio(BaseOptions(baseUrl:"http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/"));


  Future<void> getCategories() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String? userId = prefs.getString('userId');

    print(token);
    Options options = Options(
      headers: {
        "Content-Type": "application/json",
      },
    );
    var response = await _dio.get('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/mobile/product/categoryListGroup',options: options);
    // ApiResponse responsedata = await Application.restApiService?.getApiCall(addressListUrl);
    print("categories details>> ");
    // debugPrint(response.data.toString());

    // print(response.data['status']);
    if (response.statusCode == 200) {
      // print(response.data['response']);
      if (response.data['status'] == true) {
        CategoriesModel categoriesModelModel = CategoriesModel.fromJson(response.data);
        categoryData.assignAll(categoriesModelModel.response!);

        isCategoriesLoading.value= 1;
      } else {
        isCategoriesLoading.value= 2;
      }
    } else if (response.statusCode != 200) {
      print("Status.ERROR");
      isCategoriesLoading.value=2;
    }
  }

  @override
  void onInit() {
    // fetchProfile();
    getCategories();
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
