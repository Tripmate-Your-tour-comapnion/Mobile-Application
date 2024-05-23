

import '../../../core/app_exports.dart';


class SplashScreenController extends GetxController{

@override
  void onReady() {
   Future.delayed(const Duration(seconds: 2), () {
  print("Navigating...");
  Get.offNamed(AppRoutes.onboardingoneScreen);
});
  }

}

  