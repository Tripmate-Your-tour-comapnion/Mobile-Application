import 'package:dio/dio.dart';
import 'package:tripmate/core/app_exports.dart';

class ForgotPasswordController extends GetxController {
  static final dio = Dio();
  String resetUrl = '';
  final headers = {
    'Content-Type': 'application/json',
  };
  Future<void> resetPassword(String email) async {
    try {
      final response = await dio.post(
        "${dotenv.env['BACKEND_URL']}/user/forgot-password",
        data: {'email': email},
        options: Options(method: 'GET', headers: headers),
      );

      resetUrl = response.data['body'];
      print(resetUrl);
    } catch (e) {}
  }
}
