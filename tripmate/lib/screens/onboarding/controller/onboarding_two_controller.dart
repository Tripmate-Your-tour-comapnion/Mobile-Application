import 'package:get_storage/get_storage.dart';

import '../../../core/app_exports.dart';
import '../model/onboarding_two_model.dart';

class OnboardingTwoController extends GetxController {
  Rx<OnboardingTwoModel> onboardingtwoModelObj = OnboardingTwoModel().obs;

  void goToRegistration() {
    final tripmate = GetStorage();
    tripmate.write('isOpendBefore', true);
    Get.toNamed(AppRoutes.registerationScreen);
  }
}
