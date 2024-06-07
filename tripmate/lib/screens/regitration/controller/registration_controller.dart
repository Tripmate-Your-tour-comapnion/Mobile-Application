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
  RxMap userData = {}.obs;
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

// token setter on GetStorage
  Future tokenSetter(String token) async {
    final user = GetStorage();
    await user.write("token", token);
  }

// token getter from GetStorage
  Future<String> tokenGetter() async {
    final user = GetStorage();
    final token = (await user.read('token').split('=')[1].split(';')[0].trim()) ?? "";
    return token;
  }

  // email confirmation checker

  Future<void> login(String email, String password) async {
    String baseUrl = dotenv.get('BASEURL');
    if (kDebugMode) {}
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
      

<<<<<<< HEAD
    if (response.data['body']['confirmed'] == true) {
            tokenSetter(response.headers.value('set-cookie')!);
=======
        if (response.data['body']['confirmed'] == true) {
>>>>>>> a4962b977dd0b5ed7bef7490f2bb2d2ed414767f
          Get.toNamed(AppRoutes.bottomNavigation);
        }
      } else {
        if (kDebugMode) {
          if (response.data['isConfirmed'] == false) {
            print("please  confirm your email");
          }
          print('Login failed. ${response.data['isConfirmed']}');
        }
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (kDebugMode) {
          if (e.response!.data['isConfirmed'] == false) {
            print("please  confirm your email");
          } else {
            print("unkown error");
          }
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

  Future<void> singUp(
      String fullName, String email, String password, String rePassword) async {
    if (kDebugMode) {
      print('Full Name: $fullName');
      print('Email: $email');
      print('Password: $password');
      print('Re-Password: $rePassword');
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

    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));

    try {
      final response = await dio.post(signupUrl, data: signupData);

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('succes ${response.data}');
           final box = GetStorage();
          tokenSetter(response.headers.value('set-cookie')!);
        }

        userData.value = {
          'success': response.data['success'],
          'email': response.data['body']['email']
        };
      } else {
        if (kDebugMode) {
          // print('Signup failed. Status code: ${response.statusCode}');
          // print('Response data: ${response.data}');
        }
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (kDebugMode) {
          // print('Dio error. Status code: ${e.response?.statusCode}');
          // print('Error response data: ${e.response?.data}');
        }
        showErrorPassword.value = true;
      } else {
        if (kDebugMode) {
          // print('Dio error: $e');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        // print('Unexpected error: $e');
      }
    }
  }

  void goTOConfirmEmail() {
    Get.offNamed(AppRoutes.confirmEmailScreen);
  }
}
