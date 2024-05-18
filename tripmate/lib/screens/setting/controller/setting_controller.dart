import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/screens/setting/model/setting_model.dart';

class SettingController extends GetxController {
  Rx<SettingModel> settingModel = SettingModel().obs;

  void goToEditProfile() {
    Get.toNamed(AppRoutes.editProfile);
  }
}
