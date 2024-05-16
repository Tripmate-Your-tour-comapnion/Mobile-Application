import '../controller/splashscreencontroller.dart';

import '../../../core/app_exports.dart';


class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenController());
  }
}
