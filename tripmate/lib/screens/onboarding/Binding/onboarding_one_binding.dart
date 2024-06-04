import 'package:tripmate/screens/onboarding/controller/onboarding_two_controller.dart';

import '../../../core/app_exports.dart';

class OnboardingOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Controller());
  }
}
