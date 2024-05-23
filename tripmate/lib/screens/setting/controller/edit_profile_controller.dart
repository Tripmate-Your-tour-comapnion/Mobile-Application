import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:tripmate/core/app_exports.dart';

class EditProfileController extends GetxController {
  Rx<File?> image = Rx<File?>(null);

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    }
  }

  void backToSetting() {
    Get.back();
  }
}
