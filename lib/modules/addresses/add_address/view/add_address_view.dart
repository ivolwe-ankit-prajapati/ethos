import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as JSON;
import 'package:nb_utils/nb_utils.dart' as nb;

import '../../../../Constants/Constants.dart';

class AddAddressView extends StatefulWidget {
  @override
  _AddAddressViewState createState() => _AddAddressViewState();
}

class _AddAddressViewState extends State<AddAddressView> {
  String? firstName, lastName, addressLine, phoneNumber,
      countryName,stateName,cityName,zipCode,countryCode,
      country,state,city;
  bool visible=false;
  late Dio _dio = Dio(BaseOptions(baseUrl:"http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/"));
  String? countryDropdownValue,stateDropdownValue,cityDropdownValue;
  List countryData = [];
  List stateData = [];
  List cityData = [];
  Future<String> getCountryList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Showing CircularProgressIndicator.
    bool visible = false;

    var url = 'http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/user/countryList';
    String? token = prefs.getString('token');
// state_key - Delhi

    var response = await http.get(Uri.parse(url));
    // var res = await http.get(Uri.encodeFull(url));
    var resBody = json.decode(response.body);

    // var resBody1 = resBody['Response'];

    setState(() {
      countryData = resBody['response'];
    });

    print(resBody);

