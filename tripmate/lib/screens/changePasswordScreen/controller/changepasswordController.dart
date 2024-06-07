import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../core/app_exports.dart';

class ChangePasswordController extends GetxController {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final isLoading = false.obs;

  void changePassword() async {
    if (newPasswordController.text == confirmPasswordController.text) {
      final dio = Dio();
      String message = '';
      final headers = {
        'Content-Type': 'application/json',
        'Cookie': 'token=${dotenv.env['TOKEN']}',
      };
      isLoading.value = true;
      try {
        final response = await dio.post(
          "${dotenv.env['BACKEND_URL']}/user/change-password",
          data: {
            'old_password': currentPasswordController.text.trim(),
            're_password': confirmPasswordController.text.trim(),
            'new_password': newPasswordController.text.trim(),
          },
          options: Options(method: 'POST', headers: headers),
        );
        currentPasswordController.clear();
        newPasswordController.clear();
        confirmPasswordController.clear();
        message = response.data['message'];
        print(response);
        isLoading.value = false;
        Get.snackbar(response.data['body']['full_name'], 'Your ${message}',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: const Color.fromARGB(255, 6, 53, 8),
            colorText: Colors.white,
            duration: const Duration(seconds: 3),
            margin: EdgeInsets.only(bottom: 50));
      } catch (e) {}
    } else {
      Get.snackbar(
        'Error',
        'New passwords do not match!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
