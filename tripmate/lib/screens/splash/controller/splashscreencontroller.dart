import 'package:get_storage/get_storage.dart';

import '../../../core/app_exports.dart';

class SplashScreenController extends GetxController {
  final box = GetStorage();
  bool get isFirstTime => box.read('FirstTime') ?? true;

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () {
      isFirstTime == true
          ? Get.offNamed(AppRoutes.onboardingoneScreen)
          : Get.offNamed(AppRoutes.registerationScreen);
    });
    super.onInit();
  }
}
