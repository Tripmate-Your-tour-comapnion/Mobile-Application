import 'package:flutter/material.dart';

import '../../core/app_exports.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'controller/changepasswordController.dart';

// ignore: must_be_immutable
class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  ChangePasswordController controller = ChangePasswordController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Change Password",
          style: TextStyle(color: Color(0XFF0C3A2D)),
        ),
        centerTitle: true,
        backgroundColor: theme.colorScheme.onPrimary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: const Color(0XFF0C3A2D),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.1, vertical: size.height * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Gap(size.height * 0.05),
                Text(
                  'Change Your Password',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0XFF0C3A2D),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: size.height * 0.06),
                CustomTextFormField(
                  controller: controller.currentPasswordController,
                  hintText: 'Current Password',
                  prefixIcon: Icons.lock,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your current password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: size.height * 0.02),
                CustomTextFormField(
                  controller: controller.newPasswordController,
                  hintText: 'New Password',
                  prefixIcon: Icons.lock_outline,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your new password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: size.height * 0.02),
                CustomTextFormField(
                  controller: controller.confirmPasswordController,
                  hintText: 'Confirm New Password',
                  prefixIcon: Icons.lock_outline,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your new password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: size.height * 0.04),
                Obx(() {
                  return controller.isLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : CustomElevatedButton(
                          text: 'Change Password',
                          onPressed: controller.changePassword,
                          buttonStyle: CustomButtonStyles.outlinePrimaryTL10,
                          buttonTextStyle: CustomTextStyles.titleLargeBold,
                        );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
