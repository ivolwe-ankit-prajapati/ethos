import 'dart:convert';
import 'package:ethos/modules/homepage/view/homepage.dart';
import 'package:ethos/modules/landingpage/view/landingpage_view.dart';
import 'package:ethos/modules/product/controller/product_detail_controller.dart';
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
import 'package:nb_utils/nb_utils.dart' as nb;
import 'package:ethos/size_config.dart';
import '../../../../Constants/Constants.dart';
import '../../product/view/product_detail_view.dart';
import '../controller/cart_controller.dart';

class CartView extends GetView<CartController> {
  CartController _cartController = Get.put(CartController());
  final String? productId;
  final String? esin;
  final String? lastPage;
  CartView(this.productId, this.esin,this.lastPage);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Obx(() =>
        WillPopScope(
          onWillPop: () async {
            if(lastPage=="homepage")
              {
                Get.off(LandingPage());
              }
            else
              {
                Get.off(ProductDetailView(productId, esin));
              }
            // Get.back();
            return true;
          },
          child: Scaffold(
            bottomNavigationBar: Stack(
              children: [
                Container(
                  height: height * 0.135,
                  alignment: Alignment.center,
                  width: width,
                  decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.white,
                            blurRadius: 2.0,
                            offset: Offset(0.0, -1))
                      ],
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20.0))),
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {},
                        child: Visibility(
                          visible: true,
                          child: Container(
                            alignment: Alignment.center,
                            width: width / 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets.only(left: 32.0, top: 12),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      textWidget('Total'.tr, 16, FontWeight.normal,
                                          'Lato', 0xff929292, '', false),
                                      textWidget('\$4500', 18, FontWeight.normal,
                                          'Lato', 0xffFF4858, '', false),
                                      textWidget(
                                          '(${'Incl. of all taxes'.tr})',
                                          12,
                                          FontWeight.normal,
                                          'Lato',
                                          0xff000000,
                                          '',
                                          false),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Visibility(
                          visible: true,
                          child: Container(
                            alignment: Alignment.center,
                            width: width * 0.4,
                            height: 32,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Material(
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(10),
                                    splashColor: Colors.grey,
                                    onTap: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             CheckoutPageone()));
                                    },
                                    child: Container(
                                      width: width * 0.4,
                                      alignment: Alignment.center,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Color(0xff0B58A0),
                                          borderRadius: BorderRadius.circular(4),
                                          border: Border.all(color: Colors.black)),
                                      child: textWidget(
                                          'Checkout'.tr.toUpperCase(),
                                          16,
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
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            body: Column(children: [
              Padding(
                padding: EdgeInsets.only(
                    left: 24.0, top: height * 0.07, bottom: height * 0.01),
                child: Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: (){
                              if(lastPage=="homepage")
                              {
                                Get.off(LandingPage());
                              }
                              else
                              {
                                Get.off(ProductDetailView(productId, esin));
                              }
                            },
                            child: Icon(Icons.arrow_back_ios),
                          ),

                          textWidget('Your Cart'.tr, 24, FontWeight.bold, 'Lato',
                              0xff000000, '', false),
                        ],
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(right: 24.0),
                      //   child: Row(
                      //     children: [
                      //       SvgPicture.asset(
                      //         'assets/images/HeartOut.svg',
                      //         height: 16,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                height: Get.height * 0.7,
                margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
                child: Column(
                  children: [
                    if (_cartController.isCartLoading.value == 0)
                      Container(
                        child: CircularProgressIndicator(),
                      ),
                    if (_cartController.isCartLoading.value == 2)
                      Container(
                        child: Center(child: Text("No Product found".tr)),
                      ),
                    if (_cartController.isCartLoading.value == 1)
                    Expanded(
                      child: _cartController.cart.value.length > 0?
                      ListView.builder(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                          itemCount: _cartController.cart.value.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: 5.0, right: 14, bottom: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: height * 0.18,
                                    width: width * 0.35,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "${_cartController.cart.value[index].bannerImage}"),
                                            fit: BoxFit.fill)),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: width / 2.5,
                                            child: Text(
                                              "${_cartController.cart.value[index].productName}",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontFamily: 'Lato',
                                                fontSize: 16,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),

                                          // textWidget("${_cartController.cart.value[index].productName}", 16,
                                          //     FontWeight.normal, 'Lato', 0xff000000, '', false),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          InkWell(
                                            onTap: (){

                                              _cartController.deleteCartItem("${_cartController.cart.value[index].sId}");
                                              _cartController.update();
                                              _cartController.getCartList();
                                            },
                                            child:  SvgPicture.asset(
                                                'assets/images/closeicon.svg'),
                                          ),

                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      textWidget(
                                          "\€${_cartController.cart.value[index].salePrice}",
                                          16,
                                          FontWeight.normal,
                                          'Lato',
                                          0xffFF4858,
                                          '',
                                          false),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      textWidget(
                                          '${'Sold By'.tr} : "${_cartController.cart.value[index].company}"',
                                          12,
                                          FontWeight.normal,
                                          'Lato',
                                          0xff000000,
                                          '',
                                          false),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 30,
                                            // width: 120,
                                            decoration: BoxDecoration(
                                                color: Colors.grey[300],
                                                borderRadius:
                                                BorderRadius.circular(4)),
                                            child: Obx(
                                                  () => Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  // SvgPicture.asset('assets/images/minus.svg'),
                                                  Center(
                                                    child: IconButton(
                                                        onPressed: () {
                                                          var a =int.parse("${_cartController.cart.value[index].quantity}");
                                                          var b=a-1;
                                                          _cartController.updateCart("${_cartController.cart.value[index].sId}", "$b");
                                                          _cartController
                                                              .update();
                                                          _cartController
                                                              .getCartList();
                                                        },
                                                        icon: Icon(
                                                          Icons.remove,
                                                          size: 15,
                                                        )),
                                                  ),

                                                  // InkWell(
                                                  //     onTap: () {
                                                  //       _cartController
                                                  //           .deleteCartItem(
                                                  //               "${_cartController.cart.value[index].sId}");
                                                  //       _cartController.update();
                                                  //       _cartController
                                                  //           .getCartList();
                                                  //     },
                                                  //     child: Container(
                                                  //       width: 5,
                                                  //       height: 5,
                                                  //       child: SvgPicture.asset(
                                                  //         'assets/images/minus.svg',
                                                  //       ),
                                                  //     )),
                                                  textWidget(
                                                      "${_cartController.cart.value[index].quantity}",
                                                      14,
                                                      FontWeight.normal,
                                                      'Lato',
                                                      0xff000000,
                                                      '',
                                                      false),
                                                  IconButton(
                                                      onPressed: (){
                                                        var a =int.parse("${_cartController.cart.value[index].quantity}");
                                                        var b=a+1;
                                                        _cartController.updateCart("${_cartController.cart.value[index].sId}", "$b");
                                                        _cartController.update();
                                                        _cartController.getCartList();

                                                      },
                                                      icon: Icon(
                                                        Icons.add,
                                                        size: 15,
                                                      )),
                                                  // InkWell(
                                                  //   onTap: (){
                                                  //     var a =int.parse("${_cartController.cart.value[index].quantity}");
                                                  //     var b=a+1;
                                                  //     _cartController.updateCart("${_cartController.cart.value[index].sId}", "$b");
                                                  //     _cartController.update();
                                                  //     _cartController.getCartList();
                                                  //
                                                  //   },
                                                  //   child: SvgPicture.asset('assets/images/plus.svg'),
                                                  // ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: width * 0.1,
                                          ),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: InkWell(
                                              onTap: () {
                                                Get.defaultDialog(
                                                    title: "Move to Wishlist".tr,
                                                    textCancel: "     ${'Cancel'.tr}     ",
                                                    textConfirm: "     ${'Confirm'.tr}     ",
                                                    contentPadding: EdgeInsets.all(20),
                                                    buttonColor: Color(0xff0864B1),
                                                    // cancel: TextButton(
                                                    //     style: ButtonStyle(
                                                    //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                    //             RoundedRectangleBorder(
                                                    //                 borderRadius: BorderRadius.circular(18.0),
                                                    //                 side: BorderSide(color: Color(0xff0864B1))
                                                    //             )
                                                    //         )
                                                    //     ),
                                                    //
                                                    //   onPressed: () {},
                                                    //   child: Text('Cancel',
                                                    //       style: TextStyle(
                                                    //           color: Color(0xff0864B1),
                                                    //       )
                                                    //   ),
                                                    // ),
                                                    // confirm: FlatButton(
                                                    //   onPressed: () {
                                                    //     _wishListController
                                                    //         .removeFromWishlist(
                                                    //             '${_wishListController.wishList.value[index].pid}');
                                                    //     _wishListController
                                                    //         .getWishList();
                                                    //     _wishListController
                                                    //         .update();
                                                    //   },
                                                    //   child: Text('Confirm',
                                                    //       style: TextStyle(
                                                    //           color: Color(0xff0864B1)
                                                    //       )),
                                                    //   textColor: Colors.white,
                                                    //   shape:
                                                    //       RoundedRectangleBorder(
                                                    //           side: BorderSide(
                                                    //               color: Color(
                                                    //                   0xff0864B1),
                                                    //               width: 1,
                                                    //               style:
                                                    //                   BorderStyle
                                                    //                       .solid),
                                                    //           borderRadius:
                                                    //               BorderRadius
                                                    //                   .circular(
                                                    //                       50)),
                                                    // ),
                                                    confirmTextColor: Colors.white,
                                                    cancelTextColor: Color(0xff0864B1),
                                                    // onCancel: () {
                                                    //   // navigator.pop();
                                                    // },
                                                    onConfirm: () {
                                                      _cartController.addToWishlist(
                                                          "${_cartController.cart.value[index].sId}",
                                                          "${_cartController.cart.value[index].esin}");
                                                      _cartController.deleteCartItem("${_cartController.cart.value[index].sId}");
                                                      _cartController.getCartList();
                                                      _cartController.update();
                                                      Get.back();
                                                      // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                                      //     LoginView()), (Route<dynamic> route) => false);
                                                    },
                                                    middleText:
                                                    "Are you sure you want to move this item to WishList?".tr);

                                              },
                                              child: textWidget(
                                                  'Move to Wishlist'.tr,
                                                  8,
                                                  FontWeight.normal,
                                                  'Lato',
                                                  0xff000000,
                                                  '',
                                                  true),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }):
                      Container(
                        child: Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: height * 0.1,
                                ),
                                SvgPicture.asset(
                                  'assets/images/CartOutLarge.svg',
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 24.0, right: 24),
                                  child: Align(
                                    child: textWidget(
                                        'Your Cart is empty .Start shopping now.'.tr,
                                        16,
                                        FontWeight.normal,
                                        'Lato',
                                        0xffA8A8A8,
                                        'c',
                                        false),
                                  ),
                                ),
                              ],
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24, right: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: textWidget('Subtotal'.tr, 16, FontWeight.normal, 'Lato',
                          0xff000000, '', false),
                    ),
                    Spacer(),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 5.0, right: 5),
                    //   child: Container(
                    //     width: width * 0.5,
                    //     height: 0.2,
                    //     color: Colors.black,
                    //   ),
                    // ),
                    textWidget('\$3950', 16, FontWeight.bold, 'Lato', 0xff000000,
                        '', false)
                  ],
                ),
              )
            ])),
        )
    );
  }
}
