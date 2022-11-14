import 'package:badges/badges.dart';
import 'package:ethos/modules/wishlist/view/wishlist_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:nb_utils/nb_utils.dart' as nb;
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import '../../../../Constants/Constants.dart';
import '../../cart/view/cart_view.dart';
import '../../landingpage/view/landingpage_view.dart';
import '../controller/product_detail_controller.dart';
import 'package:intl/intl.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  final String? productId;
  final String? esin;
  ProductDetailView(this.productId, this.esin);

  // ProductDetailController _productDetailController = Get.put(ProductDetailController(productId,esin));

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    ProductDetailController _productDetailController = Get.put(ProductDetailController(productId,esin));

    print(_productDetailController.user.value?.response.toString());
    return Obx(() =>
        WillPopScope(
            onWillPop: () async {
              Get.off(LandingPage());
              // if(lastPage=="homepage")
              // {
              //   Get.off(LandingPage());
              // }
              // else
              // {
              //   Get.off(ProductDetailView(productId, esin));
              // }
              // Get.back();
              return true;
            },
            child: Scaffold(

          bottomNavigationBar: Stack(
            children: [
              Container(
                height: 64,
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
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => Cart()));
                        _productDetailController.addToWishlist("${_productDetailController.user.value?.response?.sId}", "${_productDetailController.user.value?.response?.esin}");
                        _productDetailController.getWishListCount();
                        _productDetailController.update();
                      },
                      child: Visibility(
                        visible: true,
                        child: Container(
                          alignment: Alignment.center,
                          width: width / 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  icon: SvgPicture.asset(
                                    'assets/images/HeartOut.svg',
                                  ),
                                  onPressed: null),
                              textWidget('Wish List'.tr.toUpperCase(), 16, FontWeight.normal, 'Lato',
                                  0xff000000, '', false),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Material(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(100),
                        // splashColor: Colors.black,
                        // highlightColor: Colors.black,

                        onTap: () {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => Cart()));
                          _productDetailController.addToCart("${_productDetailController.user.value?.response?.sId}", "1", "${_productDetailController.user.value?.response?.esin}");

                          _productDetailController.getCartCount();
                          _productDetailController.update();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: width / 2,
                          color: Color(0xffE80057),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: SvgPicture.asset(
                                    'assets/images/CartOut.svg',
                                    color: Colors.white), onPressed: () {  },
                              ),
                              Expanded(child: textWidget('Add to cart'.tr.toUpperCase(), 16, FontWeight.normal,
                                  'Lato', 0xffFFFFFF, '', false),),

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
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 24.0, top: height * 0.07, bottom: height * 0.01),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: (){
                                    Get.off(LandingPage());
                                  },
                                  child: Icon(Icons.arrow_back_ios),
                                )

                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 24.0),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/Share.svg',
                                    height: 16,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: (){
                                      Get.off(WishListView("productDetail"));
                                    },
                                    child: Badge(
                                      badgeColor: Color(0xffE80057),
                                      position: BadgePosition.topEnd(top: -15,end: -12),
                                      badgeContent: Text('${_productDetailController.wishListItemCount}',style: TextStyle(color: Colors.white),),
                                      child: SvgPicture.asset(
                                        'assets/images/HeartOut.svg',
                                        height: 16,
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: (){
                                      Get.off(CartView(productId,esin,"productDetailView"));
                                    },
                                    child: Badge(
                                        badgeColor: Color(0xffE80057),
                                        position: BadgePosition.topEnd(top: -15,end: -12),
                                        badgeContent: Text('${_productDetailController.cartItemCount}',style: TextStyle(color: Colors.white),),
                                        child: SvgPicture.asset(
                                          'assets/images/CartOut.svg',
                                          height: 16,
                                        )
                                    ),
                                  )

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: height * 0.5,
                      child: PageView.builder(
                        // onPageChanged: _onchanged,
                          controller: _productDetailController.pageController,
                          onPageChanged: _productDetailController.selectedPageIndex,
                          itemCount: _productDetailController.productImages.length,
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Image.network(
                                    _productDetailController.productImages[index],),
                                ),

                              ],
                            );
                          }),
                    ),
                    // Container(
                    //   height: height * 0.5,
                    //   child: Row(
                    //     children: List.generate(
                    //       _productDetailController.productImages.length,
                    //           (index) => Obx(() {
                    //         return Container(
                    //           margin: const EdgeInsets.all(4),
                    //           width: _productDetailController.selectedPageIndex.value == index? 8 :6,
                    //           height: _productDetailController.selectedPageIndex.value == index? 8 :6,
                    //           decoration: BoxDecoration(
                    //             color: _productDetailController.selectedPageIndex.value == index
                    //                 ? Colors.black
                    //                 : const Color(0xff707070).withOpacity(0.5),
                    //             shape: BoxShape.circle,
                    //           ),
                    //         );
                    //       }),
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.02, bottom: height * 0.02),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:
                            List.generate(
                              _productDetailController.productImages.length,
                                  (index) => Obx(() {
                                return Container(
                                  margin: const EdgeInsets.all(4),
                                  width: _productDetailController.selectedPageIndex.value == index? 8 :6,
                                  height: _productDetailController.selectedPageIndex.value == index? 8 :6,
                                  decoration: BoxDecoration(
                                    color: _productDetailController.selectedPageIndex.value == index
                                        ? Colors.black
                                        : const Color(0xff707070).withOpacity(0.5),
                                    shape: BoxShape.circle,
                                  ),
                                );
                              }),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: textWidget("${_productDetailController.user.value?.response?.productName}", 16,
                            FontWeight.bold, 'Lato', 0xff000000, '', false),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: textWidget("\€${_productDetailController.user.value?.response?.salePrice}", 12, FontWeight.bold, 'Lato',
                            0xffE80057, '', false),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: textWidget('${'Sold By'.tr} : ', 12, FontWeight.normal,
                                'Lato', 0xff000000, '', false),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: textWidget("${_productDetailController.user.value?.response?.company}", 12, FontWeight.bold,
                              'Lato', 0xff000000, '', false),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: textWidget('${'Product Type'.tr} : ', 12, FontWeight.normal,
                                'Lato', 0xff000000, '', false),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: textWidget("${_productDetailController.user.value?.response?.cateName?.en}", 12, FontWeight.bold, 'Lato',
                              0xff000000, '', false),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),

                    !["", null, false, 0].contains(_productDetailController.productColor.value.length)?
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: textWidget('${'Color'.tr} : ', 12, FontWeight.normal,
                                'Lato', 0xff000000, '', false),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:const EdgeInsets.only(left: 5),
                                child: textWidget('${_productDetailController.user.value?.response?.color}', 12, FontWeight.bold,
                                    'Lato', 0xff000000, '', false),
                              ),

                              Container(
                                width: 300,
                                height: 30,
                                child: ListView.builder(
                                    padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: _productDetailController.productColor.value.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      // String c="Colors.${_productDetailController.productColor.value[index]}";
                                      return Padding(padding: EdgeInsets.fromLTRB(5,0,5,0),
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: InkWell(
                                              onTap: (){
                                                // Get.off(ProductDetailView("${_productDetailController.user.value?.response?.productId}","${_productDetailController.user.value?.response?.esin}"));
                                                _productDetailController.getProductDetail("${_productDetailController.user.value?.response?.sId}","${_productDetailController.user.value?.response?.esin}","${_productDetailController.colorModel.value[index].id}","${_productDetailController.user.value?.response?.size}");
                                                _productDetailController.update();
                                                _productDetailController.pageController;
                                                _productDetailController.selectedPageIndex.value=0;

                                                // _cartController.getCartList();
                                                print("${_productDetailController.colorModel.value[index].id}");
                                                print('${_productDetailController.user.value?.response?.size}');
                                              },
                                              child: Container(
                                                height: 22,
                                                width: 22,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: "${_productDetailController.colorModel.value[index].id}"=="${_productDetailController.user.value?.response?.colorMap}"?Colors.black:Colors.transparent,
                                                        width: 2
                                                    ),
                                                    color: Colors.grey,
                                                    borderRadius: BorderRadius.circular(2)),
                                              ),
                                            )
                                        ),);
                                    }),
                              ),
                            ],
                          ),
                        ),





                        // Align(
                        //     alignment: Alignment.centerLeft,
                        //     child: Container(
                        //       height: 22,
                        //       width: 22,
                        //       decoration: BoxDecoration(
                        //           color: Colors.grey,
                        //           borderRadius: BorderRadius.circular(2)),
                        //     )),
                      ],
                    ):
                    Container(),
                    !["", null, false, 0].contains(_productDetailController.productColor.value.length)?SizedBox(
                      height: 12,
                    ):Container(),
                    !["", null, false, 0].contains(_productDetailController.productSize.value.length)?
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0,right: 5),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: textWidget('${'Size'.tr} : ', 12, FontWeight.normal,
                                'Lato', 0xff000000, '', false),
                          ),
                        ),
                        Container(
                          width: 300,
                          height: 30,
                          child: ListView.builder(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              scrollDirection: Axis.horizontal,
                              itemCount: _productDetailController.productSize.value.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                // String c="Colors.${_productDetailController.productColor.value[index]}";
                                return Padding(
                                    padding: EdgeInsets.fromLTRB(5,0,5,0),
                                    child: InkWell(
                                      onTap: (){
                                        // Get.off(ProductDetailView("${_productDetailController.user.value?.response?.productId}","${_productDetailController.user.value?.response?.esin}"));


                                        _productDetailController.getProductDetail("${_productDetailController.user.value?.response?.sId}","${_productDetailController.user.value?.response?.esin}","${_productDetailController.user.value?.response?.colorMap}","${_productDetailController.productSize.value[index]}");
                                        _productDetailController.update();
                                        // _cartController.getCartList();
                                        print("${_productDetailController.user.value?.response?.size}");
                                        print('${_productDetailController.productSize.value[index]}');
                                      },
                                      child: Container(
                                        padding: EdgeInsets.fromLTRB(5,2,5,2),
                                        height: 22,
                                        // width: 22,
                                        decoration: BoxDecoration(
                                            color: "${_productDetailController.user.value?.response?.size}"=='${_productDetailController.productSize.value[index]}'?Colors.lightBlue:Colors.white,
                                            border: Border.all(
                                              color: Colors.black,
                                            ),
                                            borderRadius: BorderRadius.all(Radius.circular(2))
                                          // borderRadius: BorderRadius.circular(2),
                                        ),
                                        child: Center(
                                          child: textWidget('${_productDetailController.productSize.value[index]}', 12,
                                              FontWeight.bold, 'Lato', 0xff000000, '', false),
                                        ),
                                      ),
                                    ));
                              }),
                        ),



                        // Align(
                        //     alignment: Alignment.centerLeft,
                        //     child: Container(
                        //       height: 22,
                        //       width: 22,
                        //       decoration: BoxDecoration(
                        //           color: Colors.grey,
                        //           borderRadius: BorderRadius.circular(2)),
                        //     )),
                      ],
                    ):
                    Container(),

                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: textWidget('${'Availability'.tr} : ', 12,
                                FontWeight.bold, 'Lato', 0xff000000, '', false),
                          ),
                        ),
                        (_productDetailController.user.value?.response?.quantity!="0")?
                        Align(
                          alignment: Alignment.centerLeft,
                          child: textWidget('In Stock'.tr, 12, FontWeight.normal,
                              'Lato', 0xff000000, '', false),
                        ):Align(
                          alignment: Alignment.centerLeft,
                          child: textWidget('Currently not available'.tr, 12, FontWeight.normal,
                              'Lato', 0xff000000, '', false),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: textWidget('${'Category'.tr} : ', 12, FontWeight.bold,
                                'Lato', 0xff000000, '', false),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: textWidget("${_productDetailController.user.value?.response?.subCateName?.en}", 12, FontWeight.normal,
                              'Lato', 0xff000000, '', false),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: textWidget('${'Shipping'.tr} : ', 12, FontWeight.bold,
                                'Lato', 0xff000000, '', false),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: textWidget('FREE', 12, FontWeight.normal, 'Lato',
                              0xff000000, '', false),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: textWidget('${'Deliver to'.tr} : ', 12, FontWeight.bold,
                                'Lato', 0xff000000, '', false),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: textWidget('Zip Code'.tr, 12,
                                  FontWeight.normal, 'Lato', 0xffBEBEBE, '', false),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: textWidget(
                                  'Availability'.tr,
                                  8,
                                  FontWeight.bold,
                                  'Lato',
                                  0xff000000,
                                  '',
                                  false),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: textWidget('Product Information'.tr, 12,
                            FontWeight.bold, 'Lato', 0xff000000, '', false),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: textWidget(
                            "${_productDetailController.user.value?.response?.description}",
                            12,
                            FontWeight.normal,
                            'Lato',
                            0xff000000,
                            '',
                            false),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: textWidget('Shipping and Return Policy'.tr, 12,
                            FontWeight.bold, 'Lato', 0xff000000, '', false),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: textWidget(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor minim veniam, quis nostrud  reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur',
                            12,
                            FontWeight.normal,
                            'Lato',
                            0xff000000,
                            '',
                            false),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: textWidget('Raise a query'.tr, 12, FontWeight.bold,
                            'Lato', 0xff000000, '', true),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: textWidget('customer Review'.tr, 12, FontWeight.bold,
                            'Lato', 0xff000000, '', false),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: textWidget('Write Review'.tr, 12, FontWeight.bold,
                            'Lato', 0xff00C569, '', false),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0,right: 10),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: SmoothStarRating(
                                  rating: !["", null, false, 0].contains(_productDetailController.ratingAvg.value)?_productDetailController.ratingAvg.value:0.0,
                                  spacing: 10,
                                  borderColor: Color(0xffAAAAAA),
                                  color: Color(0xffEBE300))),
                        ),
                        textWidget('(${_productDetailController.user.value?.variation?.ratingsCount} customer review)', 15, FontWeight.normal, 'Lato',
                            0xff464D53, '', false),
                      ],
                    ),

                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: textWidget('${_productDetailController.ratingAvg.value}/5.0', 20, FontWeight.bold, 'Lato',
                            0xff000000, '', false),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 24.0, bottom: 10),
                    //   child: Align(
                    //       alignment: Alignment.centerLeft,
                    //       child: Row(
                    //         children: [
                    //           textWidget('5 Stars', 12, FontWeight.normal, 'Lato',
                    //               0xff464D53, '', false),
                    //           SizedBox(
                    //             width: 5,
                    //           ),
                    //           Stack(
                    //             children: [
                    //               Container(
                    //                 height: 12,
                    //                 width: 100,
                    //                 decoration:
                    //                 BoxDecoration(color: Color(0xff989FA7)),
                    //               ),
                    //               Container(
                    //                 height: 12,
                    //                 width: 70,
                    //                 decoration: BoxDecoration(
                    //                   gradient: new LinearGradient(
                    //                       colors: [
                    //                         Color(0xff27439F),
                    //                         Color(0xff00ADEF),
                    //                       ],
                    //                       begin: const FractionalOffset(0.0, 2.0),
                    //                       end: FractionalOffset(1.0, 2),
                    //                       stops: [0.0, 1.0],
                    //                       tileMode: TileMode.repeated),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //           SizedBox(
                    //             width: 5,
                    //           ),
                    //           textWidget('72', 12, FontWeight.normal, 'Lato',
                    //               0xff464D53, '', false),
                    //         ],
                    //       )),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 24.0, bottom: 10),
                    //   child: Align(
                    //       alignment: Alignment.centerLeft,
                    //       child: Row(
                    //         children: [
                    //           textWidget('4 Stars', 12, FontWeight.normal, 'Lato',
                    //               0xff464D53, '', false),
                    //           SizedBox(
                    //             width: 5,
                    //           ),
                    //           Stack(
                    //             children: [
                    //               Container(
                    //                 height: 12,
                    //                 width: 100,
                    //                 decoration:
                    //                 BoxDecoration(color: Color(0xff989FA7)),
                    //               ),
                    //               Container(
                    //                 height: 12,
                    //                 width: 40,
                    //                 decoration: BoxDecoration(
                    //                   gradient: new LinearGradient(
                    //                       colors: [
                    //                         Color(0xff27439F),
                    //                         Color(0xff00ADEF),
                    //                       ],
                    //                       begin: const FractionalOffset(0.0, 2.0),
                    //                       end: FractionalOffset(1.0, 2),
                    //                       stops: [0.0, 1.0],
                    //                       tileMode: TileMode.repeated),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //           SizedBox(
                    //             width: 5,
                    //           ),
                    //           textWidget('34', 12, FontWeight.normal, 'Lato',
                    //               0xff464D53, '', false),
                    //         ],
                    //       )),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 24.0, bottom: 10),
                    //   child: Align(
                    //       alignment: Alignment.centerLeft,
                    //       child: Row(
                    //         children: [
                    //           textWidget('3 Stars', 12, FontWeight.normal, 'Lato',
                    //               0xff464D53, '', false),
                    //           SizedBox(
                    //             width: 5,
                    //           ),
                    //           Stack(
                    //             children: [
                    //               Container(
                    //                 height: 12,
                    //                 width: 100,
                    //                 decoration:
                    //                 BoxDecoration(color: Color(0xff989FA7)),
                    //               ),
                    //               Container(
                    //                 height: 12,
                    //                 width: 35,
                    //                 decoration: BoxDecoration(
                    //                   gradient: new LinearGradient(
                    //                       colors: [
                    //                         Color(0xff27439F),
                    //                         Color(0xff00ADEF),
                    //                       ],
                    //                       begin: const FractionalOffset(0.0, 2.0),
                    //                       end: FractionalOffset(1.0, 2),
                    //                       stops: [0.0, 1.0],
                    //                       tileMode: TileMode.repeated),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //           SizedBox(
                    //             width: 5,
                    //           ),
                    //           textWidget('35', 12, FontWeight.normal, 'Lato',
                    //               0xff464D53, '', false),
                    //         ],
                    //       )),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 24.0, bottom: 10),
                    //   child: Align(
                    //       alignment: Alignment.centerLeft,
                    //       child: Row(
                    //         children: [
                    //           textWidget('2 Stars', 12, FontWeight.normal, 'Lato',
                    //               0xff464D53, '', false),
                    //           SizedBox(
                    //             width: 5,
                    //           ),
                    //           Stack(
                    //             children: [
                    //               Container(
                    //                 height: 12,
                    //                 width: 100,
                    //                 decoration:
                    //                 BoxDecoration(color: Color(0xff989FA7)),
                    //               ),
                    //               Container(
                    //                 height: 12,
                    //                 width: 30,
                    //                 decoration: BoxDecoration(
                    //                   gradient: new LinearGradient(
                    //                       colors: [
                    //                         Color(0xff27439F),
                    //                         Color(0xff00ADEF),
                    //                       ],
                    //                       begin: const FractionalOffset(0.0, 2.0),
                    //                       end: FractionalOffset(1.0, 2),
                    //                       stops: [0.0, 1.0],
                    //                       tileMode: TileMode.repeated),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //           SizedBox(
                    //             width: 5,
                    //           ),
                    //           textWidget('30', 12, FontWeight.normal, 'Lato',
                    //               0xff464D53, '', false),
                    //         ],
                    //       )),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 24.0, bottom: 10),
                    //   child: Align(
                    //       alignment: Alignment.centerLeft,
                    //       child: Row(
                    //         children: [
                    //           textWidget('1 Stars', 12, FontWeight.normal, 'Lato',
                    //               0xff464D53, '', false),
                    //           SizedBox(
                    //             width: 5,
                    //           ),
                    //           Stack(
                    //             children: [
                    //               Container(
                    //                 height: 12,
                    //                 width: 100,
                    //                 decoration:
                    //                 BoxDecoration(color: Color(0xff989FA7)),
                    //               ),
                    //               Container(
                    //                 height: 12,
                    //                 width: 20,
                    //                 decoration: BoxDecoration(
                    //                   gradient: new LinearGradient(
                    //                       colors: [
                    //                         Color(0xff27439F),
                    //                         Color(0xff00ADEF),
                    //                       ],
                    //                       begin: const FractionalOffset(0.0, 2.0),
                    //                       end: FractionalOffset(1.0, 2),
                    //                       stops: [0.0, 1.0],
                    //                       tileMode: TileMode.repeated),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //           SizedBox(
                    //             width: 5,
                    //           ),
                    //           textWidget('20', 12, FontWeight.normal, 'Lato',
                    //               0xff464D53, '', false),
                    //         ],
                    //       )),
                    // ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 24.0, right: 24, bottom: height * 0.012),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textWidget('Review with Images'.tr, 12, FontWeight.bold,
                              'Lato', 0xff000000, '', false),
                          textWidget('See all images'.tr, 12, FontWeight.normal,
                              'Lato', 0xff000000, '', true)
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 18.0, bottom: height * 0.04),
                      child: Container(
                        height: 90,
                        width: width,
                        child: ListView.builder(
                            itemCount: 6,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  // padding: EdgeInsets.only(top: 20),
                                  height: 73,
                                  width: 86,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/demoimage.png')),
                                      borderRadius: BorderRadius.circular(4),
                                      color: Colors.white),
                                ),
                              );
                            }),
                      ),
                    ),

                    Container(
                      // height: height*0.14,
                      child: ListView.builder(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                          itemCount: _productDetailController.productRating.value.length,
                          shrinkWrap: true,
                          // physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            // String s = DateFormat("dd/MM/yyyy").format(DateTime.parse("2022-03-30T18:56:17.33Z"));
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: 5.0, right: 14, bottom: 10),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 0.0, right: 0, bottom: height * 0.012),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    !["", null, false, 0].contains(_productDetailController.productRating.value[index].profilePic)?
                                    CircleAvatar(
                                      radius: 30, // Image radius
                                      backgroundImage:
                                      NetworkImage("${_productDetailController.productRating.value[index].profilePic}"),
                                    ):
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundImage:
                                      AssetImage('assets/images/demoimage.png'),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        textWidget("${_productDetailController.productRating.value[index].name}", 16, FontWeight.bold,
                                            'Lato', 0xff000000, '', false),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        // textWidget('Best Speaker', 12, FontWeight.normal,
                                        //     'Lato', 0xff000000, '', false),
                                        // SizedBox(
                                        //   height: 5,
                                        // ),
                                        Container(
                                          width: width * 0.4,
                                          child: textWidget(
                                              "${_productDetailController.productRating.value[index].review}",
                                              12,
                                              FontWeight.normal,
                                              'Lato',
                                              0xff000000,
                                              '',
                                              false),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        SmoothStarRating(
                                            rating: double.parse("${_productDetailController.productRating.value[index].rate}"),
                                            starCount: 5,
                                            spacing: 2,
                                            size: 20,
                                            borderColor: Color(0xffAAAAAA),
                                            color: Color(0xffEBE300)),
                                        textWidget('${DateFormat("dd/MM/yyyy").format(DateTime.parse("2022-03-30T18:56:17.33Z"))}', 12, FontWeight.bold, 'Lato',
                                            0xff989FA7, '', false),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),


                    Padding(
                      padding: EdgeInsets.only(
                          left: 24.0, right: 24, bottom: height * 0.012),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textWidget('Review with Images'.tr, 12, FontWeight.bold,
                              'Lato', 0xffFFFFF, '', false),
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => AllReviews()));
                            },
                            child: textWidget('See all Reviews', 12,
                                FontWeight.normal, 'Lato', 0xff000000, '', true),
                          )
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(
                    //       left: 20.0, right: 24, bottom: height * 0.012),
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.end,
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       textWidget('Related Products', 16, FontWeight.bold,
                    //           'Lato', 0xff000000, '', false),
                    //     ],
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 18.0),
                    //   child: Container(
                    //     height: height * 0.5,
                    //     child: ListView.builder(
                    //         shrinkWrap: true,
                    //         itemCount: 4,
                    //         scrollDirection: Axis.horizontal,
                    //         physics: ClampingScrollPhysics(),
                    //         itemBuilder: (context, index) {
                    //           return Padding(
                    //             padding: EdgeInsets.only(
                    //                 left: 0.0, right: 0, bottom: height * 0.0),
                    //             child: Row(
                    //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //               children: [
                    //                 Container(
                    //                   height: 317,
                    //                   width: width * 0.45,
                    //                   child: Column(
                    //                     // mainAxisAlignment: MainAxisAlignment.start,
                    //                     crossAxisAlignment:
                    //                     CrossAxisAlignment.start,
                    //                     children: [
                    //                       Container(
                    //                         height: 240,
                    //                         width: width * 0.4,
                    //                         decoration: BoxDecoration(
                    //                             image: DecorationImage(
                    //                                 image: AssetImage(
                    //                                   'assets/images/demoimage.png',
                    //                                 ),
                    //                                 fit: BoxFit.fill)),
                    //                       ),
                    //                       SizedBox(
                    //                         height: 12,
                    //                       ),
                    //                       textWidget("New", 16, FontWeight.bold,
                    //                           'Lato', 0xff000000, '', false),
                    //                       SizedBox(
                    //                         height: 5,
                    //                       ),
                    //                       textWidget(
                    //                           'Men Black T-Shirt',
                    //                           12,
                    //                           FontWeight.normal,
                    //                           'Lato',
                    //                           0xff929292,
                    //                           '',
                    //                           false),
                    //                       SizedBox(
                    //                         height: 5,
                    //                       ),
                    //                       Padding(
                    //                         padding:
                    //                         const EdgeInsets.only(right: 25.0),
                    //                         child: Row(
                    //                           mainAxisAlignment:
                    //                           MainAxisAlignment.spaceBetween,
                    //                           children: [
                    //                             textWidget(
                    //                                 '\$30',
                    //                                 16,
                    //                                 FontWeight.bold,
                    //                                 'Lato',
                    //                                 0xff000000,
                    //                                 '',
                    //                                 false),
                    //                             SvgPicture.asset(
                    //                               'assets/images/HeartOut.svg',
                    //                               height: 16,
                    //                             )
                    //                           ],
                    //                         ),
                    //                       )
                    //                     ],
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           );
                    //         }),
                    //   ),
                    // )
                  ],
                ),
              )
            ],
          ),

        ),

        )
    );




  }
}
