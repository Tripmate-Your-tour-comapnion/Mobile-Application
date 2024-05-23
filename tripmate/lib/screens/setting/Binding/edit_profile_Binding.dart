import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/screens/setting/controller/edit_profile_controller.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => EditProfileController());
  }
}