    return "Sucess";
  }
  Future<String> getStateList(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Showing CircularProgressIndicator.
    bool visible = false;

    var url = 'http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/user/stateList/$id';
    String? token = prefs.getString('token');
// state_key - Delhi

    var response = await http.get(Uri.parse(url));
    // var res = await http.get(Uri.encodeFull(url));
    var resBody = json.decode(response.body);

    // var resBody1 = resBody['Response'];

    setState(() {
      stateData = resBody['response'];
    });

    print(resBody);

    return "Sucess";
  }
  Future<String> getCityList(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Showing CircularProgressIndicator.
    bool visible = false;

    var url = 'http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/user/cityList/$id';
    String? token = prefs.getString('token');
// state_key - Delhi

    var response = await http.get(Uri.parse(url));
    // var res = await http.get(Uri.encodeFull(url));
    var resBody = json.decode(response.body);

    // var resBody1 = resBody['Response'];

    setState(() {
      cityData = resBody['response'];
    });

    print(resBody);

    return "Sucess";
  }


  Future addAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Showing CircularProgressIndicator.
    String? token = prefs.getString('token');
    setState(() {
      visible = true;
    });

    var url = 'http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/user/addressList';

    Map data =       {
      "address": addressLineController.text.toString(),
      "addressType": "2",
      "city": cityDropdownValue.toString(),
      "country": countryDropdownValue.toString(),
      "state": stateDropdownValue.toString(),
      "name": fname.text.toString(),
      "phone": mobile.text.toString(),
      "zipCode": zipcodebill.text.toString(),
    };

    var bod = json.encode(data);
    Options options = Options(
      // contentType: 'application/json',
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    var response = await _dio.post('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/user/addAddress',
        options: options,data: bod);

    if(response.statusCode == 200){
      ///data successfully

      var result = response.data;
      print(result["message"]);
      if(result["status"]==false)
      {
        Fluttertoast.showToast(
            msg: result["message"],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            timeInSecForIosWeb: 1);
      }
      else {

        Fluttertoast.showToast(
            msg: 'Address Added Successfully',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            timeInSecForIosWeb: 1);

      }

    }else{
      ///error
    }
  }

  TextEditingController fname = TextEditingController();

  TextEditingController lname = TextEditingController();

  TextEditingController emailid = TextEditingController();

  TextEditingController mobile = TextEditingController();

  TextEditingController address = TextEditingController();

  // TextEditingController city = TextEditingController();

  TextEditingController zipcodeController = TextEditingController();

  // TextEditingController country = TextEditingController();

  // TextEditingController state = TextEditingController();

  TextEditingController addressLineController = TextEditingController();

  TextEditingController citybill = TextEditingController();

  TextEditingController zipcodebill = TextEditingController();

  TextEditingController countrybill = TextEditingController();

  TextEditingController statebill = TextEditingController();
  TextEditingController password = TextEditingController();

  FocusNode fnamefocus = FocusNode();

  FocusNode lnamefocus = FocusNode();

  FocusNode emailidfocus = FocusNode();

  FocusNode mobilefocus = FocusNode();

  FocusNode addressfocus = FocusNode();

  FocusNode cityfocus = FocusNode();

  FocusNode zipfocus = FocusNode();

  FocusNode countryfocus = FocusNode();

  FocusNode zipbillfocus = FocusNode();

  FocusNode countrybillfocus = FocusNode();

  FocusNode statefocus = FocusNode();

  FocusNode addressbillfocus = FocusNode();

  FocusNode citybillfocus = FocusNode();

  FocusNode statebillfocus = FocusNode();
  FocusNode passwordfocus = FocusNode();
  bool iscollect = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCountryList();
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
              children: [

                Padding(
                  padding: EdgeInsets.only(
                      left: 24.0, top: height * 0.05, bottom: height * 0.03),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.arrow_back_ios),
                            textWidget('Add Address'.tr, 24, FontWeight.bold,
                                'Lato', 0xff000000, '', false),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 24.0),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/editicon.svg',
                                height: 16,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // SizedBox(
                //   height: 10,
                // ),

                Form(
                  key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 21,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 24, right: 24, bottom: height * 0.0001),
                            child: AppTextField(
                              controller: fname,
                              focus: fnamefocus,
                              // validator: (value) {
                              //   if (value!.isEmpty) {
                              //     return 'Enter a valid name!';
                              //   }
                              //   return null;
                              // },
                              textFieldType: TextFieldType.NAME,
                              decoration: inputDecoration(context,
                                  hint: 'First Name'.tr),
                              errorThisFieldRequired: 'First Name'.tr,
                              nextFocus: lnamefocus,
                            ).paddingBottom(16),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 24, right: 24, bottom: height * 0.0001),
                            child: AppTextField(
                                controller: lname,
                                focus: lnamefocus,
                                textFieldType: TextFieldType.NAME,
                                decoration: inputDecoration(context,
                                    hint: 'Last Name'.tr),
                                errorThisFieldRequired: 'Last Name'.tr,
                                nextFocus: emailidfocus)
                                .paddingBottom(16),
                          ),

                          // Padding(
                          //   padding: EdgeInsets.only(
                          //       left: 24, right: 24, bottom: height * 0.0001),
                          //   child: AppTextField(
                          //           controller: addressLineController,
                          //           // focus: emailidfocus,
                          //           textFieldType: TextFieldType.OTHER,
                          //           decoration: inputDecoration(context,
                          //               hint: 'Address Line 1'),
                          //           errorThisFieldRequired: 'field_Required',
                          //           // nextFocus: mobilefocus
                          //   )
                          //       .paddingBottom(16),
                          // ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 24, right: 24, bottom: height * 0.0001),
                            child: AppTextField(
                                    controller: address,
                                    focus: addressfocus,
                                    textFieldType: TextFieldType.NAME,
                                    decoration: inputDecoration(context,
                                        hint: 'Address Line'),
                                    errorThisFieldRequired: 'Address',
                                    nextFocus: cityfocus)
                                .paddingBottom(16),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 24, right: 24, bottom: height * 0.0001),
                            child: Row(
                              // mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Container(

                                    // height: 62,

                                    // decoration: BoxDecoration(
                                    //     color: Colors.white,
                                    //     borderRadius: BorderRadius.all(
                                    //         Radius.circular(18.0))),
                                    // color: Colors.transparent,
                                    child: DropdownButton<String>(
                                      hint: Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: Text(
                                          'Select Country',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      isExpanded: true,
                                      items: countryData.map((item) {
                                        return new DropdownMenuItem(
                                          child: Padding(
                                            padding:
                                            const EdgeInsets.all(0),
                                            child:
                                            new Text(item['name'].toString()),
                                          ),
                                          value: item['id'].toString(),
                                        );
                                      }).toList(),
                                      onChanged: (newValue) {
                                        setState(() {
                                          countryDropdownValue = newValue;
                                          stateData.clear();
                                          cityData.clear();
                                          stateDropdownValue=null;
                                          cityDropdownValue=null;
                                          getStateList(countryDropdownValue!);

                                          // print(countryDropdownValue);
                                        });
                                      },
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                      ),
                                      value: countryDropdownValue,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 21,
                                ),
                                Expanded(
                                  child: Container(

                                    // height: 62,

                                    // decoration: BoxDecoration(
                                    //     color: Colors.white,
                                    //     borderRadius: BorderRadius.all(
                                    //         Radius.circular(18.0))),
                                    // color: Colors.transparent,
                                    child: DropdownButton<String>(
                                      hint: Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: Text(
                                          'Select State',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      isExpanded: true,
                                      items: stateData.map((item) {
                                        return new DropdownMenuItem(
                                          child: Padding(
                                            padding:
                                            const EdgeInsets.all(0),
                                            child:
                                            new Text(item['name'].toString()),
                                          ),
                                          value: item['id'].toString(),
                                        );
                                      }).toList(),
                                      onChanged: (newValue) {
                                        setState(() {
                                          stateDropdownValue = newValue;

                                          // stateData.clear();
                                          cityData.clear();
                                          cityDropdownValue=null;

                                          getCityList(stateDropdownValue!);

                                          // print(countryDropdownValue);
                                        });
                                      },
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                      ),
                                      value: stateDropdownValue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 24, right: 24, bottom: height * 0.0001),
                            child: Row(
                              // mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Container(

                                    // height: 62,

                                    // decoration: BoxDecoration(
                                    //     color: Colors.white,
                                    //     borderRadius: BorderRadius.all(
                                    //         Radius.circular(18.0))),
                                    // color: Colors.transparent,
                                    child: DropdownButton<String>(
                                      hint: Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: Text(
                                          'Select City',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      isExpanded: true,
                                      items: cityData.map((item) {
                                        return new DropdownMenuItem(
                                          child: Padding(
                                            padding:
                                            const EdgeInsets.all(0),
                                            child:
                                            new Text(item['name'].toString()),
                                          ),
                                          value: item['id'].toString(),
                                        );
                                      }).toList(),
                                      onChanged: (newValue) {
                                        setState(() {
                                          cityDropdownValue = newValue;

                                          // cityData.clear();
                                          // getCityList(stateDropdownValue);

                                          // print(countryDropdownValue);
                                        });
                                      },
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                      ),
                                      value: cityDropdownValue,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 21,
                                ),
                                Expanded(
                                  child: Container(
                                    // width: width * 0.4,
                                    child: AppTextField(
                                        controller: zipcodeController,
                                        focus: zipfocus,
                                        textFieldType: TextFieldType.NAME,
                                        decoration: inputDecoration(
                                            context,
                                            hint: !["", null, false, 0].contains(zipCode)
                                                ? zipCode!
                                                : 'Zipcode'),
                                        errorThisFieldRequired:
                                        'Zipcode',
                                        nextFocus: statefocus)
                                        .paddingBottom(16),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    )),

                // Padding(
                //   padding: EdgeInsets.only(
                //       left: 24, right: 24, bottom: height * 0.0001),
                //   child: AppTextField(
                //       enabled: false,
                //       controller: mobile,
                //       focus: mobilefocus,
                //       textFieldType: TextFieldType.PHONE,
                //       decoration:
                //       inputDecoration(context, hint: !["", null, false, 0].contains(phoneNumber)
                //           ? phoneNumber
                //           : 'Mobile Number'.tr),
                //       errorThisFieldRequired: 'Mobile Number'.tr,
                //       nextFocus: addressfocus)
                //       .paddingBottom(16),
                // ),

                Padding(
                  padding: EdgeInsets.only(
                    left: 24.0, bottom: height * 0.04,right: 24.0,),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IntlPhoneField(
                      controller: mobile,
                      initialCountryCode: !["", null, false, 0].contains(countryCode)
                          ? countryCode!
                          : 'IN',
                      // initialValue: "9999999999",
                      decoration: InputDecoration(
                        focusedBorder:
                        UnderlineInputBorder(borderSide: BorderSide(color: Color(0xff0B58A0))),
                        enabledBorder:
                        UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffBDC4CC))),
                        labelText: 'Mobile Number'.tr,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      onChanged: (phone) {
                        print(phone.completeNumber);
                        phoneNumber=phone.completeNumber;
                      },
                      onCountryChanged: (country) {
                        print('Country changed to: ' + country.name);
                      },
                    ),
                  ),
                ),



                Container(
                  alignment: Alignment.center,
                  width: width * 0.9,
                  height: 42,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Material(
                        child: InkWell(
                          borderRadius:
                          BorderRadius.circular(10),
                          splashColor: Colors.grey,
                          onTap: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            // formKey.currentState.save();


                          },
                          child: Container(
                            width: width * 0.4,
                            alignment: Alignment.center,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Color(0xffFFFFFF),
                                borderRadius:
                                BorderRadius.circular(25),
                                border: Border.all(
                                    color: Color(0xff0864B1))),
                            child: textWidget(
                                'Clear'.tr,
                                16,
                                FontWeight.w500,
                                'Lato',
                                0xff0864B1,
                                '',
                                false),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Material(
                        child: InkWell(
                          borderRadius:
                          BorderRadius.circular(10),
                          splashColor: Colors.grey,
                          onTap: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            bool? isValid = formKey.currentState?.validate();
                            if ("$isValid"=="false") {
                              return;
                            }
                            else{
                              // addAddress();
                              formKey.currentState?.save();


                              if(countryDropdownValue.toString()!="") {
                                if(stateDropdownValue.toString()!="") {
                                  if(cityDropdownValue.toString()!="") {

                                    addAddress();
                                  }
                                  else{
                                    Fluttertoast.showToast(
                                        msg: 'Select City'.tr,
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        backgroundColor: Colors.black54,
                                        textColor: Colors.white,
                                        timeInSecForIosWeb: 1);
                                  }
                                }
                                else{
                                  Fluttertoast.showToast(
                                      msg: 'Select State'.tr,
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      backgroundColor: Colors.black54,
                                      textColor: Colors.white,
                                      timeInSecForIosWeb: 1);
                                }
                              }
                              else{
                                Fluttertoast.showToast(
                                    msg: 'Select Country'.tr,
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    backgroundColor: Colors.black54,
                                    textColor: Colors.white,
                                    timeInSecForIosWeb: 1);
                              }
                            }


                          },
                          child: Container(
                            width: width * 0.4,
                            alignment: Alignment.center,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Color(0xff0B58A0),
                                borderRadius:
                                BorderRadius.circular(25),
                                border: Border.all(
                                    color: Colors.black)),
                            child: textWidget(
                                'SAVE'.tr,
                                16,
                                FontWeight.w500,
                                'Lato',
                                0xffFFFFFF,
                                '',
                                false),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
