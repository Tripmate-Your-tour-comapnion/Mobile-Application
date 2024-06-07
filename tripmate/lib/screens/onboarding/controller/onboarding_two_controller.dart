import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../../core/app_exports.dart';

class OnboardingController extends GetxController {
  final box = GetStorage();

  PageController pageController = PageController();

  var currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    pageController.addListener(() {
      currentIndex.value = pageController.page!.round();
      update();
    });
  }

  void completeOnboarding() {
    box.write('FirstTime', false);
    Get.offAllNamed(AppRoutes.registerationScreen);
  }
}
