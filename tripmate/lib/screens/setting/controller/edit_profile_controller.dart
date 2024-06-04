import 'dart:io';

import 'package:dio/dio.dart' as d;
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tripmate/core/app_exports.dart';

class EditProfileController extends GetxController {
  Rx<File?> image = Rx<File?>(null);
  Rx<String> imgPath = "".obs;

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      imgPath.value = pickedFile.path;
      image.value = File(pickedFile.path);
    }
  }

  Future<void> uploadData(String id) async {
    String baseUrl = dotenv.env['BASEURL']!;
    String url = '$baseUrl/profile/tourist-credential/$id';
    Dio _dio = Dio();

    final formData = d.FormData.fromMap({
      'passport_id': 'passportId', // Replace with actual passport ID
      'phone_number': 0905221804, // Ensure this is a string
      'profile_image': await d.MultipartFile.fromFile(
        image.value!.path,
        filename: 'profile_image.jpg',
      ),
    });

    try {
      d.Response response = await _dio.post(
        url,
        data: formData,
        options: d.Options(
          headers: {
            'Content-Type': 'multipart/form-data',
            // Include your token if needed
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Upload success: ${response.data}');
      } else {
        print('Upload failed: ${response.data}');
      }
    } on d.DioException catch (e) {
      if (e.response != null) {
        print('Upload error: ${e.response?.data}');
      } else {
        print('Upload error: ${e.message}');
      }
    }
  }

  void backToSetting() {
    Get.back();
  }
}

// class profileUploader {
//   static Future<void> uploadData(String id, String passportId,
//       String phoneNumber, String token, File image) async {
//    d. Dio _dio = d.Dio();

//     String url = 'http://yourserver.com/tourist-credential/$id';

//     final formData = d.FormData.fromMap({
//       'passport_id': passportId,
//       'phone_number': phoneNumber,
//       'profile_image': await d.MultipartFile.fromFile(image!.path,
//           filename: 'profile_image.jpg'),
//     });

//     try {
//      d.Response response = await _dio.post(
//         url,
//         data: formData,
//         options: Options(
//           headers: {
//             'Authorization': 'Bearer $token',
//             'Content-Type': 'multipart/form-data',
//           },
//         ),
//       );

//       if (response.statusCode == 200) {
//         print('Upload success: ${response.data}');
//       } else {
//         print('Upload failed: ${response.data['message']}');
//       }
//     } on d.DioException catch (e) {
//       if (e.response != null) {
//         print('Upload error: ${e.response?.data['message']}');
//       } else {
//         print('Upload error: ${e.message}');
//       }
//     }
//   }
// }
