import 'package:ethos/changeLanguage/change_laguage.dart';
import 'package:ethos/modules/auth/controllers/login_controller.dart';
import 'package:ethos/modules/auth/views/login_view.dart';
import 'package:ethos/modules/my_profile/model/myprofile_model.dart';
import 'package:ethos/modules/my_profile/view/edit_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../Constants/Constants.dart';
import '../../addresses/addressList/view/address_list_view.dart';
import '../../wishlist/view/wishlist_view.dart';
import '../controller/myprofile_controller.dart';

class MyProfile extends GetView<MyProfileController> {
  MyProfileController myProfileController = Get.put(MyProfileController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Obx(
            (){
              return Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 24.0, top: height * 0.03),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // CircleAvatar(
                              //   radius: 50,
                              //   backgroundImage:(![
                              //     "",
                              //     null,
                              //     false,
                              //     0,
                              //   ].contains(profilePic))
                              //       ? NetworkImage(
                              //     "http://ec2-18-216-49-233.us-east-2.compute.amazonaws.com/api/user-images/" +
                              //         profilePic,
                              //   )
                              //       : AssetImage(
                              //     "assets/images/demoimage.png",
                              //   ),
                              //       // AssetImage("assets/images/demoimage.png"),
                              // ),
                              CircleAvatar(
                                radius: 50,
                                backgroundImage:AssetImage(
                                  "assets/images/demoimage.png",
                                ),
                                // AssetImage("assets/images/demoimage.png"),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: width * 0.62,
                                    child: textWidget(
                                        "${myProfileController.user.value?.response?.firstName} ${myProfileController.user.value?.response?.lastName}",
                                         26, FontWeight.normal,
                                        'Lato', 0xff000000, '', false),
                                  ),
                                  Container(
                                    width: width * 0.5,
                                    child: textWidget(
                                        "${myProfileController.user.value?.response?.emailId}",
                                        14,
                                        FontWeight.normal,
                                        'Lato',
                                        0xff000000,
                                        '',
                                        false),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Material(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(4),
                            splashColor: Color(0xff0864B1),
                            onTap: () {
                              Get.to(EditProfile());
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => EditProfile()));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.0,
                                  top: height * 0.05,
                                  right: 24,
                                  bottom: height * 0.01),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset('assets/images/editicon.svg'),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      textWidget('Edit Profile', 16, FontWeight.normal,
                                          'Lato', 0xff000000, '', false),
                                    ],
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Material(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(4),
                            splashColor: Color(0xff0864B1),
                            onDoubleTap: () {
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (context) => Address()));
                            },
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddressListView()));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.0,
                                  top: height * 0.05,
                                  right: 24,
                                  bottom: height * 0.01),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset('assets/images/myaddress.svg'),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      textWidget('My Address', 16, FontWeight.normal,
                                          'Lato', 0xff000000, '', false),
                                    ],
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Material(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(4),
                            splashColor: Color(0xff0864B1),
                            onDoubleTap: () {
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (context) => Address()));
                            },
                            onTap: () {
                              Get.to(WishListView("myProfile"));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.0,
                                  top: height * 0.05,
                                  right: 24,
                                  bottom: height * 0.01),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset('assets/images/wishlisticon.svg'),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      textWidget('Wishlist', 16, FontWeight.normal, 'Lato',
                                          0xff000000, '', false),
                                    ],
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                        Material(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(4),
                            splashColor: Color(0xff0864B1),
                            onDoubleTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => OrderHistoryItems()));
                            },
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => OrderHistory()));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.0,
                                  top: height * 0.05,
                                  right: 24,
                                  bottom: height * 0.01),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/orderhistoryicon.svg'),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      textWidget('Order History', 16, FontWeight.normal,
                                          'Lato', 0xff000000, '', false),
                                    ],
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Material(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(4),
                            splashColor: Color(0xff0864B1),
                            onDoubleTap: () {
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (context) => NoQuery()));
                            },
                            onTap: () {
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (context) => MyQuery()));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.0,
                                  top: height * 0.05,
                                  right: 24,
                                  bottom: height * 0.01),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset('assets/images/myqueryicon.svg'),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      textWidget('My Queries', 16, FontWeight.normal,
                                          'Lato', 0xff000000, '', false),
                                    ],
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 24.0,
                              top: height * 0.05,
                              right: 24,
                              bottom: height * 0.01),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset('assets/images/cardsicon.svg'),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  textWidget('Cards', 16, FontWeight.normal, 'Lato',
                                      0xff000000, '', false),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 24.0,
                              top: height * 0.05,
                              right: 24,
                              bottom: height * 0.01),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                      'assets/images/notificationicon.svg'),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  textWidget('Notifications', 16, FontWeight.normal,
                                      'Lato', 0xff000000, '', false),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                              )
                            ],
                          ),
                        ),

                        Material(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(4),
                            splashColor: Color(0xff0864B1),
                            onDoubleTap: () {
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (context) => NoQuery()));
                            },
                            onTap: () {
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (context) => MyQuery()));
                              // myProfileController.erase();
                              Get.to(ChangeLaguage());
                              
                            },
                            child:Padding(
                              padding: EdgeInsets.only(
                                  left: 24.0,
                                  top: height * 0.05,
                                  right: 24,
                                  bottom: height * 0.01),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset('assets/images/currencyicon.svg'),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      textWidget('Currency and language', 16,
                                          FontWeight.normal, 'Lato', 0xff000000, '', false),
                                    ],
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Material(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(4),
                            splashColor: Color(0xff0864B1),
                            onDoubleTap: () {
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (context) => NoQuery()));
                            },
                            onTap: () {
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (context) => MyQuery()));
                              // myProfileController.erase();
                              // Get.offAll(LoginView());
                              Get.defaultDialog(
                                title: "Logout",
                                textCancel: "No",
                                textConfirm: "Yes",
                                onCancel: (){
                                  // navigator.pop();
                                },
                                  onConfirm: (){
                                    myProfileController.erase();
                                    // Get.put(LoginController());
                                    // Get.offAll(() => LoginView());
                                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                        LoginView()), (Route<dynamic> route) => false);
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             LoginView()));
                                    // Get.offAll(LoginView());
                                  },
                                middleText: "Are you sure you want to logout?"

                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.0,
                                  top: height * 0.05,
                                  right: 24,
                                  bottom: height * 0.05),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset('assets/images/logouticon.svg'),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      textWidget('Log Out', 16, FontWeight.normal, 'Lato',
                                          0xff000000, '', false),
                                    ],
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  )
                ],
              );
            }
        ));
  }
}
