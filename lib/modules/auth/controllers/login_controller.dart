import 'dart:convert';
import 'dart:io';
import 'package:ethos/modules/landingpage/view/landingpage_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  late TextEditingController emailController, passwordController;
  var email = '';
  var password = '';
  // User_Model? user_model;
  var isDataLoading = false.obs;
//   Future userLogin() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     // Showing CircularProgressIndicator.
//     // setState(() {
//     //   visible = true;
//     // });
//
//     var url =
//         'http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/Auth/login';
//
//     // Store all data with Param Name.
//     FormData formData;
//     formData = new FormData.fromMap({
//       "email": emailid.text.toString(),
//       "password": password.text.toString(),
//       "deviceId": "",
//       "deviceType": Platform.isIOS ? '1' : '2'
//     });
//     Map data =       {
//       "email": emailid.text.toString(),
//       "password": password.text.toString(),
//       "deviceId": "",
//       "deviceType": Platform.isIOS ? '1' : '2'
//     };
//     // device_token == '' ? '' : device_token
//     // print("Ankit" + device_token);
//     // Starting Web API Call.
//     var response = await http.post(url, body: data);
//
//     // Getting Server response into variable.
//
//     var body = await json.decode(response.body);
//     var message = jsonDecode(response.body);
//     // print(body['user']['userName']);
//
//     print("ffff" + message.toString());
//     print('DONE');
//     try {
//       if (body['status'] == true) {
// //        otp = body["otp"];
//         prefs.setString('loginId', body['user']['userId'].toString());
//         // prefs.setString('firstName', body['user']['firstName'].toString());
//         // prefs.setString('middleName', body['user']['middleName'].toString());
//         // prefs.setString('LastName', body['user']['LastName'].toString());
//         // prefs.setString('email', body['user']['email'].toString());
//         prefs.setString('token', body['token'].toString());
//         // await Application.storageService.saveDataToDisk("token",body['token'].toString());
//         // prefs.setString('profilePic', body['user']['profilePic'].toString());
//         // prefs.setString('token', body['token'].toString());
//
//         // Navigator.pushReplacement(
//         //     context, CupertinoPageRoute(builder: (context) => FrontPage()));
//         Fluttertoast.showToast(
//             msg: 'login_success',
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.CENTER,
//             backgroundColor: Colors.black54,
//             textColor: Colors.white,
//             timeInSecForIosWeb: 1);
//         prefs.setBool('isLogin', true);
//         prefs.setBool('isWatch', true);
//
//
//         // Navigate to Profile Screen & Sending Email to Next Screen.
// //        print("Ankit"+mobile);
//
//         // print(prefs.getString('email_home'));
//
//       } else if (body['status'] == false) {
// //        otp = body["otp"];
// //        prefs.setString('id', body['id']);
// //        prefs.setString('std_id', body['std_id']);
// //        prefs.setString('name', body['name']);
// //        prefs.setString('designation', body['designation']);
// //        prefs.setString('phone', body['phone']);
// //        prefs.setString('email', body['email']);
// //        prefs.setString('doj', body['doj']);
// //        prefs.setString('pincode', body['pincode']);
// //        prefs.setString('state', body['state']);
// //        prefs.setString('address', body['address']);
// //        prefs.setString('image', body['image']);
// //        prefs.setString('role', body['role']);
//         //  prefs.setString('image',body['image'] );
//         // prefs.setString('image',body['image'] );
//         // Hiding the CircularProgressIndicator.
//         // setState(() {
//         //   visible = false;
//         // });
//         Fluttertoast.showToast(
//             msg: "Email/Password Incorrect",
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.CENTER,
//             backgroundColor: Colors.black54,
//             textColor: Colors.white,
//             timeInSecForIosWeb: 1);
//         // Navigate to Profile Screen & Sending Email to Next Screen.
// //        print("Ankit"+mobile);
// //        prefs.setBool('isLogin',true);
// //        Navigator.pushReplacement(
// //            context, CupertinoPageRoute(builder: (context) => Homepage()));
//       } else if (body['status_code'] == 401) {
//         // If Email o
//         // r Password did not Matched.
//         // Hiding the CircularProgressIndicator.
//         // setState(() {
//         //   visible = false;
//         // });
//
//         Fluttertoast.showToast(
//           msg: 'emailPassIncrrect',
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.CENTER,
//           backgroundColor: Colors.black54,
//           textColor: Colors.white,
//           timeInSecForIosWeb: 1,
//         );
//
//         // Showing Alert Dialog with Response JSON Message.
// //      showDialog(
// //        context: context,
// //        builder: (BuildContext context) {
// //          return AlertDialog(
// //            title: new Text(message),
// //            actions: <Widget>[
// //              FlatButton(
// //                child: new Text("OK"),
// //                onPressed: () {
// //                  Navigator.of(context).pop();
// //                },
// //              ),
// //            ],
// //          );
// //        },
// //      );
//       }
//     } catch (e) {
// //      Fluttertoast.showToast(
// //        msg: e.toString(),
// //        toastLength: Toast.LENGTH_SHORT,
// //        gravity: ToastGravity.CENTER,
// //        timeInSecForIosWeb: 1,
// //      );
//       throw Exception(e);
//     }
//     // If the Response Message is Matched.
//   }

  getApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try{
      isDataLoading(true);
      Map data = {
        "email": emailController.text.toString(),
        "password": passwordController.text.toString(),
        "deviceId": "",
        "deviceType": Platform.isIOS ? '1' : '2'
      };
      var url = Uri.parse('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/Auth/login');
      http.Response response = await http.post(
          url,
          body: data
      );
      if(response.statusCode == 200){
        ///data successfully

        var result = jsonDecode(response.body);
        print(result);
        prefs.setString('token', result['token'].toString());
        prefs.setString('userId', result["user"]['userId'].toString());
        prefs.setString('firstName', result["user"]['firstName'].toString());
        prefs.setString('lastName', result["user"]['lastName'].toString());
        prefs.setString('emailId', result["user"]['emailId'].toString());
        prefs.setBool("isLogin", true);
        // user_model =  User_Model.fromJson(result);
        Fluttertoast.showToast(
            msg: result['message'].toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            timeInSecForIosWeb: 1);
        Get.to(LandingPage());
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

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // emailController.dispose();
    // passwordController.dispose();
  }

  String? validateEmail(String value) {
    if (value.length == 0) {
      return "Please enter email address".tr;
    } else if (value.length == 0 ||
        !value.contains('@') ||
        !value.contains('.')) {
      return "Invalid email address".tr;
    } else {
      return null;
    }
  }

  String? validatePassword(String value) {
    if (value.length == 0) {
      return "Password is required".tr;
    } else {
      return null;
    }
  }


  void checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    else
      {
        loginFormKey.currentState!.save();
        getApi();
      }



  }
}
