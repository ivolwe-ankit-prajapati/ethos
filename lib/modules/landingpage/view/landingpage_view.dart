import 'package:ethos/modules/categories/view/category_view.dart';
import 'package:ethos/modules/my_profile/view/myprofile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../homepage/view/homepage.dart';
import '../controller/landingpage_controller.dart';

class LandingPage extends StatelessWidget {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle =
  TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => BottomNavigationBar(
      showUnselectedLabels: false,
      showSelectedLabels: false,
      onTap: landingPageController.changeTabIndex,
      currentIndex: landingPageController.tabIndex.value,
      backgroundColor: Color(0xffF7F7F7),
      unselectedItemColor: Colors.white.withOpacity(0.5),
      selectedItemColor: Colors.white,
      unselectedLabelStyle: unselectedLabelStyle,
      selectedLabelStyle: selectedLabelStyle,
      items: [
        BottomNavigationBarItem(
          icon: Container(
            margin: EdgeInsets.only(bottom: 4),
            child: SvgPicture.asset(
              'assets/images/dis_home.svg',
            ),
          ),
          activeIcon: SvgPicture.asset(
            'assets/images/enab_home.svg',
            fit: BoxFit.fitHeight,
          ),
          label: "",
          // backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
        ),
        BottomNavigationBarItem(
          icon: Container(
            margin: EdgeInsets.only(bottom: 4),
            child: SvgPicture.asset(
              'assets/images/pigDis.svg',
              fit: BoxFit.fitHeight,
            ),
          ),
          label: '',
          // backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
          activeIcon: SvgPicture.asset(
            'assets/images/pigEnab.svg',
            fit: BoxFit.fitHeight,
          ),
        ),
        BottomNavigationBarItem(
          icon: Container(
            margin: EdgeInsets.only(bottom: 4),
            child: SvgPicture.asset(
              'assets/images/dis_tut.svg',
              fit: BoxFit.fitHeight,
            ),
          ),
          label: '',
          activeIcon: SvgPicture.asset(
            'assets/images/enab_tut.svg',
            fit: BoxFit.fitHeight,
          ),
          // backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
        ),

      ],
    ),);
  }

  @override
  Widget build(BuildContext context) {
    final LandingPageController landingPageController = Get.put(LandingPageController(), permanent: false);
    return SafeArea(
        child: Scaffold(
          bottomNavigationBar:
          buildBottomNavigationMenu(context, landingPageController),
          body: Obx(() => IndexedStack(
            index: landingPageController.tabIndex.value,
            children: [
              HomePage(),
              Categories(),
              MyProfile(),
            ],
          )),
        ));
  }
}