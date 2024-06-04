import 'package:get_storage/get_storage.dart';

import '../../../core/app_exports.dart';

class Controller extends GetxController {
  final box = GetStorage();

  void completeOnboarding() {
    box.write('FirstTime', false);
    Get.offAllNamed(AppRoutes.registerationScreen);
  }
}
