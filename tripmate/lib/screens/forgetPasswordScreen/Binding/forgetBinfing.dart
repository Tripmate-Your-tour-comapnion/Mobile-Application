import 'package:tripmate/screens/forgetPasswordScreen/controller/forgetpasswordcontroller.dart';

import '../../../core/app_exports.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ForgotPasswordController());
  }
}
