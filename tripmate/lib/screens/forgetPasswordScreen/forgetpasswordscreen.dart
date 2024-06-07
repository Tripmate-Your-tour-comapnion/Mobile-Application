import 'package:flutter/material.dart';
import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/screens/ForgetPasswordWebView/forgetpasswordWebView.dart';
import 'package:tripmate/screens/forgetPasswordScreen/controller/forgetpasswordcontroller.dart';
import 'package:tripmate/widgets/custom_elevated_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ForgotPasswordController controller = ForgotPasswordController();
  ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: theme.colorScheme.onPrimary,
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          'Forgot Password',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Enter your email to reset your password',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18.0,
                    color: theme.colorScheme.onPrimary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  focusColor: theme.colorScheme.onPrimary,
                  labelText: 'Email',
                  labelStyle: TextStyle(color: theme.colorScheme.onPrimary),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  prefixIcon: Icon(
                    Icons.email,
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              CustomElevatedButton(
                text: "Reset Password",
                margin: const EdgeInsets.symmetric(horizontal: 43),
                buttonStyle: CustomButtonStyles.outlinePrimaryTL10,
                buttonTextStyle: CustomTextStyles.titleLargeBold,
                alignment: Alignment.center,
                onPressed: () async {
                  if (emailController.text.isNotEmpty) {
                    Get.dialog(
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                      barrierDismissible: false,
                    );

                    try {
                      await controller
                          .resetPassword(emailController.text.trim());
                      Get.back();
                      Get.to(
                          ForgotPasswordWebView(resetUrl: controller.resetUrl));
                    } catch (error) {
                      print("Error Generating Link: $error");
                      Get.back();
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
