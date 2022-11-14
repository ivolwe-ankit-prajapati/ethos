import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:ethos/modules/auth/views/login_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:splashscreen/splashscreen.dart';
//import 'package:progress_dialog/progress_dialog.dart';

//import 'home_page.dart';
////import 'login_page.dart';
//void main() => runApp(MainScreen());
//Future main() async {
// // SharedPreferences prefs = await SharedPreferences.getInstance();
//  //var email = prefs.getString('email');
//  // print("hello "+email);
//  runApp(new MaterialApp(
///    home: new SplashScreen(),
//    routes: <String, WidgetBuilder>{
//
//      '/MyApp1': (BuildContext context) =>  SplashScreen()
//    },
//  ));
//}

enum FormType { login, register }

class Forgotpassword_verify extends StatefulWidget {
  String userid_forgot;
  String email;
  Forgotpassword_verify(
    this.userid_forgot,
    this.email,
  );
  @override
  _Forgotpassword_verifyState createState() =>
      new _Forgotpassword_verifyState();
}



class _Forgotpassword_verifyState extends State<Forgotpassword_verify> {
  bool _validate = false;
  String? name, email, mobile;
  bool isResponse = false;
  String registrationId = "";
  bool visible = false;

  Future userLogin() async {
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;
    });

    var url =
        'http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/mobile/Auth/verifyOtp';

    // Store all data with Param Name.

    Map data = {
      "id": widget.userid_forgot,
      "otp": _confirmPasswordFilter.text.toString() +
          _otp2.text.toString() +
          _otp3.text.toString() +
          _otp4.text.toString(),
    };

    // Starting Web API Call.
    var response = await http.post(Uri.parse(url), body: data);

    // Getting Server response into variable.

    var body = await json.decode(response.body);
    var message = jsonDecode(response.body);
    print("Done");
    // print(id);
    print(_confirmPasswordFilter.text.toString());

    print("ffff" + message.toString());

    Future.delayed(Duration(seconds: 2)).then((onvalue) {
      // pr.update(
      //   progressWidget: Container(
      //       padding: EdgeInsets.all(8.0),
      //       child: CircularProgressIndicator(
      //           valueColor: AlwaysStoppedAnimation<Color>(Color(0xff55D9C1)))),
      //   maxProgress: 100.0,
      //   progressTextStyle: TextStyle(
      //       color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
      //   messageTextStyle: TextStyle(
      //       color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
      // );

      Future.delayed(Duration(seconds: 2)).then((value) {
        if (body['status']) {
          // Navigator.pushReplacement(
          //   context,
          //   CupertinoPageRoute(
          //       builder: (context) => ResetPassword(widget.userid_forgot)),
          // );
        } else {
          // pr.hide();
          Fluttertoast.showToast(
              msg: "Invalid OTP",
              toastLength: Toast.LENGTH_SHORT,
              backgroundColor: Colors.black54,
              textColor: Colors.white,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1);
        }
      });
    });
    // If the Response Message is Matched.
  }

  Future<bool>? _onBackPressed() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginView()));
  }

  Future resendotp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('userid_forgot');
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;
    });

    var url =
        'http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/mobile/Auth/resendOtpForgot';

    // Store all data with Param Name.

    Map data = {
      "userId": id,
    };

    // Starting Web API Call.
    var response = await http.post(Uri.parse(url), body: data);

    // Getting Server response into variable.

    var body = await json.decode(response.body);
    var message = jsonDecode(response.body);
    print("Done");
    print(id);
    print(_confirmPasswordFilter.text.toString());

    print("ffff" + message.toString());

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
        setState(() {
          visible = false;
        });
        Fluttertoast.showToast(
            msg: "OTP Sent",
            toastLength: Toast.LENGTH_SHORT,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            gravity: ToastGravity.CENTER,
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
        // Fluttertoast.showToast(
        //     msg: body['OTP'],
        //     toastLength: Toast.LENGTH_SHORT,
        //     backgroundColor: Colors.black54,
        //     textColor: Colors.white,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1);
      } else if (body['status_code'] == 401) {
        setState(() {
          visible = false;
        });

        Fluttertoast.showToast(
          msg: 'emailPassIncrrect',
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
      );
      throw Exception(e);
    }
    // If the Response Message is Matched.
  }

