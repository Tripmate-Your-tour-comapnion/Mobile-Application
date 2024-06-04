import '../controller/bottomnavcontroller.dart';

import '../../../core/app_exports.dart';

class BottomNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavBarController());
  }
}
