// ignore_for_file: unused_import

import 'dart:ffi';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tripmate/screens/setting/controller/edit_profile_controller.dart';
import 'package:tripmate/widgets/custom_text_form_field.dart';

import '../../core/app_exports.dart';
import '../../data/constants.dart';
import '../../theme/theme_helper.dart';
import 'controller/setting_controller.dart';

class EditProfileScreen extends GetWidget<EditProfileController> {
  EditProfileScreen({super.key});

  // final response = Get.arguments['response'];

  @override
  Widget build(BuildContext context) {
    // print('respose from profile $response');
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SafeArea(
            child: Column(
              children: [
                SettingProfile(
                  profileImgPath: controller.imgPath.value,
                  fulName: "Brikti Teklu",
                  email: "brktiteklu@gmail.com",
                  id: "",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class SettingProfile extends GetWidget<EditProfileController> {
  final String profileImgPath;
  final String fulName;
  final String email;
  final String id;

  SettingProfile({
    super.key,
    required this.profileImgPath,
    required this.fulName,
    required this.email,
    required this.id,
  });
  TextEditingController passportIdController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();
  void _validate() async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      ProgressDialogUtils.showProgressDialog();
      await controller.uploadData(
        id,
      );
      ProgressDialogUtils.hideProgressDialog();
    }
  }

  void showOptionDialog(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    showDialog(
        context: context,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Dialog(
              backgroundColor: theme.colorScheme.background,
              child: Container(
                // padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    color: theme.colorScheme.background,
                    borderRadius: BorderRadius.circular(20)),
                height: height * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          child: GestureDetector(
                            onTap: () {
                              controller.pickImage(ImageSource.camera);
                              controller.backToSetting();
                            },
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  Constants.cameraIcon,
                                  height: 30,
                                ),
                                Text(
                                  "Camera",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: theme.colorScheme.onPrimary),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          child: GestureDetector(
                            onTap: () {
                              controller.pickImage(ImageSource.gallery);
                              controller.backToSetting();
                            },
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  Constants.galleryIcon,
                                  height: 30,
                                ),
                                Text(
                                  "Gallery",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: theme.colorScheme.onPrimary),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: height * 0.9,
      child: ListView(
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Obx(() {
                    return controller.image.value == null
                        ? CircleAvatar(
                            radius: width * 0.15,
                            backgroundImage: AssetImage(
                              profileImgPath,
                            ))
                        : CircleAvatar(
                            radius: width * 0.15,
                            backgroundImage: FileImage(controller.image.value!),
                          );
                  }),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () => showOptionDialog(context),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: theme.colorScheme.background,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: theme.colorScheme.primary,
                                  spreadRadius: 1,
                                  blurStyle: BlurStyle.outer,
                                  blurRadius: 2)
                            ]),
                        child: Icon(
                          Icons.edit,
                          color: theme.colorScheme.onPrimary,
                          size: width * 0.05,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Text(
                fulName,
                style: theme.textTheme.titleSmall,
              ),
              SizedBox(
                height: height * 0.001,
              ),
              Text(
                email,
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
          SizedBox(
            height: height * 0.1,
          ),
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width * 0.8,
                  height: height * 0.085,
                  child: TextFormField(
                    controller: passportIdController,
                    cursorColor: theme.colorScheme.onPrimary,
                    decoration: InputDecoration(
                      // erro,
                      hintText: "passport No or National ID",
                      hintStyle: theme.textTheme.bodyMedium,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: theme.colorScheme.onPrimary)),
                      focusColor: theme.colorScheme.onPrimary,
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: theme.colorScheme.primary.withOpacity(0.2),
                        ),
                      ),
                    ),
                    inputFormatters: [
                      // Limit to 9 characters (common max length)
                      FilteringTextInputFormatter.allow(RegExp(
                          r'[A-Za-z0-9]')), // Allow alphanumeric characters
                    ],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your passport ID";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                SizedBox(
                  width: width * 0.8,
                  height: height * 0.05,
                  child: IntlPhoneField(
                    controller: phoneNumberController,
                    disableAutoFillHints: true,
                    disableLengthCheck: true,
                    pickerDialogStyle: PickerDialogStyle(
                        backgroundColor: theme.colorScheme.background),
                    decoration: InputDecoration(
                      hintText: "Phone No",
                      hintStyle: theme.textTheme.bodyMedium,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: theme.colorScheme.onPrimary)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: theme.colorScheme.primary.withOpacity(0.2),
                        ),
                      ),
                    ),
                    initialCountryCode: 'et',
                    initialValue: '+251',
                    invalidNumberMessage: "wrong phone used",
                    validator: (p0) {
                      if (!p0!.isValidNumber()) {
                        return 'enter valid Phone number';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: theme.colorScheme.background,
                      padding: EdgeInsets.symmetric(horizontal: width * 0.2)),
                  onPressed: () {
                    _validate();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.15, vertical: height * 0.008),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: theme.colorScheme.onPrimary)),
                    child: Text(
                      "Finish",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: theme.colorScheme.onPrimary,
                          fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
