import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripmate/core/app_exports.dart';
import '../../widgets/custom_elevated_button.dart';
import 'package:lottie/lottie.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'controller/onboarding_two_controller.dart';

class OnboardingOneScreen extends StatelessWidget {
  OnboardingOneScreen({Key? key}) : super(key: key);

  final OnboardingController controller = OnboardingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Gap(size.height * 0.1),
            Expanded(
              child: PageView(
                controller: controller.pageController,
                onPageChanged: (index) {
                  controller.currentIndex.value = index;
                },
                children: [
                  _buildPage(
                    size,
                    ImageConstant.baganimation,
                    "Pack your bag",
                    "Welcome to our travel app! Ensure you have your essentials: passport, tickets, and itinerary. Our app keeps your travel details organized so you can enjoy your journey.",
                  ),
                  _buildPage(
                    size,
                    ImageConstant.travelanimation,
                    "It's Travel Time",
                    "Your adventure awaits! With everything in order, you’re all set to embark on your trip. Let our app guide you every step of the way.",
                  ),
                  _buildPage(
                    size,
                    ImageConstant.walkingMan,
                    "Let's Get Started",
                    "Get the most out of the Tripmate app! This quick guide will introduce you to the features that will make your life easier.",
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  controller: controller.pageController,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    dotHeight: 15,
                    dotWidth: 20,
                    activeDotColor: Color(0XFF0C3A2D),
                  ),
                  onDotClicked: (index) {
                    controller.pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                ),
              ],
            ),
            Gap(size.height * 0.01),
            Obx(() {
              return controller.currentIndex.value == 2
                  ? CustomElevatedButton(
                      text: "Let's Get Started",
                      margin:
                          EdgeInsets.symmetric(horizontal: size.width * 0.1),
                      buttonStyle: CustomButtonStyles.outlinePrimaryTL10,
                      buttonTextStyle: CustomTextStyles.titleLargeBold,
                      alignment: Alignment.center,
                      onPressed: () {
                        controller.completeOnboarding();
                      },
                    )
                  : CustomElevatedButton(
                      text: "Next",
                      margin:
                          EdgeInsets.symmetric(horizontal: size.width * 0.1),
                      buttonStyle: CustomButtonStyles.outlinePrimaryTL10,
                      buttonTextStyle: CustomTextStyles.titleLargeBold,
                      alignment: Alignment.center,
                      onPressed: () {
                        controller.pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                    );
            }),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(
    Size size,
    String animationPath,
    String title,
    String description,
  ) {
    return SingleChildScrollView(
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.06,
          vertical: size.height * 0.03,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.95,
              child: Lottie.asset(animationPath),
            ),
            Gap(size.height * 0.01),
            Container(
              width: size.width * 0.85,
              margin: EdgeInsets.only(top: size.height * 0.02),
              child: Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF0C3A2D),
                  fontSize:
                      size.height * 0.04, // Adjust size based on screen height
                ),
              ),
            ),
            Container(
              width: size.width * 0.85,
              margin: EdgeInsets.only(top: size.height * 0.01),
              child: Text(
                description,
                textAlign: TextAlign.center,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Color(0XFF0C3A2D),
                  fontSize:
                      size.height * 0.02, // Adjust size based on screen height
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
