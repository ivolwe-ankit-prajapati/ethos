import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ethos/modules/auth/views/login_view.dart';
import 'package:ethos/modules/cart/view/cart_view.dart';
import 'package:ethos/modules/homepage/controller/homepage_controller.dart';
import 'package:ethos/modules/product/view/product_detail_view.dart';
import 'package:ethos/modules/product_search/view/product_search_view.dart';
import 'package:ethos/modules/wishlist/view/wishlist_view.dart';
import 'package:ethos/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:nb_utils/nb_utils.dart' as nb;
import '../../../Constants/Constants.dart';
import '../../sub_category/view/sub_category_view.dart';

class HomePage extends GetView<HomePageController> {
  HomePageController _homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Obx(() =>
        WillPopScope(
            onWillPop: () async {
              Get.defaultDialog(
                  title: "Exit",
                  textCancel: "     Cancel     ",
                  textConfirm: "     Confirm     ",
                  contentPadding: EdgeInsets.all(20),
                  buttonColor: Color(0xff0864B1),
                  confirmTextColor: Colors.white,
                  cancelTextColor: Color(0xff0864B1),
                  // onCancel: () {
                  //   // navigator.pop();
                  // },
                  onConfirm: () {
                    SystemNavigator.pop();

                    // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                    //     LoginView()), (Route<dynamic> route) => false);
                  },
                  middleText:
                  "Are you sure you want to exit the app?");
              return true;
            },
            child: Scaffold(
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [

                      Padding(
                        padding: EdgeInsets.only(
                            left: 24.0, top: height * 0.03, bottom: height * 0.012),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              'assets/images/Logo.svg',
                              height: 40,
                            ),

                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, bottom: height * 0.012),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.all(10.0),
                                width: width * 0.7,
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(45)),
                                child: GestureDetector(
                                  onTap: (){
                                    Get.to(ProductSearch());
                                  },
                                  child: AbsorbPointer(
                                    child: TextFormField(
                                      enabled: false,
                                      onFieldSubmitted: (r) {},
                                      onChanged: (r) {},
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(13.0),
                                          alignLabelWithHint: true,
                                          // hintText: 'Search by product or user',
                                          hintStyle: TextStyle(fontSize: 12),
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          prefixIcon: GestureDetector(
                                            onTap: () {
                                              // focus.requestFocus();
                                              // searchtextedit.clear();

                                            },
                                            child: Transform.scale(
                                              scale: 0.5,
                                              child: SvgPicture.asset(
                                                'assets/images/searchicon.svg',
                                                color: Colors.black,
                                              ),
                                            ),
                                          )),
                                    ),
                                  ),
                                ),
                              ),


