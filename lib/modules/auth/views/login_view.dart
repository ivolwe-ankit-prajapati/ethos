import 'package:ethos/modules/auth/ForgotPassword/ForgotPassword.dart';
import 'package:ethos/modules/auth/views/signup_view.dart';
import 'package:ethos/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart' as nb;

import '../../../Constants/Constants.dart';
import '../../landingpage/view/landingpage_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 0, left: 0, right: 0),
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: SizeConfig.screenHeight * 0.08, bottom: SizeConfig.screenHeight * 0.08),
                  child:Center(
                    child: SvgPicture.asset('assets/images/Logo.svg'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: textWidget('Hello!'.tr, 24, FontWeight.bold, 'Lato',
                      0xffDC4E41, '', false),
                ),
                SizedBox(
                  height: 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: textWidget('Login to Continue'.tr, 24, FontWeight.bold,
                      'Lato', 0xff000000, '', false),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.02,
                ),
                Form(
                    key: controller.loginFormKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    // autovalidate: _validate,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 24, right: 24, bottom: SizeConfig.screenHeight * 0.02),
                          child: nb.AppTextField(
                            controller: controller.emailController,
                            validator: (value) {
                              return controller.validateEmail(value!);
                            },
                            // focus: emailidfocus,
                            textFieldType: nb.TextFieldType.EMAIL,
                            decoration:
                            inputDecoration(context, hint: 'Email Id'.tr),
                            errorThisFieldRequired: 'field_Required',
                            // nextFocus: passwordfocus,
                          ).paddingBottom(16),
                        ),

                        Padding(
                          padding: EdgeInsets.only(left: 24, right: 24),
                          child: nb.AppTextField(
                            controller: controller.passwordController,
                            validator: (value) {
                              return controller.validatePassword(value!);
                            },
                            // onFieldSubmitted: (value) {
                            //   controller.password = value!;
                            // },
                            // focus: passwordfocus,
                            textFieldType: nb.TextFieldType.PASSWORD,
                            decoration:
                            inputDecoration(context, hint: 'Password'.tr),
                            errorThisFieldRequired: 'field_Required',
                            // nextFocus: professionfocus,
                          ).paddingBottom(16),
                        ),
                        Material(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(4),
                            splashColor: Color(0xff0864B1),
                            onTap: () {
                              Get.to(Forgotpassword());
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => Forgotpassword()));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  right: 24.0, bottom: SizeConfig.screenHeight * 0.04),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: textWidget(
                                    'Forgot Password?'.tr,
                                    12,
                                    FontWeight.normal,
                                    'Lato',
                                    0xff000000,
                                    '',
                                    true),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 24.0, right: 24, bottom: SizeConfig.screenHeight * 0.04),
                          child: Align(
                            alignment: Alignment.center,
                            child: Material(
                              child: InkWell(
                                borderRadius: BorderRadius.circular(10),
                                splashColor: Colors.grey,
                                onTap: () {
                                  controller.checkLogin();
                                  print(controller.toString());
                                  FocusScope.of(context).requestFocus(FocusNode());

                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             Onboardthree()));
                                  // userLogin();
                                },
                                child: Container(
                                  width: SizeConfig.screenWidth,
                                  alignment: Alignment.center,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Color(0xff0B58A0),
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(color: Colors.black)),
                                  child: textWidget(
                                      'Log In'.tr,
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
                        Padding(
                          padding: EdgeInsets.only(
                              left: 24, right: 24.0, bottom: SizeConfig.screenHeight * 0.04),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: textWidget(
                                    'Don’t have an account?'.tr,
                                    16,
                                    FontWeight.normal,
                                    'Lato',
                                    0xff000000,
                                    '',
                                    false),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Material(
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(4),
                                  splashColor: Color(0xff0864B1),
                                  onTap: () {
                                    Get.to(SignupView());
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => Signup()));
                                  },
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: textWidget(
                                        'Sign Up Now'.tr,
                                        16,
                                        FontWeight.bold,
                                        'Lato',
                                        0xff000000,
                                        '',
                                        false),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 24, right: 24.0, bottom: SizeConfig.screenHeight * 0.04),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: SizeConfig.screenWidth * 0.25,
                                color: Colors.black,
                                height: 1,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: textWidget(
                                    'Or Continue with'.tr,
                                    12,
                                    FontWeight.normal,
                                    'Lato',
                                    0xff000000,
                                    '',
                                    false),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: SizeConfig.screenWidth * 0.25,
                                color: Colors.black,
                                height: 1,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/images/fbicon.svg'),
                    SizedBox(
                      width: 30,
                    ),
                    SvgPicture.asset('assets/images/googleicon.svg')
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Material(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        splashColor: Colors.grey,
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => FrontPage()));
                          Get.off(LandingPage());
                        },
                        child: Container(
                          width: 130,
                          alignment: Alignment.center,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Color(0xffB9DFFF),
                              borderRadius: BorderRadius.circular(22),
                              border: Border.all(color: Colors.black)),
                          child: Text('Skip'.tr),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            // child: Form(
            //   key: controller.loginFormKey,
            //   autovalidateMode: AutovalidateMode.onUserInteraction,
            //   child: Column(
            //     children: [
            //       Image.asset(
            //         "images/app_logo_splash.png",
            //       ),
            //       SizedBox(
            //         height: 20,
            //       ),
            //       Text(
            //         "Welcome to Ripples Code",
            //         style: TextStyle(fontSize: 20, color: Colors.black87),
            //       ),
            //       SizedBox(
            //         height: 20,
            //       ),
            //       TextFormField(
            //         decoration: InputDecoration(
            //           border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(10),
            //           ),
            //           labelText: "Email",
            //           prefixIcon: Icon(Icons.email),
            //         ),
            //         keyboardType: TextInputType.emailAddress,
            //         controller: controller.emailController,
            //         onSaved: (value) {
            //           controller.email = value!;
            //         },
            //         validator: (value) {
            //           return controller.validateEmail(value!);
            //         },
            //       ),
            //       SizedBox(
            //         height: 16,
            //       ),
            //       TextFormField(
            //         decoration: InputDecoration(
            //           border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(10),
            //           ),
            //           labelText: "Password",
            //           prefixIcon: Icon(Icons.lock),
            //         ),
            //         keyboardType: TextInputType.visiblePassword,
            //         obscureText: true,
            //         controller: controller.passwordController,
            //         onSaved: (value) {
            //           controller.password = value!;
            //         },
            //         validator: (value) {
            //           return controller.validatePassword(value!);
            //         },
            //       ),
            //       SizedBox(
            //         height: 16,
            //       ),
            //       ConstrainedBox(
            //         constraints: BoxConstraints.tightFor(width: context.width),
            //         child: ElevatedButton(
            //           style: ButtonStyle(
            //             shape: MaterialStateProperty.all(
            //               RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(20),
            //               ),
            //             ),
            //             backgroundColor:
            //                 MaterialStateProperty.all(Colors.deepPurpleAccent),
            //             padding: MaterialStateProperty.all(EdgeInsets.all(14)),
            //           ),
            //           child: Text(
            //             "Login",
            //             style: TextStyle(fontSize: 14, color: Colors.white),
            //           ),
            //           onPressed: () {
            //             controller.checkLogin();
            //           },
            //         ),
            //       ),
            //       SizedBox(
            //         height: 16,
            //       ),
            //     ],
            //   ),
            // ),
          ),
        ),
      ),
    );
  }
}
