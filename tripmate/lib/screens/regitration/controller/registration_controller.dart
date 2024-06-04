import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/screens/regitration/model/registration_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// ignore: deprecated_member_use
class RegistrationController extends GetxController
    with SingleGetTickerProviderMixin {
  Rx<RegistrationModel> registration_model = RegistrationModel().obs;
  Rx<bool> passwodOscureText = true.obs;
  RxString dropValue = 'tourist'.obs;

  Rx<bool> rememberPasswordCheckbox = false.obs;
  Rx<int> tabBarIndex = 0.obs;
  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    tabController.index = tabBarIndex.value;
    tabController.addListener(() {
      tabBarIndex.value = tabController.index;
    });
    super.onInit();
  }

  void changeTabIndex(int index) {
    tabController
        .animateTo(index); // You can use animateTo to switch tabs smoothly
  }

  void obscurePasswordSwitch() {
    passwodOscureText.value = !passwodOscureText.value;
  }

  RxBool showErrorPassword = false.obs;
  void goToHomePage() {
    Get.offNamed(AppRoutes.homescreen);
  }

  Future<void> login(String email, String password) async {
    String baseUrl = dotenv.get('BASEURL');
    if (kDebugMode) {
      print(email + password);
    }
    Dio dio = Dio();
    String loginUrl = '$baseUrl/user/login';
    Map<String, dynamic> loginData = {
      'email': email,
      'password': password,
    };

    try {
      final response = await dio.post(loginUrl, data: loginData);

      // Handle the response
      if (response.statusCode == 200) {
        // print("token: ${await getTokenFromData(response)}");
        // goToHomePage();
        if (kDebugMode) {
          print('logged in');
        }
      } else {
        if (kDebugMode) {
          print('Login failed. ${response.data}');
        }
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (kDebugMode) {
          print('Login failed. ${e.response?.data}');
        }
        showErrorPassword.value = true;
      } else {
        if (kDebugMode) {
          print('Error: $e');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }

  Future<String?> getTokenFromData(response) async {
    final data = response.data;
    if (data is Map<String, dynamic> && data.containsKey('token')) {
      return data['token'] as String;
    }
    return null; // Token not found in data
  }

  Future singUp(
      String fullName, String email, String password, String rePassword) async {
    if (kDebugMode) {
      print(fullName);
    }
    Dio dio = Dio();
    String baseUrl = dotenv.get('BASEURL');
    String signupUrl = '$baseUrl/user/signup';

    Map<String, dynamic> signupData = {
      'full_name': fullName,
      'email': email,
      'password': password,
      're_password': rePassword,
      'role': dropValue.value,
    };

    try {
      final response = await dio.post(signupUrl, data: signupData);

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response);
        }
        Get.offNamed(AppRoutes.editProfile,
            arguments: {'response': response.data});
        if (kDebugMode) {
          print('logged in ${response.data}');
        }
      } else {
        if (kDebugMode) {
          print('Login failed. ${response.data}');
        }
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (kDebugMode) {
          print('Login failed. ${e.response?.data}');
        }
        showErrorPassword.value = true;
      } else {
        if (kDebugMode) {
          print('Error: $e');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }
}
