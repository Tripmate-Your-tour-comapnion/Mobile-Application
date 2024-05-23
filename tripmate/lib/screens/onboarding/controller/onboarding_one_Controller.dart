import '../../../core/app_exports.dart';
import '../model/onboarding_one_model.dart';

class OnboardingOneController extends GetxController {
  Rx<OnboardingOneModel> onboardingoneModelObj = OnboardingOneModel().obs;

  void goToOnboardingTwo(){
    Get.toNamed(AppRoutes.onboardingtwoScreen);
  }
}
