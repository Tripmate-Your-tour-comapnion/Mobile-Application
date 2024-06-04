import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tripmate/core/app_exports.dart';
import '../../widgets/custom_elevated_button.dart';
import 'package:lottie/lottie.dart';

import 'controller/onboarding_two_controller.dart';

class OnboardingOneScreen extends StatefulWidget {
  const OnboardingOneScreen({Key? key}) : super(key: key);

  @override
  _OnboardingOneScreenState createState() => _OnboardingOneScreenState();
}

class _OnboardingOneScreenState extends State<OnboardingOneScreen> {
  final PageController _pageController = PageController();
  late ImageProvider gifProvider;
  var currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentIndex = _pageController.page!.round();
      });
    });
    gifProvider = AssetImage(ImageConstant.map);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Gap(size.height * 0.1),
            Expanded(
              child: PageView(
                controller: _pageController,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.03,
                        vertical: size.height * 0.0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: size.width * 0.85,
                            child: Lottie.asset(ImageConstant.baganimation),
                          ),
                          const Gap(60),
                          Container(
                            width: 311,
                            margin: EdgeInsets.only(left: size.width * 0.04),
                            child: Text(
                              "Pack your bag",
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.onPrimary,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            width: 311,
                            height: 100,
                            margin: EdgeInsets.only(left: size.width * 0.04),
                            child: Text(
                              "Welcome to our travel app! Ensure you have your essentials: passport, tickets, and itinerary. Our app keeps your travel details organized so you can enjoy your journey.",
                              textAlign: TextAlign.center,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: theme.colorScheme.onPrimary,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.06,
                        vertical: size.height * 0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Gap(45),
                          SizedBox(
                            width: size.width * 0.85,
                            child: Lottie.asset(ImageConstant.travelanimation),
                          ),
                          const Gap(80),
                          Container(
                            width: 311,
                            margin: EdgeInsets.only(left: size.width * 0.04),
                            child: Text(
                              "It's Travel Time",
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.onPrimary,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            width: 311,
                            margin: EdgeInsets.only(left: size.width * 0.04),
                            child: Text(
                              "Your adventure awaits! With everything in order, you’re all set to embark on your trip. Let our app guide you every step of the way.",
                              textAlign: TextAlign.center,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: theme.colorScheme.onPrimary,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.06,
                        vertical: size.height * 0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Gap(45),
                          SizedBox(
                              width: size.width * 0.85,
                              child: Lottie.asset(ImageConstant.walkingMan)),
                          const Gap(40),
                          Container(
                            width: 311,
                            margin: EdgeInsets.only(left: size.width * 0.04),
                            child: Text(
                              "Let's Get Started",
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.onPrimary,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            width: 311,
                            margin: EdgeInsets.only(left: size.width * 0.04),
                            child: Text(
                              "Get the most out of the Tripmate app! This quick guide will introduce you to the features that will make your life easier.",
                              textAlign: TextAlign.center,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: theme.colorScheme.onPrimary,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Gap(40),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    dotHeight: 15,
                    dotWidth: 20,
                    activeDotColor: theme.colorScheme.onPrimary,
                  ),
                  onDotClicked: (index) {
                    _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                    print(currentIndex);
                  },
                ),
                const Gap(40),
              ],
            ),
            const SizedBox(height: 40),
            currentIndex == 2
                ? CustomElevatedButton(
                    text: "Let's Get Started",
                    margin: const EdgeInsets.symmetric(horizontal: 43),
                    buttonStyle: CustomButtonStyles.outlinePrimaryTL10,
                    buttonTextStyle: CustomTextStyles.titleLargeBold,
                    alignment: Alignment.center,
                    onPressed: () {
                      Controller().completeOnboarding();
                    },
                  )
                : CustomElevatedButton(
                    text: "Next",
                    margin: const EdgeInsets.symmetric(horizontal: 43),
                    buttonStyle: CustomButtonStyles.outlinePrimaryTL10,
                    buttonTextStyle: CustomTextStyles.titleLargeBold,
                    alignment: Alignment.center,
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                      print(currentIndex);
                    },
                  ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
