import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/screens/regitration/controller/registration_controller.dart';

class RegistrationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RegistrationController());
  }

}