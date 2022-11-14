import 'dart:async';
import 'dart:convert';
import 'dart:ui';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'login_view.dart';

enum FormType { login, register }

class VerifyOTP extends StatefulWidget {
  String email;
  String password;
  String userName;
  String name;
  VerifyOTP(this.email, this.password, this.userName, this.name);
  @override
  _VerifyOTPState createState() =>  _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  bool _validate = false;
  late String name, email, mobile;
  bool isResponse = false;
  String registrationId = "";
  bool visible = false;
  bool _isLoginContinues = false;

  Future userLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('id');
    // Showing CircularProgressIndicator.
    // setState(() {
    //   visible = true;
    // });
    var url = Uri.parse('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/Auth/SignUpVerifyOtp');
    // var url =
    //     'http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/Auth/SignUpVerifyOtp';

    // Store all data with Param Name.

    Map data = {
      "id": id,
      "otp": _confirmPasswordFilter.text.toString() +
          _otp2.text.toString() +
          _otp3.text.toString() +
          _otp4.text.toString(),
    "lang":"en",
    };

    // Starting Web API Call.
    var response = await http.post(url, body: data);

    // Getting Server response into variable.

    var body = await json.decode(response.body);
    var message = jsonDecode(response.body);
    print(body['status'].toString());
    print(body);


