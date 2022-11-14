
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingPage extends StatelessWidget {
  final _controller = OnboardingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
                controller: _controller.pageController,
                onPageChanged: _controller.selectedPageIndex,
                itemCount: _controller.onboardingPages.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          _controller.onboardingPages[index].imageAsset,),
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(30),
                            child: Center(
                              child: SvgPicture.asset('assets/images/Logo.svg'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 64.0),
                            child: Text(
                              _controller.onboardingPages[index].description,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                            ),
                          ),

                          // SizedBox(height: 32),
                          // Text(
                          //   _controller.onboardingPages[index].title,
                          //   style: TextStyle(
                          //       fontSize: 24, fontWeight: FontWeight.w500),
                          // ),
                          // SizedBox(height: 32),
                        ],
                      ),
                    ],
                  );
                }),
            Positioned(
              top: 168,
              left: 168,
              child: Row(
                children: List.generate(
                  _controller.onboardingPages.length,
                  (index) => Obx(() {
                    return Container(
                      margin: const EdgeInsets.all(4),
                      width: _controller.selectedPageIndex.value == index? 8 :6,
                      height: _controller.selectedPageIndex.value == index? 8 :6,
                      decoration: BoxDecoration(
                        color: _controller.selectedPageIndex.value == index
                            ? Colors.black
                            : const Color(0xff707070).withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width*0.35,
              bottom: 20,
              child: Container(
                height: 30.0,
                width: 138.0,

                decoration: BoxDecoration(
                  color: const Color(0xffB9DFFF),
                  border: Border.all(
                    color: Colors.black.withOpacity(0.5)
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(35),
                  ),
                ),
                child: GestureDetector(


                  // elevation: 0,
                  onTap: _controller.forwardAction,
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(10.0),
                  // ),
                  child: Obx(() {
                    return Center(
                      child: Text(_controller.isLastPage ? 'Go'.tr : '${'Next'.tr} >',style: const TextStyle(fontSize: 12,color: Colors.black),),
                    );
                  }),
                ),
              ),

            ),
          ],
        ),
      ),
    );
  }
}
