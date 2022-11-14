import 'package:cached_network_image/cached_network_image.dart';
import 'package:ethos/modules/auth/controllers/login_controller.dart';
import 'package:ethos/modules/auth/views/login_view.dart';
import 'package:ethos/modules/my_profile/model/myprofile_model.dart';
import 'package:ethos/modules/my_profile/view/edit_profile_view.dart';
import 'package:ethos/modules/sub_category/view/sub_category_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../Constants/Constants.dart';
import '../../addresses/addressList/view/address_list_view.dart';
import '../../landingpage/view/landingpage_view.dart';
import '../../wishlist/view/wishlist_view.dart';
import '../controller/category_controller.dart';

class Categories extends GetView<CategoriesController> {
  CategoriesController _categoriesController = Get.put(CategoriesController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(LandingPage());
        return true;
      },
        child: Scaffold(
        body: Obx(
                (){
              return Stack(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 24.0, top: height * 0.03, bottom: height * 0.03),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  // Icon(Icons.arrow_back_ios),
                                  textWidget('All Categories'.tr, 24, FontWeight.bold, 'Lato',
                                      0xff000000, '', false),
                                ],
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(right: 24.0),
                              //   child: Row(
                              //     children: [
                              //       SvgPicture.asset(
                              //         'assets/images/searchicon.svg',
                              //         height: 16,
                              //       ),
                              //       SizedBox(
                              //         width: 10,
                              //       ),
                              //       SvgPicture.asset(
                              //         'assets/images/HeartOut.svg',
                              //         height: 16,
                              //       ),
                              //       SizedBox(
                              //         width: 10,
                              //       ),
                              //       SvgPicture.asset(
                              //         'assets/images/CartOut.svg',
                              //         height: 16,
                              //       )
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                      if (_categoriesController.isCategoriesLoading.value == 0)
                        Container(
                          child: CircularProgressIndicator(),
                        ),
                      if (_categoriesController.isCategoriesLoading.value == 2)
                        Container(
                          child: Center(child: Text("No Product found".tr)),
                        ),
                      if (_categoriesController.isCategoriesLoading.value == 1)
                        Expanded(
                          child: ListView.builder(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              itemCount: _categoriesController.categoryData.value.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Theme(
                                    data: Theme.of(context)
                                        .copyWith(dividerColor: Colors.transparent),
                                    child: ExpansionTile(
                                      maintainState: true,
                                      backgroundColor: Colors.transparent,
                                      title: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: "${_categoriesController.categoryData[index].image}",
                                            placeholder: (context, url) => const CircleAvatar(
                                              backgroundColor: Colors.amber,
                                              radius: 20,
                                            ),
                                            imageBuilder: (context, image) => CircleAvatar(
                                              backgroundImage: image,
                                              radius: 20,
                                            ),
                                          ),

                                          // SvgPicture.asset(
                                          //   'assets/images/Shoe.svg',
                                          //   height: 20,
                                          // ),
                                          SizedBox(
                                            width: width * 0.12,
                                          ),
                                          Expanded(child: InkWell(
                                            onTap: (){
                                              Get.to(SubCategory("categories", "${_categoriesController.categoryData[index].sId}", "","${_categoriesController.categoryData[index].name?.en}",""));
                                            },
                                            child: textWidget("${_categoriesController.categoryData[index].name?.en}", 24, FontWeight.bold, 'Lato',
                                                0xff000000, '', false),
                                          )
                                          ),

                                        ],
                                      ),
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) => CategoriesPageTwo()));
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(left: width * 0.27),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: ListView.builder(
                                                  physics: NeverScrollableScrollPhysics(),
                                                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                  itemCount: _categoriesController.categoryData[index].children?.length,
                                                  shrinkWrap: true,
                                                  itemBuilder: (context, ind) {
                                                    return InkWell(
                                                      onTap: (){
                                                        Get.to(SubCategory("categories", "${_categoriesController.categoryData[index].sId}", "${_categoriesController.categoryData[index].children![ind].sId}","${_categoriesController.categoryData[index].name?.en}","${_categoriesController.categoryData[index].children![ind].name?.en}"));
                                                      },
                                                      child: Padding(
                                                        padding: EdgeInsets.only(
                                                            left: 5.0, right: 14, bottom: 10),
                                                        child: textWidget("${_categoriesController.categoryData[index].children![ind].name?.en}", 16, FontWeight.normal,
                                                            'Lato', 0xff000000, '', false),
                                                      ),
                                                    );
                                                  }),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),

                    ],
                  )
                ],
              );
            }
        )),
        );
  }
}
