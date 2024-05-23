import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/data/constants.dart';
import 'package:tripmate/screens/regitration/controller/registration_controller.dart';
import 'package:tripmate/widgets/base_button.dart';
import 'package:tripmate/widgets/custom_checkbox_button.dart';
import 'package:tripmate/widgets/custom_elevated_button.dart';

import '../../theme/custom_text_style.dart';
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
              height: height - height * 0.2385,
              child: TabBarView(
                  controller: controller.tabController,
                  children:  [
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
  const RegisterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width * 0.8,
      height: height,
      child: Column(
        children: [
          SizedBox(
            height: height * 0.04,
          ),
          CustomTextFormField(
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
          ),
          SizedBox(
            height: height * 0.04,
          ),
          CustomTextFormField(
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
          ),
          SizedBox(
            height: height * 0.04,
          ),
          Obx(
            ()=> CustomTextFormField(
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
                onTap: (){
                  controller.obscurePasswordSwitch();
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: SvgPicture.asset(Constants.eyeIcon),
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.04,
          ),
          Obx(
            ()=> CustomTextFormField(
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
                onTap: (){
                  controller.obscurePasswordSwitch();
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: SvgPicture.asset(Constants.eyeIcon),
                ),
              ),
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
                        text: "Remember password",
                      ),
                    ),
                  ],
                ),
                TextButton(
                    onPressed: () {},
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
              text: "Signup",
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
              controller.changeTabIndex(0);
            },
            child: Text("Have an account?"),
            style: TextButton.styleFrom(
              textStyle: theme.textTheme.titleSmall,
              foregroundColor: theme.colorScheme.onPrimary,
            ),
          ),

          // Stack(
          //   children: [
          //     // SvgPicture.asset(Constants.womenIcon,height: 30,),
          //     SizedBox(
          //       height: height * 0.3,
          //       child: SvgPicture.asset(
          //         Constants.regitsratinRect,
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}

class LoginWidget extends GetWidget<RegistrationController> {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width * 0.8,
      height: height * 0.4,
      child: Column(
        children: [
          SizedBox(
            height: height * 0.04,
          ),
          CustomTextFormField(
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
          ),
          SizedBox(
            height: height * 0.04,
          ),
          Obx(
            ()=> CustomTextFormField(
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
                onTap: (){
                  controller.obscurePasswordSwitch();
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: SvgPicture.asset(Constants.eyeIcon),
                ),
              ),
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
                        text: "Remember password",
                      ),
                    ),
                  ],
                ),
                TextButton(
                    onPressed: () {},
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
              text: "Signup",
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
            child: const Text("Don't have account?"),
            style: TextButton.styleFrom(
              textStyle: theme.textTheme.titleSmall,
              foregroundColor: theme.colorScheme.onPrimary,
            ),
          ),
          // Stack(
          //   children: [
          //     // SvgPicture.asset(Constants.womenIcon,height: 30,),
          //     SizedBox(
          //       height: height * 0.3,
          //       child: SvgPicture.asset(
          //         Constants.regitsratinRect,
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
