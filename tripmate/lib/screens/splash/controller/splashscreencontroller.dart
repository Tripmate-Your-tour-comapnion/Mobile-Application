import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tripmate/screens/regitration/controller/registration_controller.dart';

import '../../../core/app_exports.dart';

class SplashScreenController extends GetxController {
  final box = GetStorage();
  bool get isFirstTime => box.read('FirstTime') ?? true;
  RegistrationController registrationController = RegistrationController();
  RxString email = ''.obs;
 

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () async {
      if (isFirstTime == true) {
        Get.offNamed(AppRoutes.onboardingoneScreen);
      } else {
        if ((await registrationController.tokenGetter()) != "") {
         String token = await registrationController.tokenGetter();
         print(token);
          if( await getEmailIsConfirmed(token)){
            
          Get.offNamed(AppRoutes.bottomNavigation);
          }else{
            Get.offNamed(AppRoutes.confirmEmailScreen,arguments: {'email':email.value,'source':'login'});
          }
        } else {
          Get.offNamed(AppRoutes.registerationScreen);
        }
      }
    });
    super.onInit();
  }

 Future<bool> getEmailIsConfirmed(String token) async {
  Dio dio = Dio();
  String baseUrl = dotenv.get('BASEURL');
  final url = "$baseUrl/user/get-user-with-token";
  final dataToken = {
    'token':token
  };
RxBool isConfirmed = false.obs;
  try {
    final response = await dio.get(url,data: dataToken);

    if (response.statusCode == 200) {
      if (kDebugMode) {
         isConfirmed.value = response.data['confirmed'] ?? false;
         email.value = response.data['email'];
        print("Response data: ${isConfirmed}");
        return isConfirmed.value;
      }

      if (response.data['isConfirmed'] == true) {
        // Navigate to the bottom navigation screen if email is confirmed
        Get.toNamed(AppRoutes.bottomNavigation);
        return isConfirmed.value;
      } else {
        if (kDebugMode) {
          print("Please confirm your email.");
        }
                return isConfirmed.value;

      }
    } else {
      if (kDebugMode) {
        print('Request failed with status: ${response.statusCode}, data: ${response.data}');
      }
              return isConfirmed.value;

    }
  } on DioException catch (e) {
    if (e.response != null) {
      if (kDebugMode) {
        print("Dio error response status: ${e.response!.statusCode}, data: ${e.response!.data}");
      }
              return isConfirmed.value;

    } else {
      if (kDebugMode) {
        print('Dio error: $e.messaget');
      }
    }
  } catch (e) {
    if (kDebugMode) {
      print('Unexpected error: $e');
    }
            return isConfirmed.value;

  }
          return isConfirmed.value;

}
}
