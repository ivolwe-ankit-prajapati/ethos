import 'dart:async';
import 'dart:convert';
import 'dart:ui';


import 'package:ethos/modules/auth/views/login_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

class ResetPassword extends StatefulWidget {
  String userid_forgot;
  ResetPassword(this.userid_forgot);
  @override
  _ResetPasswordState createState() => new _ResetPasswordState();
}



class _ResetPasswordState extends State<ResetPassword> {
  bool _validate = false;
  String? name, email, mobile;
  bool isResponse = false;
  String registrationId = "";
  bool visible = false;
  String _newpassword = "";
  String _confirmpassword = "";
  String _testpass = '';
  bool obscurenew = true;
  bool obscureconf = true;
  Future userLogin(String confirmpassword) async {
    var url =
        'http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/Auth/resetPassword';

    // Store all data with Param Name.
    print(confirmpassword);
    Map data = {
      "password": confirmpassword,
      "id": widget.userid_forgot,
    };

    // Starting Web API Call.
    var response = await http.post(Uri.parse(url), body: data);

    // Getting Server response into variable.

    var body = await json.decode(response.body);
    var message = jsonDecode(response.body);

    print("ffff" + message.toString());
    try {
      if (body['status'] == true) {
//

        Future.delayed(Duration(seconds: 2)).then((onvalue) {


          Future.delayed(Duration(seconds: 2)).then((value) {
            if (response.statusCode == 200) {
              confirmationDialog();

            } else {

              Navigator.of(context).pop();
            }
          });
        });
        setState(() {
          visible = false;
        });
        Fluttertoast.showToast(
            msg: 'Password Changed Successfully',
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1);


//
        Navigator.pushReplacement(
            context, CupertinoPageRoute(builder: (context) => LoginView()));
      } else if (body['status'] == false) {
//
        setState(() {
          visible = false;
        });
        Fluttertoast.showToast(
            msg: 'Password Changed Successfully',
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
          msg: 'Error',
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
        );
      }
    } catch (e) {


      throw Exception(e);
    }
    // If the Response Message is Matched.
  }

  Future<bool>? _onBackPressed() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginView()));
  }

//
  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Password is required";
    } else {
      return null;
    }
  }

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

//
  GlobalKey<FormState> _key = new GlobalKey();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {

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
      FocusScope.of(context).requestFocus(new FocusNode());
    },

        child:Scaffold(
            body: WillPopScope(
              onWillPop: null,
              child: new Container(
                  color: Colors.white,
                  child: new Stack(
                    children: <Widget>[
                      Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: new Image.asset(
                          'assets/images/forgot_back.png',
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height / 1.8,
                          fit: BoxFit.fill,
                        ),
                      ),
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
                                    child:  new Text(
                                      'New Password',
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
                                        child: Container(
                                          child: new Column(
                                            children: <Widget>[
//
                                              Container(
                                                height: 10,
                                              ),
                                              new Container(
                                                child: new TextFormField(
                                                  // keyboardType: TextInputType.number,
                                                  cursorColor: Colors.black,
                                                  decoration:
                                                      new InputDecoration(
                                                        errorMaxLines: 3,
                                                    labelText:
                                                        'New Password',
                                                    hoverColor: Colors.black,
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color:
                                                                  Colors.grey,
                                                              width: 2.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                    ),
                                                    enabledBorder: OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .black26,
                                                                width: 2.0),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    10.0)),
                                                    suffixIcon: IconButton(
                                                        icon: Icon(
                                                          Icons.remove_red_eye,
                                                          color: obscurenew
                                                              ? Colors.black
                                                              : Colors.blue,
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            obscurenew =
                                                                !obscurenew;
                                                          });
                                                        }),
                                                    hintStyle: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 15.0,
                                                        color: Colors.black),
                                                    fillColor: Colors.white,
                                                    focusColor: Colors.white,
                                                    labelStyle: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 15.0,
                                                        color: Colors.black),
                                                  ),
                                                  obscureText: obscurenew,
                                                  style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 15.0,
                                                      color: Colors.black),

                                                  validator: (value) {
                                                    return validatePassword(value!);
                                                  },

                                                  onFieldSubmitted: (String val) {
                                                    _testpass = val;
                                                  },

                                                  onChanged: (val) {
                                                    _testpass = val;
                                                  },

                                                ),
                                              ),
                                              SizedBox(
                                                height: 40,
                                              ),
                                              new Container(
                                                child: new TextFormField(
                                                  // keyboardType: TextInputType.number,
                                                  cursorColor: Colors.black,
                                                  decoration:
                                                      new InputDecoration(
                                                        errorMaxLines: 3,
                                                    labelText: 'Confirm Password',
                                                    hoverColor: Colors.black,
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color:
                                                                  Colors.grey,
                                                              width: 2.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                    ),
                                                    enabledBorder: OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .black26,
                                                                width: 2.0),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    10.0)),
                                                    suffixIcon: IconButton(
                                                        icon: Icon(
                                                          Icons.remove_red_eye,
                                                          color: obscureconf
                                                              ? Colors.black
                                                              : Colors.blue,
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            obscureconf =
                                                                !obscureconf;
                                                          });
                                                        }),
                                                    hintStyle: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 15.0,
                                                        color: Colors.black),
                                                    fillColor: Colors.white,
                                                    focusColor: Colors.white,
                                                    labelStyle: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 15.0,
                                                        color: Colors.black),
                                                  ),
                                                  obscureText: obscureconf,
                                                  style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 15.0,
                                                      color: Colors.black),
                                                  validator: (value) {
                                                    return validatePassword(value!);
                                                  },

                                                  onFieldSubmitted: (String val) {
                                                    _confirmpassword = val;
                                                  },

                                                ),
                                              ),
                                              Container(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
//
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
                          padding: const EdgeInsets.only(
                              left: 12, top: 50.0, right: 12),
                          child: InkWell(
                            onTap: () {
                              _onBackPressed();
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
                              _key.currentState!.save();
                              if (_newpassword.toString() == _confirmpassword.toString()) {

                                userLogin(_confirmpassword);
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Password and Confirm password should be same",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    backgroundColor: Colors.black54,
                                    textColor: Colors.white,
                                    timeInSecForIosWeb: 1);
                              }

                            }
                          },
                          child: CircleAvatar(
                            backgroundColor: Color.fromRGBO(242, 131, 34, 1),
                            radius: 40,
                            child: SvgPicture.asset(
                                'assets/images/Arrow_left.svg'),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            resizeToAvoidBottomInset: false));
    // ),
    // );
  }

  void confirmationDialog() {
    Timer? timer = Timer(Duration(milliseconds: 3000), () {
      Navigator.of(context, rootNavigator: true).pop();
    });
    showGeneralDialog(
      transitionDuration: Duration(milliseconds: 500),
      barrierColor: Colors.black87,
      barrierLabel: '',
      barrierDismissible: true,
      context: context,
      pageBuilder: (ctx, anim1, anim2) => new AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Align(
            alignment: Alignment.center,
            child: Text(
              'Password Reset',
              style: TextStyle(
                  fontFamily: 'Montserrat', fontSize: 22, color: Colors.white),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Successfull',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 28,
                  color: Color.fromRGBO(85, 217, 193, 1)),
            ),
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
      timer?.cancel();
      timer = null;
      Navigator.pushReplacement(
          context, CupertinoPageRoute(builder: (context) => LoginView()));
    });
  }
}
