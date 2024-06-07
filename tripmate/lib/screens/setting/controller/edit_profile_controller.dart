import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as d;
import 'package:http_parser/http_parser.dart'; // Import for MediaType

class EditProfileController extends GetxController {
  Rx<File?> image = Rx<File?>(null);
  Rx<String> imgPath = "".obs;
  String fileName = '';
  TextEditingController passportIdController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  final headers = {
    "accept": "*/*",
    'Content-Type': 'application/json',
    'Cookie': 'token=${dotenv.env['TOKEN']}',
  };
  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      imgPath.value = pickedFile.path;
      image.value = File(pickedFile.path);
      fileName = pickedFile.path.split('/').last;
    }
  }

  MediaType getMediaType(String filePath) {
    final extension = filePath.split('.').last.toLowerCase();
    switch (extension) {
      case 'jpg':
        return MediaType('image', 'jpg');
      case 'jpeg':
        return MediaType('image', 'jpeg');
      case 'png':
        return MediaType('image', 'png');
      case 'gif':
        return MediaType('image', 'gif');
      default:
        throw UnsupportedError('Unsupported file extension: $extension');
    }
  }

  Future<void> uploadData(String id) async {
    String baseUrl = dotenv.env['BASEURL']!;
    String url = '$baseUrl/profile/tourist-credential/$id';
    d.Dio _dio = d.Dio();

    final formData = d.FormData.fromMap({
      'phone_number':
          phoneNumberController.text.trim(), // Ensure this is a string
      'profile_image': await d.MultipartFile.fromFile(
        image.value!.path,
        filename: 'profile_image.jpg',
        contentType: getMediaType(image.value!.path),
      ),
    });

    try {
      print('Uploading file: $fileName');
      final response = await _dio.post(
        url,
        data: formData,
        options: d.Options(
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        print('Upload success: ${response.data}');
      } else {
        print('Upload failed: ${response.statusCode} - ${response.data}');
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
