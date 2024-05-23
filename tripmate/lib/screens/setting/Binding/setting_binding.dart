import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/screens/setting/controller/setting_controller.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingController());
  }
}
