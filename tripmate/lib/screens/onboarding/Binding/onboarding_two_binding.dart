import '../../../core/app_exports.dart';
import '../controller/onboarding_two_controller.dart';

class OnboardingTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingTwoController());
  }
}
