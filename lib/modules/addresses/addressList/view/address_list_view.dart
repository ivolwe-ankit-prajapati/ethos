import 'dart:convert';
import 'package:ethos/modules/addresses/add_address/view/add_address_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as JSON;

import '../../../../Constants/Constants.dart';
import '../controller/address_list_controller.dart';
class AddressListView extends StatefulWidget {
  @override
  _AddressListViewState createState() => _AddressListViewState();
}

class _AddressListViewState extends State<AddressListView> {


  AddressListController _addressListController = Get.put(AddressListController());


  @override
  Widget build(BuildContext context) {

    print(_addressListController.addressList.value.length);
    return Obx(() =>
        Scaffold(
          // extendBodyBehindAppBar: true,
            appBar: AppBar(
              elevation: 0,

              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    {
                      Navigator.pop(context);

                    }
                  }),
              backgroundColor: Colors.white,
              centerTitle: true,
              title: textWidget('My Address'.tr, 24, FontWeight.bold, 'Lato',
                  0xff000000, '', false),
              // actions: [
              //   IconButton(
              //       icon: SvgPicture.asset(
              //         'assets/images/search.svg',
              //         fit: BoxFit.fitHeight,
              //         color: Colors.black,
              //       ),
              //       onPressed: () {
              //
              //       }),
              //   IconButton(
              //       icon: SvgPicture.asset(
              //         'assets/images/bell.svg',
              //         fit: BoxFit.fitHeight,
              //         color: Colors.black,
              //       ),
              //       onPressed: () {
              //         // Get.to(NotificationView());
              //       }),
              // ],
            ),
            body: ListView(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              children: [
                SizedBox(
                  height: 0,
                ),

                SizedBox(
                  height: 0,
                ),
                Container(
                  color: Colors.white,
                  height: Get.height*0.8,
                  margin: EdgeInsets.fromLTRB(5,0,5,5),
                  child: Column(
                    children: [
                      if(_addressListController.addreslist.value == 0)
                        Container(
                          child: CircularProgressIndicator(),
                        ),
                      if(_addressListController.addreslist.value == 2)
                        Container(
                          child: Center(child: Text("No Product found".tr)),
                        ),
                      if(_addressListController.addreslist.value == 1) Expanded(
                        child: ListView.builder(
                            padding: const EdgeInsets.fromLTRB(0,0,0,20),
                            itemCount: _addressListController.addressList.value.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return addressListItem(index);
                            }),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),

                // AppButtonTwo(
                //   btntext: "Add New",
                //   onTap: (){
                //     Get.to(AddReheating());
                //   },
                // ),



              ],
            ),
            bottomSheet: Container(
              color: Colors.white,
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child:Container(
                    color: Colors.white,
                    width: Get.width * 0.9,
                    alignment: Alignment.center,
                    height: 50,
                    child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        splashColor: Colors.grey,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddAddressView()));
                        },
                        child: Center(
                          child: Container(

                            width: Get.width * 0.9,
                            alignment: Alignment.center,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Color(0xff0B58A0),
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: Colors.black)),
                            child: textWidget('Add New Address'.tr, 16, FontWeight.bold,
                                'Lato', 0xffFFFFFF, '', false),
                          ),
                        )
                    ),
                  )
              ),
            )
        )
    );
  }

  addressListItem(int index) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Align(
        alignment: Alignment.center,
        child: Card(
          elevation: 0,
          color: Colors.white30,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textWidget('Shipping Address'.tr, 16, FontWeight.bold,
                    'Lato', 0xff000000, '', false),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textWidget(
                        "${_addressListController.addressList.value[index].name}", 16, FontWeight.bold,
                        'Lato', 0xff000000, '', false),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            // print(_addressListController.addressList.value[index].name);
                            // this.address, this.addressType, this.name,this.country, this.state, this.phone,this.zipCode, this.addId
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => EditAddress(_addressListController.addressList.value[index].address,
                            //           _addressListController.addressList.value[index].addressType,
                            //           _addressListController.addressList.value[index].cityName,
                            //           _addressListController.addressList.value[index].name,
                            //           _addressListController.addressList.value[index].countryName,
                            //           _addressListController.addressList.value[index].stateName,
                            //           _addressListController.addressList.value[index].phone,
                            //           _addressListController.addressList.value[index].zipCode,
                            //           _addressListController.addressList.value[index].id.toString(),
                            //           _addressListController.addressList.value[index].country.toString(),
                            //           _addressListController.addressList.value[index].state.toString(),
                            //           _addressListController.addressList.value[index].city.toString(),
                            //
                            //         )));
                          },
                          child: SvgPicture.asset(
                            'assets/images/editicon.svg',
                            height: 20,
                          ),
                        ),

                        SizedBox(
                          width: 5,
                        ),
                        CircleAvatar(
                            radius: 12,
                            backgroundColor: Color(0xff0864B1),
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 17,
                            )),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 5,),
                textWidget(
                    _addressListController.addressList.value[index].address!,
                    12,
                    FontWeight.normal,
                    'Lato',
                    0xff000000,
                    '',
                    false),
                textWidget("${_addressListController.addressList.value[index].cityName}, ${_addressListController.addressList.value[index].zipCode} \n${_addressListController.addressList.value[index].countryName}", 12,
                    FontWeight.normal, 'Lato', 0xff000000, '', false),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textWidget(
                        "${_addressListController.addressList.value[index].phone!.e164Number}", 12, FontWeight.normal,
                        'Lato', 0xff000000, '', false),
                    Container(
                      alignment: Alignment.center,
                      width: width * 0.4,
                      height: 32,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Material(
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              splashColor: Colors.grey,
                              onTap: () {

                                // _addressListController.deleteAddress(_addressListController.addressList.value[index].id.toString()).whenComplete(() => Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => AddressListView())));

                              },
                              child: Container(
                                width: width * 0.25,
                                alignment: Alignment.center,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: Color(0xffE80057),
                                  borderRadius:
                                  BorderRadius.circular(4),
                                ),
                                child: textWidget(
                                    'Remove'.tr,
                                    12,
                                    FontWeight.bold,
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
                  ],
                )
              ],
            ),
          ),
        ),
      ),);
  }
}
