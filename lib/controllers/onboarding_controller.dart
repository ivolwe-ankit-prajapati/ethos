import 'package:ethos/modules/auth/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';

import '../models/onboarding_info.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
      Get.to(LoginView());
    } else
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo('assets/images/onb_first.png', 'Order Your Food',
        'Lorem ipsum dolor sit amet,\n consetetur elitr.'),
    OnboardingInfo('assets/images/onb_second.png', 'Cooking Safe Food',
        'Lorem ipsum dolor sit amet,\n consetetur elitr.'),
    OnboardingInfo('assets/images/onb_third.png', 'Quick Delivery',
        'Lorem ipsum dolor sit amet,\n consetetur elitr.')
  ];
}
