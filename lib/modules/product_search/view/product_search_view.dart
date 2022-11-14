import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ethos/modules/auth/views/login_view.dart';
import 'package:ethos/modules/cart/view/cart_view.dart';
import 'package:ethos/modules/homepage/controller/homepage_controller.dart';
import 'package:ethos/modules/product/view/product_detail_view.dart';
import 'package:ethos/modules/product_search/controller/product_search_controller.dart';
import 'package:ethos/modules/wishlist/view/wishlist_view.dart';
import 'package:ethos/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:nb_utils/nb_utils.dart' as nb;
import '../../../Constants/Constants.dart';

class ProductSearch extends GetView<ProductSearchController> {
  ProductSearchController _productSearchController = Get.put(ProductSearchController());
  final TextEditingController searchtextedit = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Obx(() =>
        Scaffold(
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top:20,left: 10,right: 10, bottom: height * 0.015),
                        child: Container(
                          margin: EdgeInsets.all(10.0),
                          // width: width,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(45)),
                          child: Form(
                            // key: _formKey,
                            child: TextFormField(
                              controller: searchtextedit,
                              onFieldSubmitted: (r) {
                                _productSearchController.getProductList(r);
                              },
                              onChanged: (r) {
                                _productSearchController.isSearched.value=true;
                                _productSearchController.getProductList(r);

                              },
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
                                  ),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      // focus.requestFocus();
                                      searchtextedit.clear();
                                      _productSearchController.getProductList("");
                                    },
                                    child: Transform.scale(
                                      scale: 0.5,
                                      child: SvgPicture.asset(
                                        'assets/images/closeicon.svg',
                                        color: Color(0xffE80057),
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ),

                      // Padding(
                      //   padding: EdgeInsets.only(
                      //       left: 24.0, right: 24, bottom: height * 0.012),
                      //   child: Row(
                      //     crossAxisAlignment: CrossAxisAlignment.end,
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       textWidget('Best Selling', 24, FontWeight.bold, 'Lato',
                      //           0xff000000, '', false),
                      //       textWidget('See all'.tr, 12, FontWeight.normal, 'Lato',
                      //           0xff000000, '', false)
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.only(left: 2, right: 2),
                      //   child: Container(
                      //     color: Colors.white,
                      //     height: 350,
                      //     margin: EdgeInsets.fromLTRB(5,0,5,5),
                      //     child: Column(
                      //       children: [
                      //         if(_productSearchController.isProductListLoading.value == 0)
                      //           Container(
                      //             child: CircularProgressIndicator(),
                      //           ),
                      //         if(_productSearchController.isProductListLoading.value == 2)
                      //           Container(
                      //             child: Center(child: Text("No Product found".tr)),
                      //           ),
                      //         if(_productSearchController.isProductListLoading.value == 1) Expanded(
                      //           child: ListView.builder(
                      //               padding: const EdgeInsets.fromLTRB(0,0,0,20),
                      //               scrollDirection: Axis.horizontal,
                      //               itemCount: _productSearchController.productList.value.length,
                      //               shrinkWrap: true,
                      //               itemBuilder: (context, index) {
                      //                 return productListItem(index);
                      //               }),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),

                      // Padding(
                      //   padding: EdgeInsets.only(
                      //       left: 24.0, right: 24, bottom: height * 0.012),
                      //   child: Row(
                      //     crossAxisAlignment: CrossAxisAlignment.end,
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       textWidget('Featured Brands', 24, FontWeight.bold, 'Lato',
                      //           0xff000000, '', false),
                      //       textWidget('See all'.tr, 12, FontWeight.normal, 'Lato',
                      //           0xff000000, '', false)
                      //     ],
                      //   ),
                      // ),


                      if(_productSearchController.isProductListLoading.value == 0)
                        Center(
                          child:  Center(child: CircularProgressIndicator()),
                        ),
                      if(_productSearchController.isProductListLoading.value == 2)
                        Container(
                          child: Center(child: Text("No Product found".tr)),
                        ),

                      if(_productSearchController.isProductListLoading.value == 1)
                        Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: _productSearchController.productList.value.length > 0?
                            GridView.builder(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemCount: _productSearchController.productList.value.length,
                              itemBuilder: (context, index) => productListItem(index),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.55,
                              ),
                            ):
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
                                              'No Product found'.tr,
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
                )
              ],
            ))
    );

  }


  productListItem(int index) {

    return GestureDetector(
      onTap: (){
        print(_productSearchController.productList.value[index].productId);

        Get.off(ProductDetailView("${_productSearchController.productList.value[index].productId}","${_productSearchController.productList.value[index].esin}"));
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
                          "${_productSearchController.productList.value[index].images![0]}",
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
                  "${_productSearchController.productList.value[index].productName}",
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
                    textWidget("\€${_productSearchController.productList.value[index].purchasePrice}", 16, FontWeight.bold,
                        'Lato', 0xff000000, '', false),
                    Obx(() => GestureDetector(
                      onTap: (){
                        print(_productSearchController.productList.value[index].isWishListed);
                        if("${_productSearchController.productList.value[index].isWishListed}"=="false") {
                          _productSearchController.addToWishlist(
                              "${_productSearchController.productList.value[index].productId}",
                              "${_productSearchController.productList.value[index].esin}");
                          _productSearchController.update();
                          _productSearchController.getProductList("");
                        }
                        else
                        {
                          _productSearchController.removeFromWishlist(
                              "${_productSearchController.productList.value[index].productId}");
                          _productSearchController.update();
                          _productSearchController.getProductList("");
                        }
                      },
                      child: Icon(
                        Icons.favorite,
                        color: _productSearchController.productList.value[index].isWishListed == false
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
