import 'package:get_storage/get_storage.dart';
import 'package:tripmate/screens/regitration/controller/registration_controller.dart';

import '../../../core/app_exports.dart';

class SplashScreenController extends GetxController {
  final box = GetStorage();
  bool get isFirstTime => box.read('FirstTime') ?? true;
  RegistrationController registrationController = RegistrationController();

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () async {
      if (isFirstTime == true) {
        Get.offNamed(AppRoutes.onboardingoneScreen);
      } else {
        if ((await registrationController.tokenGetter()) != "") {
          Get.offNamed(AppRoutes.bottomNavigation);
        } else {
          Get.offNamed(AppRoutes.registerationScreen);
        }
      }
    });
    super.onInit();
  }
}