    Future.delayed(Duration(seconds: 2)).then((value) {
      if (body['status'].toString() == "true") {
        prefs.setString('userid_org', body['id'].toString());
        prefs.setString('password_chat', widget.password);

        confirmationDialog();
      } else {

        Navigator.of(context).pop();
        Fluttertoast.showToast(
          // msg:
          // getTranslated(context, '${body['errorType'].toString()}'),
            msg:
            body['message'].toString(),
            toastLength:
            Toast.LENGTH_SHORT,
            backgroundColor:
            Colors.black54,
            textColor: Colors.white,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1);
      }
    });
  }

  Future resendotp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('id');
    // Showing CircularProgressIndicator.
    // setState(() {
    //   visible = true;
    // });

    // var url =
    //     'http://ec2-18-216-49-233.us-east-2.compute.amazonaws.com/api/Auth/resendOtpSignUp';

    // Store all data with Param Name.

    Map data = {
      "id": id,
      "lang": "en",
    };

    var url = Uri.parse('http://ec2-18-216-49-233.us-east-2.compute.amazonaws.com/api/Auth/resendOtpSignUp');

    // Starting Web API Call.
    var response = await http.post(url, body: data);

    // Getting Server response into variable.

    var body = await json.decode(response.body);
    var message = jsonDecode(response.body);

    print(body);
    try {
      if (body['status'] == true) {
//        otp = body["otp"];
//        prefs.setString('id',body['id'].toString() );
//        prefs.setString('otp',body['otp'].toString() );
//        prefs.setString('designation', body['designation']);
//        prefs.setString('phone', body['phone']);
//        prefs.setString('email', body['email']);
//        prefs.setString('doj', body['doj']);
//        prefs.setString('pincode', body['pincode']);
//        prefs.setString('state', body['state']);
//        prefs.setString('address', body['address']);
//        prefs.setString('image', body['image']);
//        prefs.setString('role', body['role']);
        //  prefs.setString('image',body['image'] );
        // prefs.setString('image',body['image'] );
        // Hiding the CircularProgressIndicator.
        // setState(() {
        //   visible = false;
        // });
        Fluttertoast.showToast(
            // msg: getTranslated(context, 'otp_sent_mail'),
            msg: "OTP sent on email",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            timeInSecForIosWeb: 1);
//        Fluttertoast.showToast(
//            msg: body['otp'].toString(),
//            toastLength: Toast.LENGTH_SHORT,
//            gravity: ToastGravity.CENTER,
//            timeInSecForIos: 1);
        // Navigate to Profile Screen & Sending Email to Next Screen.
//        print("Ankit"+mobile);
//        prefs.setBool('isLogin',true);

      } else if (body['status'] == false) {
//        otp = body["otp"];
//        prefs.setString('email',body['user']['email'].toString() );
//        prefs.setString('userRole',body['user']['userRole'].toString() );
//        prefs.setString('avtar',body['user']['avtar'].toString() );
//        prefs.setString('token',body['token'].toString() );
//        prefs.setString('id', body['id']);
//        prefs.setString('std_id', body['std_id']);
//        prefs.setString('name', body['name']);
//        prefs.setString('designation', body['designation']);
//        prefs.setString('phone', body['phone']);
//        prefs.setString('email', body['email']);
//        prefs.setString('doj', body['doj']);
//        prefs.setString('pincode', body['pincode']);
//        prefs.setString('state', body['state']);
//        prefs.setString('address', body['address']);
//        prefs.setString('image', body['image']);
//        prefs.setString('role', body['role']);
        //  prefs.setString('image',body['image'] );
        // prefs.setString('image',body['image'] );
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });

      } else if (response.statusCode == 401) {
        setState(() {
          visible = false;
        });

        Fluttertoast.showToast(
          msg: 'Email/Password Incorrect',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          timeInSecForIosWeb: 1,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
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



//
  FocusNode textSecondFocusNode =  FocusNode();
  FocusNode textthirdFocusNode =  FocusNode();
  FocusNode textfourthFocusNode =  FocusNode();
  final TextEditingController _otp2 =  TextEditingController();
  final TextEditingController _otp3 =  TextEditingController();
  final TextEditingController _otp4 =  TextEditingController();
  final TextEditingController _emailFilter =  TextEditingController();
  final TextEditingController _passwordFilter =  TextEditingController();
  final TextEditingController _confirmPasswordFilter =  TextEditingController();
  String _email = "";
  String _password = "";
  String _confirmPassword = "";

  FormType _form = FormType.login; // our default setting is to login, and we should switch to creating an account when the user chooses to



  String? validateEmail(String value) {
    if (value.length == 0) {
      return "Enter Email Address".tr;
    } else if (value.length == 0 ||
        !value.contains('@') ||
        !value.contains('.')) {
      return "Invalid email address".tr;
    } else {
      return null;
    }
  }

  late DateTime currentBackPressTime;

  Future<bool>? _onBackPressed() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginView()));
  }

  String? validatePassword(String value) {
    if (value.length == 0) {
      return "Password is required";
    } else {
      return null;
    }
  }

  Widget _formLogin(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
//
          Container(
            height: 10,
          ),

           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 45,
                height: 45,
                child:  TextFormField(
                  // inputFormatters: [ WhitelistingTextInputFormatter(RegExp("[0-9]")),],
                  maxLength: 1,
                  controller: _confirmPasswordFilter,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                  decoration:  InputDecoration(
                    counterText: '',
                    // labelText: 'OTP',
                    hoverColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black26, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black26, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0)),

                    hintStyle: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 15.0,
                        color: Colors.black),
                    fillColor: Colors.white,
                    focusColor: Colors.white,
                    labelStyle: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 15.0,
                        color: Colors.black),
                  ),
                  textAlign: TextAlign.center,
                  onChanged: (t) {
                    FocusScope.of(context).requestFocus(textSecondFocusNode);
                  },
                  // obscureText: false,
                  style: TextStyle(
                      fontFamily: 'Lato', fontSize: 15.0, color: Colors.black),
                  validator: (value) {
                    return validatePassword(value!);
                  },
                  onFieldSubmitted: (String val) {
                    _confirmPassword = val;
                  },
                ),
              ),
              Container(
                width: 45,
                height: 45,
                child:  TextFormField(
                  // inputFormatters: [ WhitelistingTextInputFormatter(RegExp("[0-9]")),],
                  focusNode: textSecondFocusNode,
                  maxLength: 1,
                  controller: _otp2,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                  decoration:  InputDecoration(
                    counterText: '',
                    // labelText: 'OTP',
                    hoverColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black26, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black26, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0)),
                    hintStyle: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 15.0,
                        color: Colors.black),
                    fillColor: Colors.white,
                    focusColor: Colors.white,
                    labelStyle: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 15.0,
                        color: Colors.black),
                  ),
                  onChanged: (t) {
                    FocusScope.of(context).requestFocus(textthirdFocusNode);
                  },
                  obscureText: false,
                  style: TextStyle(
                      fontFamily: 'Lato', fontSize: 15.0, color: Colors.black),
                  validator: (value) {
                    return validatePassword(value!);
                  },
                  textAlign: TextAlign.center,
                  onFieldSubmitted: (String val) {
                    _confirmPassword = val;
                  },
                ),
              ),
              Container(
                width: 45,
                height: 45,
                child:  TextFormField(
                  // inputFormatters: [ WhitelistingTextInputFormatter(RegExp("[0-9]")),],
                  focusNode: textthirdFocusNode,
                  maxLength: 1,
                  controller: _otp3,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                  decoration:  InputDecoration(
                    counterText: '',
                    // labelText: 'OTP',
                    hoverColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black26, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black26, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0)),
                    hintStyle: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 15.0,
                        color: Colors.black),
                    fillColor: Colors.white,
                    focusColor: Colors.white,
                    labelStyle: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 15.0,
                        color: Colors.black),
                  ),
                  obscureText: false,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Lato', fontSize: 15.0, color: Colors.black),
                  validator: (value) {
                    return validatePassword(value!);
                  },
                  onChanged: (t) {
                    FocusScope.of(context).requestFocus(textfourthFocusNode);
                  },
                  onFieldSubmitted: (String val) {
                    _confirmPassword = val;
                  },
                ),
              ),
              Container(
                width: 45,
                height: 45,
                child:  TextFormField(
                  // inputFormatters: [ WhitelistingTextInputFormatter(RegExp("[0-9]")),],
                  focusNode: textfourthFocusNode,
                  maxLength: 1,
                  controller: _otp4,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                  decoration:  InputDecoration(
                    counterText: '',
                    // labelText: 'OTP',
                    hoverColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black26, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black26, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0)),

                    fillColor: Colors.white,
                    focusColor: Colors.white,
                  ),
                  obscureText: false,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Lato', fontSize: 15.0, color: Colors.black),
                  validator: (value) {
                    return validatePassword(value!);
                  },
                  onSaved: (val) {
                    _confirmPassword = val.toString();
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
               Align(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 30.0, 0.0),
                  child: timerLeftArray != null
                      ? timerLeftArray[0] == "over"
                      ? Text.rich(
                    TextSpan(
                      // text:
                      //     '${getTranslated(context, 'didn’t_get_opt')} ',
                        children: <TextSpan>[
                          // TextSpan(
                          //   text:
                          //       '${getTranslated(context, 'resend_otp')} ',
                          //   style: TextStyle(color: Colors.black),
                          // )
                        ]),
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  )
                      : Text(
                    '${"Resend OTP".tr} In ' +
                                  timerLeftArray[0],textAlign: TextAlign.right,)
                      : Text(""),
                ),
                alignment: Alignment.bottomRight,
              ),
              timerLeftArray[0] == "over"
                  ? Padding(
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 30.0, 0.0),
                child: ElevatedButton(
                    // shape: RoundedRectangleBorder(
                    //     borderRadius:  BorderRadius.circular(40.0)),
                    // color: Color(0xff0B58A0),
                    child: timerLeftArray != null
                        ? timerLeftArray[0] == "over"
                        ? Text.rich(
                      TextSpan(children: <TextSpan>[
                        TextSpan(
                          text:
                          'Resend OTP'.tr,
                          style: TextStyle(color: Colors.white),
                        )
                      ]),
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    )
                        : Text(
                      '${"Resend OTP".tr} In ' +
                                  timerLeftArray[0],textAlign: TextAlign.right,)
                        : Text(""),
                    onPressed: () {
                      startTimerforOtpResend();
                      resendotp();
                    }),
              )
                  : SizedBox()
            ],
          ),
          Container(
            height: 10,
          ),
        ],
      ),
    );
  }

  int _counter = 0;
