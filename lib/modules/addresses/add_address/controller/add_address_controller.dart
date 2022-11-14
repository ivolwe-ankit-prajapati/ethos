// import 'dart:convert';
// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// class AddAddressController extends GetxController {
//   final GlobalKey<FormState> addAddressFormKey = GlobalKey<FormState>();
//   late Dio _dio = Dio(BaseOptions(baseUrl:"http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/"));
//   late TextEditingController addressLineOne, passwordController,confirmPasswordController,mobileController,firstNameController,lastNameController ;
//
//   late String otp,userId;
//   var email = '';
//   var password = '';
//   var phone = '';
//   FocusNode emailidfocus = FocusNode();
//
//   FocusNode passwordfocus = FocusNode();
//
//   FocusNode fnamefocus = FocusNode();
//   FocusNode lnamefocus = FocusNode();
//
//   FocusNode passwordconffocus = FocusNode();
//
//   FocusNode agefocus = FocusNode();
//
//   FocusNode emailfocus = FocusNode();
//
//   FocusNode linkedinfocus = FocusNode();
//
//   FocusNode facebookfocus = FocusNode();
//
//   FocusNode offerfocus = FocusNode();
//   // User_Model? user_model;
//   var isDataLoading = false.obs;
// //   Future userLogin() async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     // Showing CircularProgressIndicator.
// //     // setState(() {
// //     //   visible = true;
// //     // });
// //
// //     var url =
// //         'http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/Auth/login';
// //
// //     // Store all data with Param Name.
// //     FormData formData;
// //     formData = new FormData.fromMap({
// //       "email": emailid.text.toString(),
// //       "password": password.text.toString(),
// //       "deviceId": "",
// //       "deviceType": Platform.isIOS ? '1' : '2'
// //     });
// //     Map data =       {
// //       "email": emailid.text.toString(),
// //       "password": password.text.toString(),
// //       "deviceId": "",
// //       "deviceType": Platform.isIOS ? '1' : '2'
// //     };
// //     // device_token == '' ? '' : device_token
// //     // print("Ankit" + device_token);
// //     // Starting Web API Call.
// //     var response = await http.post(url, body: data);
// //
// //     // Getting Server response into variable.
// //
// //     var body = await json.decode(response.body);
// //     var message = jsonDecode(response.body);
// //     // print(body['user']['userName']);
// //
// //     print("ffff" + message.toString());
// //     print('DONE');
// //     try {
// //       if (body['status'] == true) {
// // //        otp = body["otp"];
// //         prefs.setString('loginId', body['user']['userId'].toString());
// //         // prefs.setString('firstName', body['user']['firstName'].toString());
// //         // prefs.setString('middleName', body['user']['middleName'].toString());
// //         // prefs.setString('LastName', body['user']['LastName'].toString());
// //         // prefs.setString('email', body['user']['email'].toString());
// //         prefs.setString('token', body['token'].toString());
// //         // await Application.storageService.saveDataToDisk("token",body['token'].toString());
// //         // prefs.setString('profilePic', body['user']['profilePic'].toString());
// //         // prefs.setString('token', body['token'].toString());
// //
// //         // Navigator.pushReplacement(
// //         //     context, CupertinoPageRoute(builder: (context) => FrontPage()));
// //         Fluttertoast.showToast(
// //             msg: 'login_success',
// //             toastLength: Toast.LENGTH_SHORT,
// //             gravity: ToastGravity.CENTER,
// //             backgroundColor: Colors.black54,
// //             textColor: Colors.white,
// //             timeInSecForIosWeb: 1);
// //         prefs.setBool('isLogin', true);
// //         prefs.setBool('isWatch', true);
// //
// //
// //         // Navigate to Profile Screen & Sending Email to Next Screen.
// // //        print("Ankit"+mobile);
// //
// //         // print(prefs.getString('email_home'));
// //
// //       } else if (body['status'] == false) {
// // //        otp = body["otp"];
// // //        prefs.setString('id', body['id']);
// // //        prefs.setString('std_id', body['std_id']);
// // //        prefs.setString('name', body['name']);
// // //        prefs.setString('designation', body['designation']);
// // //        prefs.setString('phone', body['phone']);
// // //        prefs.setString('email', body['email']);
// // //        prefs.setString('doj', body['doj']);
// // //        prefs.setString('pincode', body['pincode']);
// // //        prefs.setString('state', body['state']);
// // //        prefs.setString('address', body['address']);
// // //        prefs.setString('image', body['image']);
// // //        prefs.setString('role', body['role']);
// //         //  prefs.setString('image',body['image'] );
// //         // prefs.setString('image',body['image'] );
// //         // Hiding the CircularProgressIndicator.
// //         // setState(() {
// //         //   visible = false;
// //         // });
// //         Fluttertoast.showToast(
// //             msg: "Email/Password Incorrect",
// //             toastLength: Toast.LENGTH_SHORT,
// //             gravity: ToastGravity.CENTER,
// //             backgroundColor: Colors.black54,
// //             textColor: Colors.white,
// //             timeInSecForIosWeb: 1);
// //         // Navigate to Profile Screen & Sending Email to Next Screen.
// // //        print("Ankit"+mobile);
// // //        prefs.setBool('isLogin',true);
// // //        Navigator.pushReplacement(
// // //            context, CupertinoPageRoute(builder: (context) => Homepage()));
// //       } else if (body['status_code'] == 401) {
// //         // If Email o
// //         // r Password did not Matched.
// //         // Hiding the CircularProgressIndicator.
// //         // setState(() {
// //         //   visible = false;
// //         // });
// //
// //         Fluttertoast.showToast(
// //           msg: 'emailPassIncrrect',
// //           toastLength: Toast.LENGTH_SHORT,
// //           gravity: ToastGravity.CENTER,
// //           backgroundColor: Colors.black54,
// //           textColor: Colors.white,
// //           timeInSecForIosWeb: 1,
// //         );
// //
// //         // Showing Alert Dialog with Response JSON Message.
// // //      showDialog(
// // //        context: context,
// // //        builder: (BuildContext context) {
// // //          return AlertDialog(
// // //            title: new Text(message),
// // //            actions: <Widget>[
// // //              FlatButton(
// // //                child: new Text("OK"),
// // //                onPressed: () {
// // //                  Navigator.of(context).pop();
// // //                },
// // //              ),
// // //            ],
// // //          );
// // //        },
// // //      );
// //       }
// //     } catch (e) {
// // //      Fluttertoast.showToast(
// // //        msg: e.toString(),
// // //        toastLength: Toast.LENGTH_SHORT,
// // //        gravity: ToastGravity.CENTER,
// // //        timeInSecForIosWeb: 1,
// // //      );
// //       throw Exception(e);
// //     }
// //     // If the Response Message is Matched.
// //   }
//
//   getApi() async {
//     try{
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       isDataLoading(true);
//       Map data ={
//         "firstName": firstNameController.text.toString(),
//         "middleName": "",
//         "LastName": lastNameController.text.toString(),
//         "email":emailController.text.toString(),
//         "phone": {
//           "number": "",
//           "internationalNumber": "",
//           "nationalNumber": "",
//           "e164Number": phone.toString(),
//           "countryCode": "",
//           "dialCode": ""
//         },
//         "password": passwordController.text.toString()
//       };
//
//       var bod = json.encode(data);
//       // var url = Uri.parse('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/Auth/mobileaddAddress');
//       // http.Response response = await http.post(url, headers: {"Content-Type": "application/json"},body: bod);
//       Options options = Options(
//         // contentType: 'application/json',
//         headers: {
//           "Content-Type": "application/json"
//         },
//       );
//       var response = await _dio.post('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/Auth/mobileaddAddress',options: options,data: bod);
//
//       if(response.statusCode == 200){
//         ///data successfully
//
//         var result = response.data;
//         print(result["message"]);
//         if(result["status"]==false)
//         {
//           Fluttertoast.showToast(
//               msg: result["message"],
//               toastLength: Toast.LENGTH_SHORT,
//               gravity: ToastGravity.CENTER,
//               backgroundColor: Colors.black54,
//               textColor: Colors.white,
//               timeInSecForIosWeb: 1);
//         }
//         else {
//           userId = result["id"];
//           prefs.setString('id', result['id'].toString());
//           Fluttertoast.showToast(
//               msg: 'OTP sent on your email id',
//               toastLength: Toast.LENGTH_SHORT,
//               gravity: ToastGravity.CENTER,
//               backgroundColor: Colors.black54,
//               textColor: Colors.white,
//               timeInSecForIosWeb: 1);
//           // Get.to(() =>
//           //     VerifyOTP(
//           //         emailController.text.toString(),
//           //         passwordController.text.toString(),
//           //         userId,
//           //         "${firstNameController.text.toString()} ${lastNameController
//           //             .text.toString()}"));
//         }
//
//       }else{
//         ///error
//       }
//     }catch(e){
//       // log('Error while getting data is $e');
//       print('Error while getting data is $e');
//     }finally{
//       isDataLoading(false);
//     }
//   }
//
//   @override
//   void onInit() {
//     super.onInit();
//     emailController = TextEditingController();
//     passwordController = TextEditingController();
//     confirmPasswordController = TextEditingController();
//     mobileController = TextEditingController();
//     firstNameController = TextEditingController();
//     lastNameController = TextEditingController();
//   }
//
//   @override
//   void onReady() {
//     super.onReady();
//   }
//
//   @override
//   void onClose() {
//     emailController.dispose();
//     passwordController.dispose();
//     confirmPasswordController.dispose();
//     mobileController.dispose();
//     firstNameController.dispose();
//     lastNameController.dispose();
//   }
//
//   late String phoneNumber;
//   late String phoneIsoCode;
//   late String interPhoneNumber;
//   bool visible = false;
//   String confirmedNumber = '';
//   String? validateEmail(String value) {
//     if (value.length == 0) {
//       return "Please enter email address".tr;
//     } else if (value.length == 0 ||
//         !value.contains('@') ||
//         !value.contains('.')) {
//       return "Invalid email address".tr;
//     } else {
//       return null;
//     }
//   }
//
//   String? validatePassword(String value) {
//     if (value.length < 6) {
//       return "Password is required".tr;
//     } else {
//       return null;
//     }
//   }
//
//   String? validateFirstName(String value) {
//     if (value.length == 0) {
//       return "Firstname is required".tr;
//     } else {
//       return null;
//     }
//   }
//   String? validateLastName(String value) {
//     if (value.length == 0) {
//       return "Lastname is required".tr;
//     } else {
//       return null;
//     }
//   }
//
//
//   void onPhoneNumberChange(
//       String number, String internationalizedPhoneNumber, String isoCode) {
//     print(number);
//     phoneNumber = number;
//     phoneIsoCode = isoCode;
//     interPhoneNumber = internationalizedPhoneNumber;
//     // print(phoneNumber);
//     // print(phoneIsoCode);
//     // print(internationalizedPhoneNumber);
//   }
//
//   onValidPhoneNumber(
//       String number, String internationalizedPhoneNumber, String isoCode) {
//     visible = true;
//     confirmedNumber = internationalizedPhoneNumber;
//   }
//
//   void checkaddAddress() {
//     final isValid = addAddressFormKey.currentState!.validate();
//     if (!isValid) {
//       return;
//     }
//     else
//     {
//       addAddressFormKey.currentState!.save();
//       print(mobileController.text.toString());
//       print(phone);
//       if(passwordController.text.toString()==confirmPasswordController.text.toString()) {
//         getApi();
//       }
//       else{
//         Fluttertoast.showToast(
//             msg: 'Password mismatch'.tr,
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.CENTER,
//             backgroundColor: Colors.black54,
//             textColor: Colors.white,
//             timeInSecForIosWeb: 1);
//       }
//     }
//   }
// }
