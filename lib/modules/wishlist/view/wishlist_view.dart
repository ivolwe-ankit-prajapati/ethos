import 'dart:convert';
import 'package:ethos/modules/landingpage/view/landingpage_view.dart';
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
import '../../homepage/view/homepage.dart';
import '../../product/view/product_detail_view.dart';
import '../controller/wishlist_controller.dart';

class WishListView extends GetView<WishListController> {
  final String? lastPage;

  WishListView(this.lastPage);

  WishListController _wishListController = Get.put(WishListController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    print(_wishListController.wishList.value.length);

    return Obx(() => WillPopScope(
          onWillPop: () async {
            Get.off(LandingPage());
            // if (lastPage == "homepage") {
            //   Get.off(HomePage());
            // } else {
            //   Get.back();
            // }

            // Get.back();
            return true;
          },
          child: Scaffold(
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
                      Get.off(LandingPage());
                    }
                  }),
              backgroundColor: Colors.white,
              centerTitle: true,
              title: textWidget('Wish List'.tr, 24, FontWeight.bold, 'Lato',
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
            body: Container(
              color: Colors.white,
              // height: Get.height*0.8,
              margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
              child: Column(
                children: [
                  if (_wishListController.isWishListLoading.value == 0)
                    Container(
                      height: height*0.75,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  if (_wishListController.isWishListLoading.value == 2)
                    Container(
                      child: Center(child: Text("No Product found".tr)),
                    ),
                  if (_wishListController.isWishListLoading.value == 1)
                    Expanded(
                      child: _wishListController.wishList.value.length > 0?
                      ListView.builder(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          itemCount: _wishListController.wishList.value.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: 5.0, right: 14, bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: height * 0.17,
                                    width: width * 0.3,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              "${_wishListController.wishList.value[index].bannerImage}",
                                            ),
                                            fit: BoxFit.fitHeight)),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: width / 2,
                                            child: Text(
                                              '${_wishListController.wishList.value[index].productName}',
                                              style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontFamily: 'Lato',
                                                fontSize: 16,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Get.defaultDialog(
                                                  title: "Delete Products".tr,
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
                                                    _wishListController
                                                        .removeFromWishlist(
                                                        '${_wishListController.wishList.value[index].pid}');
                                                    _wishListController
                                                        .getWishList();
                                                    _wishListController
                                                        .update();
                                                    Get.back();

                                                    // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                                    //     LoginView()), (Route<dynamic> route) => false);
                                                  },
                                                  middleText:
                                                  "Do you really want to delete this?".tr);
                                            },
                                            child: SvgPicture.asset(
                                                'assets/images/closeicon.svg'),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      textWidget(
                                          '\€${_wishListController.wishList.value[index].salePrice}',
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
                                          '${'Sold By'.tr} : ${_wishListController.wishList.value[index].company}',
                                          12,
                                          FontWeight.normal,
                                          'Lato',
                                          0xff000000,
                                          '',
                                          false),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      textWidget(
                                          '${'Items added on'.tr} : 23/05/2021',
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
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Align(
                                            alignment: Alignment.bottomLeft,
                                            child: textWidget(
                                                'In Stock'.tr,
                                                12,
                                                FontWeight.normal,
                                                'Lato',
                                                0xff00C569,
                                                '',
                                                true),
                                          ),
                                          SizedBox(
                                            width: width * 0.25,
                                          ),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: InkWell(
                                              onTap: () {
                                                Get.defaultDialog(
                                                    title: "Move to Cart".tr,
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
                                                      _wishListController.addToCart(
                                                          '${_wishListController.wishList.value[index].pid}',
                                                          "1",
                                                          'Sold by : ${_wishListController.wishList.value[index].esin}');
                                                      _wishListController
                                                          .removeFromWishlist(
                                                          '${_wishListController.wishList.value[index].pid}');
                                                      _wishListController
                                                          .getWishList();
                                                      _wishListController.update();
                                                      Get.back();

                                                      // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                                      //     LoginView()), (Route<dynamic> route) => false);
                                                    },
                                                    middleText:
                                                    "Are you sure you want to move this item to Cart?".tr);

                                              },
                                              child: textWidget(
                                                  'Add to cart'.tr,
                                                  8,
                                                  FontWeight.normal,
                                                  'Lato',
                                                  0xff000000,
                                                  '',
                                                  true),
                                            ),
                                          )
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
                                  'assets/images/HeartOutLarge.svg',
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 24.0, right: 24),
                                  child: Align(
                                    child: textWidget(
                                        'You don’t have any items in the Wishlist'.tr,
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
          ),
        ));
  }
}
