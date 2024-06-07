import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/screens/regitration/controller/registration_controller.dart';

class SettingController extends GetxController {
  // Rx<SettingModel> settingModel = SettingModel().obs;]
  RegistrationController rc = Get.put(RegistrationController());
  static final dio = Dio();
  RxString imageUrl = ''.obs;
  RxString name = ''.obs;
  RxString email = ''.obs;
  RxString passpot_no = ''.obs;
  RxString phone_number = ''.obs;
  String tokenString = "";
  
 @override
  void onInit() async{
    await fetchUser();
    print(imageUrl.value);
    super.onInit();
  }

  static final url = "${dotenv.env['BACKEND_URL']}/profile/get-credential";

  Future<void> fetchUser() async {
  //   final headers = {
  //   "accept": "*/*",
  //   'Content-Type': 'application/json',
  //   'Cookie': 'token=$tokenString',
  // };
    try {
      final response = await dio.get(
        url,
        
      );

      email = response.data['body']['_id']['email'];
      name = response.data['body']['_id']['full_name'];
      imageUrl = response.data['body']['profile_image'];
      passpot_no = response.data['body']['passport_id'];
      phone_number = response.data['body']['phone_number'];
      // print(response.data['body']);
    } catch (e) {
      print("Error  $e");
    } finally {}

 
  }

  void goToEditProfile() {
    Get.toNamed(AppRoutes.editProfile);
  }
}
