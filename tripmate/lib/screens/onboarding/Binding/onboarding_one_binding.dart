import '../../../core/app_exports.dart';
import '../controller/onboarding_one_Controller.dart';

class OnboardingOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingOneController());
  }
}
