import 'package:tripmate/screens/changePasswordScreen/controller/changepasswordController.dart';

import '../../../core/app_exports.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ChangePasswordController());
  }
}
