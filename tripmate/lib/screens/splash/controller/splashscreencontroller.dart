import 'package:get_storage/get_storage.dart';

import '../../../core/app_exports.dart';

class SplashScreenController extends GetxController {
  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 2), () {
      print("Navigating...");
      final tripmate = GetStorage();
      if (tripmate.read('isOpendBefore')) {
        Get.offNamed(AppRoutes.registerationScreen);
      } else {
        Get.offNamed(AppRoutes.onboardingoneScreen);
      }
    });
  }
}
