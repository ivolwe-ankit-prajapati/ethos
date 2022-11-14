import 'dart:convert';

import 'package:ethos/application.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../../config/const/api_path.dart';
import '../../../../services/rest_api_service/rest_api_service.dart';
import '../model/address_list_model.dart';
import 'package:dio/dio.dart';


class AddressListController extends GetxController{

  var addressList = <AddressListResult>[].obs;

  var addreslist =0.obs;
  // late Dio _dio;
  late Dio _dio = Dio(BaseOptions(baseUrl:"http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/"));
  @override
  void onInit() {
    getAddressList();
    super.onInit();
  }
  Future<void> getAddressList() async {
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
    var response = await _dio.get('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/user/addressList',options: options);
    // ApiResponse responsedata = await Application.restApiService?.getApiCall(addressListUrl);
    print("address list>> ");
    debugPrint(response.data.toString());
    if (response.statusCode == 200) {
      if (response.data['status'] == true) {
        AddressListModel addressListModel = AddressListModel.fromJson(response.data);
        addressList.assignAll(addressListModel.response!);
        // print(favourite_model.status.toString());
        addreslist.value= 1;
      } else {
        addreslist.value= 2;
      }
    } else if (response.statusCode != 200) {
      print("Status.ERROR");
      addreslist.value=2;
    }
  }
}