//

  FocusNode textSecondFocusNode = new FocusNode();
  FocusNode textthirdFocusNode = new FocusNode();
  FocusNode textfourthFocusNode = new FocusNode();
  final TextEditingController _otp2 = new TextEditingController();
  final TextEditingController _otp3 = new TextEditingController();
  final TextEditingController _otp4 = new TextEditingController();
  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  final TextEditingController _confirmPasswordFilter =
      new TextEditingController();
  String _email = "";
  String _password = "";
  String _confirmPassword = "";

  FormType _form = FormType
      .login; // our default setting is to login, and we should switch to creating an account when the user chooses to

  TextStyle style1 =
      TextStyle(fontFamily: 'Poppins', fontSize: 15.0, color: Colors.white);
  TextStyle style2 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 15.0,
    fontWeight: FontWeight.bold,
    color: Color(0xff0D314D),
    decoration: TextDecoration.underline,
  );
  TextStyle style3 = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 15.0,
      fontStyle: FontStyle.normal,
      color: Color(0xff0D314D),
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.bold);

  String? validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return '';
    } else {
      return null;
    }
  }

  late DateTime currentBackPressTime;

  String? validatePassword(String value) {
    if (value.length <= 0) {
      return '';
    } else {
      return null;
    }
  }

  Widget _formLogin(BuildContext context) {
    return Container(
      child: new Column(
        children: <Widget>[
//
          Container(
            height: 10,
          ),
//           new Container(
//             child: new TextFormField(
//               controller: _confirmPasswordFilter,
//               keyboardType: TextInputType.number,
//               cursorColor: Colors.white,
//               decoration: new InputDecoration(
//                 labelText: 'OTP',
//                 hoverColor: Colors.white,
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(color: Colors.grey, width: 2.0),
//                   borderRadius: BorderRadius.circular(5.0),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                     borderSide:
//                         const BorderSide(color: Colors.black26, width: 2.0),
//                     borderRadius: BorderRadius.circular(10.0)),
// //                suffixIcon: Icon(
// //                  Icons.vpn_key,
// //                  color: Colors.grey,
// //                ),
//                 hintStyle: TextStyle(
//                     fontFamily: 'Poppins', fontSize: 15.0, color: Colors.black),
//                 fillColor: Colors.white,
//                 focusColor: Colors.white,
//                 labelStyle: TextStyle(
//                     fontFamily: 'Poppins', fontSize: 15.0, color: Colors.black),
//               ),
//               obscureText: true,
//               style: TextStyle(
//                   fontFamily: 'Poppins', fontSize: 15.0, color: Colors.black),
//               validator: validatePassword,
//               onSaved: (String val) {
//                 _confirmPassword = val;
//               },
//             ),
//           ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 45,
                height: 45,
                child: new TextFormField(
                  maxLength: 1,
                  controller: _confirmPasswordFilter,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                  decoration: new InputDecoration(
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
                child: new TextFormField(
                  focusNode: textSecondFocusNode,
                  maxLength: 1,
                  controller: _otp2,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                  decoration: new InputDecoration(
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
                  onFieldSubmitted: (String val) {
                    _confirmPassword = val;
                  },

                  textAlign: TextAlign.center,

                ),
              ),
              Container(
                width: 45,
                height: 45,
                child: new TextFormField(
                  focusNode: textthirdFocusNode,
                  maxLength: 1,
                  controller: _otp3,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                  decoration: new InputDecoration(
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
                  onFieldSubmitted: (String val) {
                    _confirmPassword = val;
                  },

                  onChanged: (t) {
                    FocusScope.of(context).requestFocus(textfourthFocusNode);
                  },

                ),
              ),
              Container(
                width: 45,
                height: 45,
                child: new TextFormField(
                  focusNode: textfourthFocusNode,
                  maxLength: 1,
                  controller: _otp4,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                  decoration: new InputDecoration(
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
                  onFieldSubmitted: (String val) {
                    _confirmPassword = val;
                  },

                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              new Align(
                child: Padding(
                  padding: almt
                      ? EdgeInsets.fromLTRB(20.0, 10.0, 30.0, 0.0)
                      : EdgeInsets.fromLTRB(30.0, 10.0, 20.0, 0.0),
                  child: timerLeftArray != null
                      ? timerLeftArray[0] == "over"
                          ? Text.rich(
                              TextSpan(
                                  // text:
                                  //     '${getTranslated(context, 'didn’t_get_opt')} ',
                                  children: <TextSpan>[
                                    // TextSpan(
                                    //   text:
                                    //       '${getTranslated(context, 'Resend OTP')} ',
                                    //   style: TextStyle(color: Colors.black),
                                    // )
                                  ]),
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            )
                          : Text(
                              '${'You can request resend OTP after'.tr} \n' +
                                  timerLeftArray[0],
                              textAlign:
                                  almt ? TextAlign.right : TextAlign.left,
                            )
                      : Text(""),
                ),
                alignment: Alignment.bottomRight,
              ),
              timerLeftArray[0] == "over"
                  ? Padding(
                      padding: almt
                          ? EdgeInsets.fromLTRB(20.0, 10.0, 30.0, 0.0)
                          : EdgeInsets.fromLTRB(30.0, 10.0, 20.0, 0.0),
                      child: ElevatedButton(
                          // shape: RoundedRectangleBorder(
                          //     borderRadius: new BorderRadius.circular(40.0)),
                          // color: Color(0xff0864B1),
                          child: timerLeftArray != null
                              ? timerLeftArray[0] == "over"
                                  ? Text.rich(
                                      TextSpan(children: <TextSpan>[
                                        TextSpan(
                                          text:
                                          "Resend OTP".tr,
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ]),
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    )
                                  : Text(
                                      '${'You can request resend OTP after'.tr} \n' +
                                          timerLeftArray[0],
                                      textAlign: almt
                                          ? TextAlign.right
                                          : TextAlign.left,
                                    )
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
//  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
  void startTimerforOtpResend() async {
    target = DateTime.now().add(Duration(seconds: 60));
    executeTimer();
  }

  bool almt = true;
  Future checkalmt() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? lang = prefs.getString('langkey');
    if (lang != null) {
      if (lang == 'english') {
        print(lang);
        almt = true;
      } else {
        print(lang + "f");
        almt = false;
      }
    } else {
      almt = true;
    }
    print(almt);
  }

  @override
  void initState() {
    super.initState();
    checkalmt();
    startTimerforOtpResend();
//
  }

//
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
  GlobalKey<FormState> _key = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    // print(timerLeftArray[0]);
    var size = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: WillPopScope(
            onWillPop: null,
            child: new Container(
                color: Colors.white,
                child: new Stack(
                  children: <Widget>[
                    // Align(
                    //   alignment: FractionalOffset.bottomCenter,
                    //   child: new Image.asset(
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
                          child: new Container(
                            child: ListView(
                              children: <Widget>[
//
                                SizedBox(
                                  height: 40,
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      20.0, 0, 20.0, 0.0),
                                  child: new Text(
                                    'Forgot Password?'.tr,
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.black,
                                      fontSize: 28,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    // textAlign: TextAlign.left,
                                    // textDirection: TextDirection.ltr,
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
                                                  fontSize: 13, fontFamily: 'Lato'),
                                            )),
//                                  WidgetSpan(
//                                      child: Text(
//                                    '${getTranslated(context, 'email')} ',
//                                    style: TextStyle(
//                                      fontSize: 15,
//                                      fontFamily: 'Lato',
//                                    ),
//                                  )),
                                        WidgetSpan(
                                            child: Text(
                                              '${widget.email}',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: 'Lato',
                                                  fontWeight: FontWeight.bold),
                                            ))
                                      ])),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      20.0, 0, 20.0, 0.0),
                                  child: Align(
                                    child: new Form(
                                      key: _key,
                                      // autovalidate: _validate,
                                      child: _formLogin(context),
                                    ),
                                  ),
                                ),
//                              new Align(
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
//                                    child: new Text(
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
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding:
                        const EdgeInsets.only(left: 12, top: 50.0, right: 12),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Transform.rotate(
                            angle: 185.35,
                            child: SvgPicture.asset(
                              'assets/images/Arrow_left.svg',
                              color: Colors.black,
                            ),
                          ),
                        ),
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
                          backgroundColor: Color(0xff0864B1),
                          radius: 40,
                          child: Icon(
                            Icons.arrow_forward,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ),
        resizeToAvoidBottomInset: false);
  }
}
