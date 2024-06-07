import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:tripmate/core/app_exports.dart';

class ConfirmPasswordController extends GetxController {
  RxBool isTimeEnd = false.obs;
  RxBool isGmailConfirmed = false.obs;
  String email = '';
  Timer? _timer;
  RxString sourceData = ''.obs;

  ConfirmPasswordController({required this.email});
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
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
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
        print(response.data);
        isGmailConfirmed.value = response.data[0]['confirmed'];
        if (isGmailConfirmed.value) {
          Get.offAllNamed(AppRoutes.editProfile, arguments: {
            'userData': {
              'email': response.data[0]['email'],
              'name': response.data[0]['full_name'],
              'id': response.data[0]['_id']
            },
            "source": "signup",
          });

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

  Future<void> resendEmail(String email) async {
    Dio dio = Dio();
    final baseUrl = dotenv.env['BASEURL'];
    final url = "$baseUrl/user/resend-email";
    final emailData = {
      'emails': email,
    };
    try {
      final response = await dio.post(url, data: emailData);

      if (response.statusCode == 200) {
        print(response.data);
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
