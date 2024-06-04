import '../../../core/utils/network.dart';
import '../controller/splashscreencontroller.dart';

import '../../../core/app_exports.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenController());
    Get.put(NetworkController(), permanent: true);
  }
}
