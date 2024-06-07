// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/data/constants.dart';
import 'package:tripmate/screens/regitration/controller/registration_controller.dart';
import 'package:tripmate/widgets/custom_checkbox_button.dart';
import 'package:tripmate/widgets/custom_elevated_button.dart';

import '../../widgets/custom_text_form_field.dart';

class RegistrationScreen extends GetWidget<RegistrationController> {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.background,
        appBar: AppBar(
          backgroundColor: theme.colorScheme.background,
          elevation: 0,
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize: Size(width, height * 0.17),
            child: Column(
              children: [
                Text(
                  "TripMate",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 35,
                    color: theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Container(
                  width: width * 0.6,
                  child: TabBar(
                    padding: const EdgeInsets.all(20),
                    controller: controller.tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: const [
                      Tab(
                        child: Text(
                          'Login',
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Register',
                        ),
                      ),
                    ],
                    indicatorColor: theme.colorScheme.onPrimary,
                    automaticIndicatorColorAdjustment: true,
                    unselectedLabelColor: theme.colorScheme.primary,
                    labelColor: theme.colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: SizedBox(
            height: height,
            child: TabBarView(
              controller: controller.tabController,
              children: [
                LoginWidget(),
                RegisterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterWidget extends GetWidget<RegistrationController> {
  RegisterWidget({super.key});
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rePassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final _formKey = GlobalKey<FormState>();
    void _validate() async {
      _formKey.currentState!.validate();
      // ProgressDialogUtils.showProgressDialog();
      await controller.singUp(
          fullName.text, email.text, password.text, rePassword.text);
      if (controller.userData['success']) {
        Get.toNamed(AppRoutes.confirmEmailScreen,
            arguments: controller.userData['email']);
      }

      // ProgressDialogUtils.hideProgressDialog();
    }

    return SizedBox(
      width: width * 0.8,
      height: height + height,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: height * 0.04,
            ),
            CustomTextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter full name';
                }
                if (value.length < 3) {
                  return 'Name Too Short';
                }
                return null;
              },
              controller: fullName,
              width: width * 0.85,
              prefixConstraints:
                  const BoxConstraints(maxHeight: 30, minHeight: 30),
              prefix: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SvgPicture.asset(
                  Constants.manIcon,
                ),
              ),
              hintText: "Full Name",
              prefixIcon: null,
            ),
            SizedBox(
              height: height * 0.04,
            ),
            CustomTextFormField(
              validator: (value) =>
                  EmailValidator.validate(value!) ? null : 'Invalid Email',
              controller: email,
              width: width * 0.85,
              prefixConstraints:
                  const BoxConstraints(maxHeight: 30, minHeight: 30),
              prefix: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SvgPicture.asset(
                  Constants.mailIcon,
                ),
              ),
              hintText: "Email Address",
              prefixIcon: null,
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Obx(
              () => CustomTextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter password';
                  }
                  if (value.length < 8) {
                    return 'Password Too Short';
                  }
                  return null;
                },
                controller: password,
                width: width * 0.85,
                prefixConstraints:
                    const BoxConstraints(maxHeight: 30, minHeight: 30),
                prefix: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SvgPicture.asset(Constants.lockIcon),
                ),
                hintText: "Password",
                obscureText: controller.passwodOscureText.value,
                suffixConstraints:
                    const BoxConstraints(maxHeight: 30, minHeight: 30),
                suffix: InkWell(
                  onTap: () {
                    controller.obscurePasswordSwitch();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 0),
                    child: SvgPicture.asset(Constants.eyeIcon),
                  ),
                ),
                prefixIcon: null,
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Obx(
              () => CustomTextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter password';
                  }
                  if (value != password.text) {
                    return 'Password do not matched';
                  }
                  return null;
                },
                controller: rePassword,
                width: width * 0.85,
                prefixConstraints:
                    const BoxConstraints(maxHeight: 30, minHeight: 30),
                prefix: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SvgPicture.asset(Constants.lockIcon),
                ),
                hintText: "Password",
                obscureText: controller.passwodOscureText.value,
                suffixConstraints:
                    const BoxConstraints(maxHeight: 30, minHeight: 30),
                suffix: InkWell(
                  onTap: () {
                    controller.obscurePasswordSwitch();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 0),
                    child: SvgPicture.asset(Constants.eyeIcon),
                  ),
                ),
                prefixIcon: null,
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            SizedBox(
              width: width * 0.85,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Obx(
                        () => CustomCheckboxButton(
                          onChange: (value) {
                            controller.rememberPasswordCheckbox.value = value;
                          },
                          value: controller.rememberPasswordCheckbox.value,
                          text: "Remember password",
                        ),
                      ),
                    ],
                  ),
                 
                ],
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                width: width * 0.82,
                child: CustomElevatedButton(
                  onPressed: () {
                    return _validate();
                  },
                  text: "Signup",
                  buttonStyle: CustomButtonStyles.outlinePrimaryTL5,
                  buttonTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
            Text(
              "Or connect with",
              style: theme.textTheme.bodyMedium,
            ),
            SizedBox(
              height: height * 0.01,
            ),
            GestureDetector(
              child: SvgPicture.asset(Constants.googleIcon),
              onTap: () {
                print('google');
              },
            ),
            TextButton(
              onPressed: () {
                controller.changeTabIndex(0);
              },
              child: const Text("Have an account?"),
              style: TextButton.styleFrom(
                textStyle: theme.textTheme.titleSmall,
                foregroundColor: theme.colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginWidget extends GetWidget<RegistrationController> {
  LoginWidget({super.key});
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  void _validator() async {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      ProgressDialogUtils.showProgressDialog();
      await controller.login(userName.text, password.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width * 0.8,
      height: height * 0.4,
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            SizedBox(
              height: height * 0.04,
            ),
            CustomTextFormField(
              validator: (value) =>
                  EmailValidator.validate(value!) ? null : 'Invalid Email',
              controller: userName,
              width: width * 0.8,
              prefixConstraints:
                  const BoxConstraints(maxHeight: 30, minHeight: 30),
              prefix: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SvgPicture.asset(
                  Constants.mailIcon,
                ),
              ),
              hintText: "Email Address",
              prefixIcon: null,
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Obx(
              () => CustomTextFormField(
                validator: (value) {
                  var text = value!;
                  if (text.isEmpty) {
                    return 'please enter password';
                  }
                  if (text.length < 6) {
                    return 'Password Too Short';
                  }
                  return null;
                },
                controller: password,
                width: width * 0.85,
                prefixConstraints:
                    const BoxConstraints(maxHeight: 30, minHeight: 30),
                prefix: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SvgPicture.asset(Constants.lockIcon),
                ),
                hintText: "Password",
                obscureText: controller.passwodOscureText.value,
                suffixConstraints:
                    const BoxConstraints(maxHeight: 30, minHeight: 30),
                suffix: InkWell(
                  onTap: () {
                    controller.obscurePasswordSwitch();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 0),
                    child: SvgPicture.asset(Constants.eyeIcon),
                  ),
                ),
                prefixIcon: null,
              ),
            ),
            Obx(
              () => Row(
                children: [
                  Gap(width * 0.08),
                  if (controller.showErrorPassword.value)
                    const Text(
                      "Wrong Username or Password",
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            SizedBox(
              width: width * 0.85,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Obx(
                        () => CustomCheckboxButton(
                          onChange: (value) {
                            controller.rememberPasswordCheckbox.value = value;
                          },
                          value: controller.rememberPasswordCheckbox.value,
                          text: "Remember Me",
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.forgetPasswordScreen);
                      },
                      child: Text(
                        "Forget password",
                        style: theme.textTheme.titleSmall,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            SizedBox(
              width: width * 0.85,
              child: CustomElevatedButton(

                onPressed: _validator,
                text: "Login",
                buttonStyle: CustomButtonStyles.outlinePrimaryTL5,
                buttonTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Text(
              "Or connect with",
              style: theme.textTheme.bodyMedium,
            ),
            SizedBox(
              height: height * 0.01,
            ),
            GestureDetector(
              child: SvgPicture.asset(Constants.googleIcon),
              onTap: () {
                print('google');
              },
            ),
            TextButton(
              onPressed: () {
                controller.changeTabIndex(1);
              },
              style: TextButton.styleFrom(
                textStyle: theme.textTheme.titleSmall,
                foregroundColor: theme.colorScheme.onPrimary,
              ),
              child: const Text("Don't have account?"),
            ),
          ],
        ),
      ),
    );
  }
}
