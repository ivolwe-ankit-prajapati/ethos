import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ethos/modules/my_profile/model/myprofile_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../remote_services/remote_services.dart';
import 'package:get/state_manager.dart';

class MyProfileController extends GetxController {
  var isDataLoading = false.obs;
  var isLoading = true.obs;
  var isProfileLoading =0.obs;
  var profileData = <ProfileModel>[].obs;
  // List productList =[];
  late Dio _dio = Dio(BaseOptions(baseUrl:"http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/"));

  final user = Rxn<ProfileModel>();

  Future<void> fetchProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    // String? token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InByYWthc2hAaXZvbHdlLmNvbSIsImlkIjoiNjI0ODIyMmM0NzlkZDQ2YTE5ZTM5ODE2IiwiaWF0IjoxNjU4MTI4MzIyLCJleHAiOjE2NTgyMTQ3MjJ9.uhQy82xvD1DdQlPXcCks1zAa-bX-haAgBJrxUIx_PQg";
    var url = Uri.parse('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/user/myProfile');
    var response = await http.get(url, headers: {"Content-Type": "application/json","Authorization": "Bearer $token"});
    // final response = await http
    //     .get(Uri.parse('https://jsonplaceholder.typicode.com/photos/3'));

    if (response.statusCode == 200) {
      ProfileModel _profileModel = ProfileModel.fromJson(jsonDecode(response.body));

      profileData.add(
        ProfileModel(
          response: _profileModel.response,
          status: _profileModel.status,
        ),
      );

      isLoading.value = false;
      update();
    } else {
      Get.snackbar('Error Loading data!',
          'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
    }
  }

  getApi() async {

    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      isDataLoading(true);
      String? token = prefs.getString("token");
      // String? token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InByYWthc2hAaXZvbHdlLmNvbSIsImlkIjoiNjI0ODIyMmM0NzlkZDQ2YTE5ZTM5ODE2IiwiaWF0IjoxNjU3NjA5NjM4LCJleHAiOjE2NTc2OTYwMzh9.2-FiO_TLdafOFLwW_9ud6rNRLZMhLjDsOxZ3SX18TdQ";
      var url = Uri.parse('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/user/myProfile');
      http.Response response = await http.get(url, headers: {"Content-Type": "application/json","Authorization": "Bearer $token"});

      if(response.statusCode == 200){
        ///data successfully
        var result = jsonDecode(response.body);
        // ProfileModel reheatingListModel = ProfileModel.fromJson(result);
        // reheatingList.assignAll(reheatingListModel.result);
        print(result);


        // Navigator.pushReplacement(
        //     context,
        //     CupertinoPageRoute(
        //         builder: (context) => VerifyOTP(
        //             emailid.text.toString(),
        //             password.text.toString(),
        //             userId,
        //             fname.text.toString()+" "+lname.text.toString())));
        // user_model =  User_Model.fromJson(result);
      }else{
        ///error
      }
    }catch(e){
      // log('Error while getting data is $e');
      print('Error while getting data is $e');
    }finally{
      isDataLoading(false);
    }
  }

  Future erase() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.getKeys();
    // String lang = preferences.getString('langkey');
    // for (String key in preferences.getKeys()) {
    //   if (key != "lat" &&
    //       key != "long" &&
    //       key != "langbool" && key != "langkey" &&
    //       key != "seen"
    //       ) {
    //     preferences.remove(key);
    //   }
    // }
    await preferences.clear();
  }

  Future<void> getMyProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String? userId = prefs.getString('userId');

    print(token);
    Options options = Options(
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    var response = await _dio.get('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/user/myProfile',options: options);
    // ApiResponse responsedata = await Application.restApiService?.getApiCall(addressListUrl);
    print("myprofile details>> ");
    // debugPrint(response.data.toString());

    // print(response.data['status']);
    if (response.statusCode == 200) {
      // print(response.data['response']);
      if (response.data['status'] == true) {
        ProfileModel profileModel = ProfileModel.fromJson(response.data);
        user.value=profileModel;
        isProfileLoading.value= 1;
      } else {
        isProfileLoading.value= 2;
      }
    } else if (response.statusCode != 200) {
      print("Status.ERROR");
      isProfileLoading.value=2;
    }
  }


  @override
  void onInit() {
    // fetchProfile();

    getMyProfile();
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
