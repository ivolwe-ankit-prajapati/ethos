import 'package:ethos/modules/auth/views/login_view.dart';
import 'package:ethos/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:nb_utils/nb_utils.dart' as nb;
import '../../../Constants/Constants.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  SignupController _signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [

            Container(
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
                        child: SvgPicture.asset(
                            'assets/images/Logo.svg'),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: textWidget('Sign Up Now'.tr, 24, FontWeight.bold,
                          'Lato', 0xff000000, '', false),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.02,
                    ),
                    Form(
                        key: controller.signupFormKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 24, right: 24, bottom: SizeConfig.screenHeight * 0.02),
                                  child: nb.AppTextField(
                                    controller: controller.firstNameController,
                                    validator: (value) {
                                      return controller.validateFirstName(value!);
                                    },
                                    textFieldType: nb.TextFieldType.NAME,
                                    decoration: inputDecoration(context, hint: '*${'First Name'.tr}'),
                                    errorThisFieldRequired: 'First name required'.tr,
                                    nextFocus: controller.lnamefocus,
                                  ).paddingBottom(16),
                                ),),
                                Expanded(child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 24, right: 24, bottom: SizeConfig.screenHeight * 0.02),
                                  child: nb.AppTextField(
                                    controller: controller.lastNameController,
                                    validator: (value) {
                                      return controller.validateLastName(value!);
                                    },
                                    focus: controller.lnamefocus,
                                    textFieldType: nb.TextFieldType.NAME,
                                    decoration: inputDecoration(context, hint: '*${'Last Name'.tr}'),
                                    errorThisFieldRequired: 'Last name required'.tr,
                                    nextFocus: controller.emailfocus,
                                  ).paddingBottom(16),
                                ),),
                              ],
                            ),

                            Padding(
                              padding: EdgeInsets.only(
                                  left: 24, right: 24, bottom: SizeConfig.screenHeight * 0.02),
                              child: nb.AppTextField(
                                controller: controller.emailController,
                                validator: (value) {
                                  return controller.validateEmail(value!);
                                },
                                focus: controller.emailidfocus,
                                textFieldType: nb.TextFieldType.EMAIL,
                                decoration:
                                inputDecoration(context, hint: '*${'Email Id'.tr}'),
                                errorThisFieldRequired: 'field_Required',
                                nextFocus: controller.passwordfocus,
                              ).paddingBottom(16),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 24, right: 24),
                              child: nb.AppTextField(
                                controller: controller.passwordController,
                                validator: (value) {
                                  return controller.validatePassword(value!);
                                },
                                focus: controller.passwordfocus,
                                textFieldType: nb.TextFieldType.PASSWORD,
                                decoration:
                                inputDecoration(context, hint: '*${'Password'.tr} '),
                                errorThisFieldRequired: 'field_Required',
                                nextFocus: controller.passwordconffocus,
                              ).paddingBottom(16),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 24, right: 24),
                              child: nb.AppTextField(
                                controller: controller.confirmPasswordController,
                                validator: (value) {
                                  return controller.validatePassword(value!);
                                },
                                focus: controller.passwordconffocus,
                                textFieldType: nb.TextFieldType.PASSWORD,
                                decoration: inputDecoration(context,
                                    hint: '*${'Confirm Password'.tr} '),
                                errorThisFieldRequired: 'field_Required',
                                // nextFocus: professionfocus,
                              ).paddingBottom(16),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 24.0, bottom: SizeConfig.screenHeight * 0.04),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: textWidget(
                                    'Fields marked with (*) are mandatory'.tr,
                                    12,
                                    FontWeight.normal,
                                    'Lato',
                                    0xff000000,
                                    '',
                                    false),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 24.0, bottom: SizeConfig.screenHeight * 0.04,right: 24.0,),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: IntlPhoneField(
                                  controller: controller.mobileController,
                                  decoration: InputDecoration(
                                    labelText: 'Mobile Number'.tr,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(),
                                    ),
                                  ),
                                  onChanged: (phone) {
                                    print(phone.completeNumber);
                                    controller.phone=phone.completeNumber;
                                  },
                                  onCountryChanged: (country) {
                                    print('Country changed to: ' + country.name);
                                  },
                                ),
                              ),
                            ),

                            // Padding(
                            //   padding: EdgeInsets.only(
                            //       left: 24.0, bottom: SizeConfig.screenHeight * 0.04),
                            //   child: Align(
                            //     alignment: Alignment.centerLeft,
                            //     child: InternationalPhoneInput(
                            //       onPhoneNumberChange: controller.onPhoneNumberChange,
                            //       initialPhoneNumber: controller.phoneNumber,
                            //       initialSelection: controller.phoneIsoCode,
                            //
                            //       // enabledCountries: ['+233', '+1','+91'],
                            //       labelText: "Phone Number",
                            //
                            //     ),
                            //   ),
                            // ),
                            // Padding(
                            //   padding: EdgeInsets.only(
                            //       left: 24.0, bottom: SizeConfig.screenHeight * 0.04),
                            //   child: Align(
                            //     alignment: Alignment.centerLeft,
                            //     child:InternationalPhoneInput(
                            //       decoration: InputDecoration.collapsed(hintText: '(123) 123-1234'),
                            //       onPhoneNumberChange: onPhoneNumberChange,
                            //       initialPhoneNumber: phoneNumber,
                            //       initialSelection: phoneIsoCode,
                            //       enabledCountries: ['+233', '+1','+91'],
                            //       showCountryCodes: false,
                            //       showCountryFlags: true,
                            //     ),
                            //   ),
                            // ),
                            // Padding(
                            //   padding: EdgeInsets.only(
                            //       left: 24.0, bottom: SizeConfig.screenHeight * 0.04),
                            //   child: Align(
                            //     alignment: Alignment.centerLeft,
                            //     child:InternationalPhoneInputText(
                            //       onValidPhoneNumber: onValidPhoneNumber,
                            //     ),
                            //   ),
                            // ),


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
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             Onboardthree()));
                                      FocusScope.of(context).requestFocus(FocusNode());
                                      // print(password.text.toString());
                                      // print(emailid.text.toString());
                                      // print(fname.text.toString()+" "+lname.text.toString());
                                      // print(phoneIsoCode+phoneNumber);
                                      // print(interPhoneNumber);

                                      controller.checkSignup();
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
                                          'Sign Up'.tr,
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
                                        'Already have an account ?'.tr,
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
                                  Material(
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(4),
                                      splashColor: Color(0xff0864B1),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => LoginView()));
                                      },
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: textWidget(
                                            'Log In'.tr,
                                            12,
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
                      height: SizeConfig.screenHeight * 0.02,
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: controller.isDataLoading(),
                child: CircularProgressIndicator()
            )
          ],
        )
      ),
    );
  }
}
