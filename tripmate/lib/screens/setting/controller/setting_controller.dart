import 'package:dio/dio.dart';
import 'package:tripmate/core/app_exports.dart';

class SettingController extends GetxController {
  // Rx<SettingModel> settingModel = SettingModel().obs;
  static final dio = Dio();
  String imageUrl = '';
  String name = '';
  String email = '';
  String passpot_no = '';
  String phone_number = '';
  final headers = {
    "accept": "*/*",
    'Content-Type': 'application/json',
    'Cookie': 'token=${dotenv.env['TOKEN']}',
  };

  onInit() {
    super.onInit();
    fetchUser();
  }

  static final url = "${dotenv.env['BACKEND_URL']}/profile/get-credential";

  Future<void> fetchUser() async {
    try {
      final response = await dio.get(
        url,
        options: Options(method: 'GET', headers: headers),
      );

      email = response.data['body']['_id']['email'];
      name = response.data['body']['_id']['full_name'];
      imageUrl = response.data['body']['profile_image'];
      passpot_no = response.data['body']['passport_id'];
      phone_number = response.data['body']['phone_number'];
    } catch (e) {
      print("Error fetching destinations: $e");
    } finally {}
  }

  void goToEditProfile() {
    Get.toNamed(AppRoutes.editProfile);
  }
}