//  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
//  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =  FlutterLocalNotificationsPlugin();
  void startTimerforOtpResend() async {
    target = DateTime.now().add(Duration(seconds: 60));
    executeTimer();
  }

  @override
  void initState() {
    super.initState();
    startTimerforOtpResend();
  }

  void executeTimer() async {
    while (running) {
      setState(() {
        timeLeft = DateTime.now().isAfter(target)
            ? 'over'
            : target.difference(DateTime.now()).toString();
        timerLeftArray = timeLeft.split(".");
      });
      await Future.delayed(Duration(seconds: 1), () {});
    }
  }

  String timeLeft = "";
  var timerLeftArray;
  late DateTime target;
  bool running = true;
  GlobalKey<FormState> _key =  GlobalKey();
  @override
  Widget build(BuildContext context) {
    // print(timerLeftArray[0]);
    var size = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return
        // MaterialApp(
        //   home: Directionality(
        //     textDirection: almt ? TextDirection.ltr : TextDirection.rtl,
        //     child:
        GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus( FocusNode());
          },
          child: Scaffold(
              body: WillPopScope(
                onWillPop: null,
                child:  Container(
                    color: Colors.white,
                    child:  Stack(
                      children: <Widget>[
                        // Align(
                        //   alignment: FractionalOffset.bottomCenter,
                        //   child:  Image.asset(
                        //     'assets/images/forgot_back.png',
                        //     width: double.infinity,
                        //     height: MediaQuery.of(context).size.height / 1.8,
                        //     fit: BoxFit.fill,
                        //   ),
                        // ),
                        ListView(
                          shrinkWrap: true,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25, 30, 25, 0),
                              child:  Container(
                                child: ListView(
                                  children: <Widget>[
//
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20.0, 0, 20.0, 0.0),
                                      child: Align(
                                        child:  Text(
                                          'Sign Up'.tr,
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.black,
                                            fontSize: 28,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.left,
                                          textDirection: TextDirection.ltr,
                                        ),
                                        alignment: Alignment.topLeft,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20.0, 0, 20.0, 0.0),
                                      child: RichText(

                                          text: TextSpan(children: [
                                            WidgetSpan(
                                                child: Text(
                                                  'Verify OTP'.tr,

                                                  style: TextStyle(
                                                      fontSize: 11, fontFamily: 'Lato'),
                                                )),
//                                      almt
//                                          ? WidgetSpan(
//                                              child: Text(
//                                                '${getTranslated(context, 'email')} ',
//                                              style: TextStyle(
//                                                fontSize: 15,
//                                                fontFamily: 'Lato',
//                                              ),
//                                            ))
//                                          : Container(),
                                            WidgetSpan(
                                                child: Text(
                                                  widget.email,
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontFamily: 'Lato',
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold),
                                                ))
                                          ])),
                                    ),
//                                  Padding(
//                                    padding: const EdgeInsets.fromLTRB(
//                                        20.0, 0, 20.0, 0.0),
//                                    child: Row(
////                                      direction:Axis.horizontal,
//                                      children: [
//                                        Expanded(child: Text(
//                                          '${getTranslated(context, 'otp_receive_to')} ',
//
//                                          style: TextStyle(
//                                              fontSize: 15, fontFamily: 'Lato'),
//                                        ),),
//
//                                        Text(
//                                          widget.email,
//                                          style: TextStyle(
//                                              fontSize: 15,
//                                              fontFamily: 'Lato',
//                                              fontWeight: FontWeight.bold),
//                                        )
//
//                                      ],
//                                    ),
//                                  ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20.0, 0, 20.0, 0.0),
                                      child: Align(
                                        child:  Form(
                                          key: _key,
                                          // autovalidate: _validate,
                                          child: _formLogin(context),
                                        ),
                                      ),
                                    ),
//                               Align(
//                                child: InkWell(
//                                  onTap: () {
////                                    Navigator.push(
////                                      context,
////                                      MaterialPageRoute(
////                                          builder: (context) => ForgotScreen()),
////                                    );
//                                  },
//                                  child: Padding(
//                                    padding:
//                                    const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
//                                    child:  Text(
//                                      "Forgot Password?",
//                                      style: TextStyle(fontFamily: 'Poppins',
//                                          fontWeight: FontWeight.w700,
//                                          color: Colors.white,
//                                          fontSize: 12,
//
//                                          decoration: TextDecoration.underline),
//                                    ),
//                                  ),
//                                ),
//                                alignment: Alignment.bottomRight,
//                              ),
                                    SizedBox(
                                      height: 20,
                                    ),

                                    SizedBox(
                                      height: 20,
                                    ),

                                    SizedBox(
                                      height: 40,
                                    ),

//
                                  ],
                                  shrinkWrap: true,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            ),
//
                          ],
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8, top: 30.0, right: 12),
                            child: IconButton(
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  _onBackPressed();
                                  // _onWillPop(context);
                                }),
                          ),
                        ),
                        Positioned(
                          top: height * 0.62,
                          left: width * 0.7,
                          child: InkWell(
                            onTap: () {
//
                              FocusScope.of(context).requestFocus(FocusNode());
                              if (_key.currentState!.validate()) {
                                // No any error in validation
                                _key.currentState!.save();
                                userLogin();

//

                              } else {
                                Fluttertoast.showToast(
                                    msg:
                                    'Verify OTP'.tr,
                                    toastLength:
                                    Toast.LENGTH_SHORT,
                                    backgroundColor:
                                    Colors.black54,
                                    textColor: Colors.white,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1);

                              }
                            },
                            child: CircleAvatar(
                              backgroundColor: Color(0xff0B58A0),
                              radius: 40,
                              child: SvgPicture.asset(
                                  'assets/images/Arrow_left.svg'),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
              resizeToAvoidBottomInset: false),
        );
    //   ),
    // );
  }

  void confirmationDialog() {
    Timer timer = Timer(Duration(milliseconds: 3000), () {
      Navigator.of(context, rootNavigator: true).pop();
    });
    showGeneralDialog(
      transitionDuration: Duration(milliseconds: 500),
      barrierColor: Colors.black87,
      barrierLabel: '',
      barrierDismissible: true,
      context: context,
      pageBuilder: (ctx, anim1, anim2) =>  AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Registration successful!'.tr,
                  style: TextStyle(
                      fontFamily: 'Montserrat', fontSize: 22, color: Colors.white),
                ),
              ),
              // Spacer(),
              // Align(
              //   alignment: Alignment.center,
              //   child: Text(
              //     'successful',
              //     style: TextStyle(
              //         fontFamily: 'Montserrat',
              //         fontSize: 28,
              //         color: Color.fromRGBO(85, 217, 193, 1)),
              //   ),
              // ),
            ],
          ),

        ],
      ),
      transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
        filter:
            ImageFilter.blur(sigmaX: 4 * anim1.value, sigmaY: 4 * anim1.value),
        child: FadeTransition(
          child: child,
          opacity: anim1,
        ),
      ),
    ).then((value) {
      // dispose the timer in case something else has triggered the dismiss.
      timer.cancel();
      // timer = null;
      Navigator.pushReplacement(
          context, CupertinoPageRoute(builder: (context) => LoginView()));
    });
  }
}
