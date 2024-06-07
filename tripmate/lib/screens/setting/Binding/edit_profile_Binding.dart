import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/screens/setting/controller/edit_profile_controller.dart';
import 'package:tripmate/screens/setting/controller/setting_controller.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(EditProfileController());
    Get.put(SettingController());
  }
}