                              Padding(
                                padding: const EdgeInsets.only(right: 24.0),
                                child: Row(
                                  children: [
                                    Badge(
                                      badgeColor: Color(0xffE80057),
                                      position: BadgePosition.topEnd(top: -15,end: -12),
                                      badgeContent: Text('${_homePageController.wishListItemCount}',style: TextStyle(color: Colors.white),),
                                      child:GestureDetector(
                                        onDoubleTap: () {
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) => Wishlist()));
                                        },
                                        onTap: () {
                                          if('${_homePageController.isLoggedIn}'==true)
                                            {
                                              Get.off(WishListView("homepage"));
                                            }
                                          else
                                            {
                                              Get.defaultDialog(
                                                  title: "Login/Signup to view account details".tr,
                                                  textCancel: "     ${'Cancel'.tr}     ",
                                                  textConfirm: "     ${'Log In'.tr}     ",
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

                                                    Get.back();
                                                    Get.offAll(LoginView());

                                                    // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                                    //     LoginView()), (Route<dynamic> route) => false);
                                                  },
                                                  middleText:
                                                  "Login/Signup to view account details".tr);
                                            }


                                        },
                                        child: SvgPicture.asset(
                                          'assets/images/HeartOut.svg',
                                          height: 16,
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                      width: 10,
                                    ),
                                    Badge(
                                        badgeColor: Color(0xffE80057),
                                        position: BadgePosition.topEnd(top: -15,end: -12),
                                        badgeContent: Text('${_homePageController.cartItemCount}',style: TextStyle(color: Colors.white),),
                                        child:GestureDetector(
                                          onDoubleTap: () {
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) => Cart()));
                                          },
                                          onTap: () {

                                            if('${_homePageController.isLoggedIn}'==true)
                                            {
                                              Get.off(CartView("", "", "homepage"));
                                            }
                                            else
                                            {
                                              Get.defaultDialog(
                                                  title: "Login/Signup to view account details".tr,
                                                  textCancel: "     ${'Cancel'.tr}     ",
                                                  textConfirm: "     ${'Log In'.tr}     ",
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

                                                    Get.back();
                                                    Get.offAll(LoginView());

                                                    // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                                    //     LoginView()), (Route<dynamic> route) => false);
                                                  },
                                                  middleText:
                                                  "Login/Signup to view account details".tr);
                                            }
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) => CartView("", "", "homepage")));
                                          },
                                          child: SvgPicture.asset(
                                            'assets/images/CartOut.svg',
                                            height: 16,
                                          ),
                                        )
                                    ),

                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 2, right: 2),
                        child: Container(
                          color: Colors.white,
                          height: 110,
                          margin: EdgeInsets.fromLTRB(5,0,5,5),
                          child: Column(
                            children: [
                              if(_homePageController.isDataLoading.value == 0)
                                Container(
                                  child: CircularProgressIndicator(),
                                ),
                              if(_homePageController.isDataLoading.value == 2)
                                Container(
                                  child: Center(child: Text("No Product found".tr)),
                                ),
                              if(_homePageController.isDataLoading.value == 1) Expanded(
                                child: ListView.builder(
                                    padding: const EdgeInsets.fromLTRB(0,0,0,20),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: _homePageController.categoryList.value.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return categoryListItem(index);
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                            left: 24.0, right: 24, bottom: height * 0.012),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            textWidget('Todays Deal'.tr, 24, FontWeight.bold, 'Lato',
                                0xff000000, '', false),
                            textWidget('See all'.tr, 12, FontWeight.normal, 'Lato',
                                0xff000000, '', false)
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 2, right: 2),
                        child: Container(
                          color: Colors.white,
                          height: 350,
                          margin: EdgeInsets.fromLTRB(5,0,5,5),
                          child: Column(
                            children: [
                              if(_homePageController.isProductListLoading.value == 0)
                                Center(
                                  child: CircularProgressIndicator(),
                                ),
                              if(_homePageController.isProductListLoading.value == 2)
                                Container(
                                  child: Center(child: Text("No Product found".tr)),
                                ),
                              if(_homePageController.isProductListLoading.value == 1) Expanded(
                                child: ListView.builder(
                                    padding: const EdgeInsets.fromLTRB(0,0,0,20),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: _homePageController.productList.value.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return productListItem(index);
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                            left: 24.0, right: 24, bottom: height * 0.012),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            textWidget('Featured'.tr, 24, FontWeight.bold, 'Lato',
                                0xff000000, '', false),
                            textWidget('See all'.tr.tr, 12, FontWeight.normal, 'Lato',
                                0xff000000, '', false)
                          ],
                        ),
                      ),

                      if(_homePageController.isProductListLoading.value == 0)
                        Center(
                          child: Container(
                            width: SizeConfig.screenWidth,
                            height: SizeConfig.screenHeight/2,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      if(_homePageController.isProductListLoading.value == 2)
                        Container(
                          child: Center(child: Text("No Product found".tr)),
                        ),

                      if(_homePageController.isProductListLoading.value == 1)
                        Padding(
                            padding: EdgeInsets.only(left: 2, right: 2),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemCount: _homePageController.productList.value.length,
                              itemBuilder: (context, index) => productListItem(index),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.55,
                              ),
                            )
                        ),

                    ],
                  ),
                )
              ],
            )),
        )
    );

  }
  categoryListItem(int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Container(
        height: 90,
        child: Column(
          children: [
            InkWell(
              onTap: (){
                Get.to(SubCategory("categories", "${_homePageController.categoryList.value[index].sId}", "",_homePageController.categoryList.value[index].name?.en,""));
              },
              child: CachedNetworkImage(
                imageUrl: "${_homePageController.categoryList.value[index].image}",
                placeholder: (context, url) => const CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: 30,
                ),
                imageBuilder: (context, image) => CircleAvatar(
                  backgroundImage: image,
                  radius: 30,
                ),
              ),
            ),

            // CircleAvatar(
            //   radius: 30, // Image radius
            //   backgroundImage: NetworkImage("${_homePageController.categoryList.value[index].image}"),
            // ),
            SizedBox(
              height: 14,
            ),
            textWidget("${_homePageController.categoryList.value[index].name!.en}", 12, FontWeight.normal, 'Lato',
                0xff000000, '', false)
          ],
        ),
      ),
    );
  }

  productListItem(int index) {
    return GestureDetector(
      onTap: (){
        print(_homePageController.productList.value[index].productId);

        Get.off(ProductDetailView("${_homePageController.productList.value[index].productId}","${_homePageController.productList.value[index].esin}"));
      },
      child: Padding(
        padding: EdgeInsets.only(
            left: 14.0, right: 0, bottom: SizeConfig.screenHeight * 0.012),
        child: Container(
          // height: 317,
          color: Colors.white,
          width: SizeConfig.screenWidth * 0.45,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 240,
                width: SizeConfig.screenWidth * 0.4,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          "${_homePageController.productList.value[index].images![0]}",
                        ),
                        fit: BoxFit.fill)),
              ),
              SizedBox(
                height: 12,
              ),
              // textWidget(l[index + 1], 16, FontWeight.bold,
              //     'Lato', 0xff000000, '', false),
              SizedBox(
                height: 5,
              ),

              Expanded(child: textWidget(
                  "${_homePageController.productList.value[index].productName}",
                  12,
                  FontWeight.normal,
                  'Lato',
                  0xff929292,
                  '',
                  false),),

              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    textWidget("\€${_homePageController.productList.value[index].purchasePrice}", 16, FontWeight.bold,
                        'Lato', 0xff000000, '', false),
                    Obx(() => GestureDetector(
                      onTap: (){
                        print(_homePageController.productList.value[index].isWishListed);
                        if("${_homePageController.productList.value[index].isWishListed}"=="false") {
                          _homePageController.addToWishlist(
                              "${_homePageController.productList.value[index].productId}",
                              "${_homePageController.productList.value[index].esin}");
                          _homePageController.update();
                          _homePageController.getProductList();
                        }
                        else
                        {
                          _homePageController.removeFromWishlist(
                              "${_homePageController.productList.value[index].productId}");
                          _homePageController.update();
                          _homePageController.getProductList();
                        }
                      },
                      child: Icon(
                        Icons.favorite,
                        color: _homePageController.productList.value[index].isWishListed == false
                            ? Colors.black
                            : Colors.red,
                      ),
                    ))
                    ,

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );

  }
}
