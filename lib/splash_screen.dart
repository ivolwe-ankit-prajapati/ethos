import 'package:ethos/modules/auth/views/login_view.dart';
import 'package:ethos/modules/landingpage/view/landingpage_view.dart';
import 'package:ethos/views/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  SplashView({ Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  Future navigate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLogin = prefs.getBool('isLogin');

    // print(customer_login);
    if (isLogin ?? false) {
      _goto_Dashboard();
    } else {
      _goto_authView();
    }
  }


  @override
  void initState() {

    super.initState();
    // SharedPreferences.setMockInitialValues({});
    print("<<splash");


    navigate();
  }

  _goto_nextView() {
    Future.delayed(Duration(seconds: 3), () => Get.offAll(OnboardingPage()));
  }

  _goto_Dashboard() {
    Future.delayed(Duration(seconds: 3), () => Get.offAll(LandingPage()));
  }



  _goto_authView() {
    Future.delayed(Duration(seconds: 3), () => Get.offAll(LoginView()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(80.0),
            child: SvgPicture.asset(
              'assets/images/Logo.svg',
              height: 40,
            ),
          ),
        ));
  }
}