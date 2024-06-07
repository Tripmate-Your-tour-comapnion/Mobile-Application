import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/screens/hotel/controller/hotel_contrller.dart';
import 'package:tripmate/screens/onboarding/controller/onboarding_two_controller.dart';
import 'package:tripmate/screens/regitration/controller/registration_controller.dart';

class ConfirmPasswordController extends Controller {
  RxBool isTimeEnd = false.obs;
  RxBool isGmailConfirmed = false.obs;
  String email = '';
  Timer? _timer;

  ConfirmPasswordController(this.email);
  @override
  void onInit() async {
    _startTimer();
    super.onInit();
  }

  @override
  void onClose() {
    // Cancel the timer when the controller is closed
    _timer?.cancel();
    super.onClose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      isEmailConfirmed(email);
    });
  }

  Future isEmailConfirmed(String email) async {
    String baseUrl = dotenv.get('BASEURL');
    String url = '$baseUrl/user/get-confirm-status';
    final data = {'email': email};

    Dio dio = Dio();

    try {
      final response = await dio.get(url, data: data);

      if (response.statusCode == 200) {
        print(response.data[0]['confirmed']);
        isGmailConfirmed.value = response.data[0]['confirmed'];
        if(isGmailConfirmed.value){
          Get.toNamed(AppRoutes.editProfile);
        }
      } else {
        if (kDebugMode) {
          print('Failed to load hotels: ${response.statusCode}');
        }
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
