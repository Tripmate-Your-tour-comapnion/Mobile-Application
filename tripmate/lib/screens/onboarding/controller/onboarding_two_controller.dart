import '../../../core/app_exports.dart';
import '../model/onboarding_two_model.dart';

class Controller extends GetxController {
  final box = GetStorage();

  bool get isFirstTime => box.read('FirstTime') ?? true;

  String get route =>
      isFirstTime ? AppRoutes.initialRoute : AppRoutes.registerationScreen;

  void completeOnboarding() {
    box.write('FirstTime', false);
    Get.offAllNamed(AppRoutes.bottomNavigation);
  }
}
