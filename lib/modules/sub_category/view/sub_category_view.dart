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
import '../controller/sub_category_controller.dart';

class SubCategory extends GetView<SubCategoryController> {
  final String? lastPage;
  final String? category;
  final String? subcategory;
  final String? categoryName;
  final String? subcategoryName;

  SubCategory(this.lastPage,this.category,this.subcategory,this.categoryName,this.subcategoryName);


  @override
  Widget build(BuildContext context) {
    SubCategoryController _subCategoryController = Get.put(SubCategoryController(category,subcategory));
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
                        padding: EdgeInsets.only(
                            left: 24.0, top: height * 0.03, bottom: 5),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  IconButton(onPressed: (){
                                    Get.back();
                                  },
                                      icon: Icon(Icons.arrow_back_ios)
                                  ),
                                  // Icon(Icons.arrow_back_ios),
                                  textWidget("${categoryName}", 24, FontWeight.bold, 'Lato',
                                      0xff000000, '', false),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 24.0, top: 5, bottom: 0),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  // Icon(Icons.arrow_back_ios),
                                  textWidget("${subcategoryName}", 12, FontWeight.bold, 'Lato',
                                      0xff000000, '', false),
                                ],
                              ),
                            ],
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
                      //         if(_subCategoryController.isProductListLoading.value == 0)
                      //           Container(
                      //             child: CircularProgressIndicator(),
                      //           ),
                      //         if(_subCategoryController.isProductListLoading.value == 2)
                      //           Container(
                      //             child: Center(child: Text("No Product found".tr)),
                      //           ),
                      //         if(_subCategoryController.isProductListLoading.value == 1) Expanded(
                      //           child: ListView.builder(
                      //               padding: const EdgeInsets.fromLTRB(0,0,0,20),
                      //               scrollDirection: Axis.horizontal,
                      //               itemCount: _subCategoryController.productList.value.length,
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


                      if(_subCategoryController.isProductListLoading.value == 0)
                        Center(
                          child:  Center(child: CircularProgressIndicator()),
                        ),
                      if(_subCategoryController.isProductListLoading.value == 2)
                        Container(
                          child: Center(child: Text("No Product found".tr)),
                        ),

                      if(_subCategoryController.isProductListLoading.value == 1)
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: _subCategoryController.productList.value.length > 0?
                          GridView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount: _subCategoryController.productList.value.length,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: (){
                                print(_subCategoryController.productList.value[index].productId);

                                Get.off(ProductDetailView("${_subCategoryController.productList.value[index].productId}","${_subCategoryController.productList.value[index].esin}"));
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
                                                  "${_subCategoryController.productList.value[index].images![0]}",
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
                                          "${_subCategoryController.productList.value[index].productName}",
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
                                            textWidget("\€${_subCategoryController.productList.value[index].purchasePrice}", 16, FontWeight.bold,
                                                'Lato', 0xff000000, '', false),
                                            Obx(() => GestureDetector(
                                              onTap: (){
                                                print(_subCategoryController.productList.value[index].isWishListed);
                                                if("${_subCategoryController.productList.value[index].isWishListed}"=="false") {
                                                  _subCategoryController.addToWishlist(
                                                      "${_subCategoryController.productList.value[index].productId}",
                                                      "${_subCategoryController.productList.value[index].esin}");
                                                  _subCategoryController.update();
                                                  _subCategoryController.getProductList("","");
                                                }
                                                else
                                                {
                                                  _subCategoryController.removeFromWishlist(
                                                      "${_subCategoryController.productList.value[index].productId}");
                                                  _subCategoryController.update();
                                                  _subCategoryController.getProductList("","");
                                                }
                                              },
                                              child: Icon(
                                                Icons.favorite,
                                                color: _subCategoryController.productList.value[index].isWishListed == false
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
                            ),
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
                                            'No items found',
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


  // productListItem(int index) {
  //
  //   return ;
  //
  // }
}
