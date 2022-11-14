import 'dart:convert';


import 'package:ethos/modules/auth/views/login_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as JSON;

import '../../../Constants/Constants.dart';

class Forgotpassword extends StatefulWidget {
  @override
  _ForgotpasswordState createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  TextEditingController emailid = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController profession = TextEditingController();

  TextEditingController mobile = TextEditingController();

  TextEditingController age = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController linkedin = TextEditingController();

  TextEditingController facebook = TextEditingController();

  TextEditingController offer = TextEditingController();

  FocusNode emailidfocus = FocusNode();

  FocusNode passwordfocus = FocusNode();

  FocusNode professionfocus = FocusNode();

  FocusNode mobilefocus = FocusNode();

  FocusNode agefocus = FocusNode();

  FocusNode emailfocus = FocusNode();

  FocusNode linkedinfocus = FocusNode();

  FocusNode facebookfocus = FocusNode();

  FocusNode offerfocus = FocusNode();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _validate = false;
  // String name, email, mobile;
  bool isResponse = false;
  String registrationId = "";
  bool visible = false;
  String userid_forgot = '';
  Future forgotpassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('id');
    // Showing CircularProgressIndicator.
    print("Called");
    setState(() {
      visible = true;
    });

    var url =
        'http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/Auth/forgotPassword';

    // Store all data with Param Name.

    Map data = {
      "email": emailid.text.toString().toLowerCase(),
      "lang": "en",
    };

    // Starting Web API Call.
    var response = await http.post(Uri.parse(url), body: data);

    // Getting Server response into variable.

    var body = await json.decode(response.body);
    var message = jsonDecode(response.body);

    try {
      if (body['status'] == true) {
//
        prefs.setString('userid_forgot', body['userId'].toString());
        userid_forgot = body['userId'];
        // print(userid_forgot);
        setState(() {
          visible = false;
        });
        Fluttertoast.showToast(
            msg: body['message'] == 'null'
                ? "Email Id not Registered"
                : 'OTP sent successfully on given email id',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            timeInSecForIosWeb: 1);
        // Fluttertoast.showToast(
        //     msg: body['OTP'].toString() == 'null'
        //         ? getTranslated(context, 'invalid_email_id')
        //         : body['OTP'].toString(),
        //     toastLength: Toast.LENGTH_SHORT,
        //     backgroundColor: Colors.black54,
        //     textColor: Colors.white,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1);
//
        Get.to(LoginView());
      } else if (body['status'] == false) {
//
        setState(() {
          visible = false;
        });
        Fluttertoast.showToast(
            msg: body['OTP'].toString() == 'null'
                ? "Email Id not Registered"
                : body['OTP'].toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            timeInSecForIosWeb: 1);
      } else if (body['status_code'] == 401) {
        setState(() {
          visible = false;
        });
        Fluttertoast.showToast(
          msg: "Email Id not Registered",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg:"Email Id not Registered",
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
      );

      throw Exception(e);
    }
    // If the Response Message is Matched.
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: height * 0.08, bottom: height * 0.08),
                  child: Center(
                    child: SvgPicture.asset(
                        'assets/images/Logo.svg'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: textWidget('Forgot Password?'.tr, 24,
                      FontWeight.normal, 'Lato', 0xff000000, '', false),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24),
                  child: textWidget(
                      'Enter your email address and we will send you instructions on how to reset your password.'.tr,
                      12,
                      FontWeight.normal,
                      'Lato',
                      0xff000000,
                      '',
                      false),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 24, right: 24, bottom: height * 0.02),
                          child: AppTextField(
                            controller: emailid,
                            focus: emailidfocus,
                            textFieldType: TextFieldType.EMAIL,
                            decoration:
                                inputDecoration(context, hint: 'Email Id'.tr),
                            errorThisFieldRequired: 'Enter Email Address'.tr,
                            // nextFocus: passwordfocus,
                          ).paddingBottom(16),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: 24.0, bottom: height * 0.04),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: textWidget(
                                'Resend Email'.tr,
                                12,
                                FontWeight.normal,
                                'Lato',
                                0xff000000,
                                '',
                                true),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 24.0, right: 24, bottom: height * 0.04),
                          child: Align(
                            alignment: Alignment.center,
                            child: Material(
                              child: InkWell(
                                borderRadius: BorderRadius.circular(10),
                                splashColor: Colors.grey,
                                onTap: () {
                                  FocusScope.of(context).requestFocus(FocusNode());
                                  if (formKey.currentState!.validate()) {
                                    // No any error in validation

                                    formKey.currentState!.save();

//p
                                    forgotpassword();
                                  } else {}

                                },
                                child: Container(
                                  width: width,
                                  alignment: Alignment.center,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Color(0xff0B58A0),
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(color: Colors.black)),
                                  child: textWidget(
                                      'Send Request'.tr,
                                      16,
                                      FontWeight.bold,
                                      'Lato',
                                      0xffFFFFFF,
                                      '',
                                      false),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(bottom: 18.0),
          //   child: Align(
          //     alignment: Alignment.bottomCenter,
          //     child: Material(
          //       child: InkWell(
          //         borderRadius: BorderRadius.circular(10),
          //         splashColor: Colors.grey,
          //         onTap: () {
          //           Navigator.push(context,
          //               MaterialPageRoute(builder: (context) => FrontPage()));
          //         },
          //         child: Container(
          //           width: 130,
          //           alignment: Alignment.center,
          //           height: 40,
          //           decoration: BoxDecoration(
          //               color: Color(0xffB9DFFF),
          //               borderRadius: BorderRadius.circular(22),
          //               border: Border.all(color: Colors.black)),
          //           child: Text('Skip'),
          //         ),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
