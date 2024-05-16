import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/screens/regitration/model/registration_model.dart';

class registrationController extends GetxController{
  Rx<registrationModel> registration_model = registrationModel().obs;
}