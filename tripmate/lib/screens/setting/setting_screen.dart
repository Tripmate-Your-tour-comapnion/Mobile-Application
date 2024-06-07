import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/data/constants.dart';
import 'package:tripmate/screens/setting/controller/setting_controller.dart';
import 'package:tripmate/widgets/custom_elevated_button.dart';

import '../termsAndPolicy/terms_and_policy.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});
  final SettingController controller = Get.put(SettingController());
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: theme.colorScheme.background,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SafeArea(
              child: Column(
                children: [
                  FutureBuilder(
                      future: controller.fetchUser(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else {
                          return SettingProfile(
                            profileImgPath: controller.imageUrl,
                            fulName: controller.name,
                            email: controller.email,
                            passportNo: controller.passpot_no,
                            phoneNo: controller.phone_number,
                          );
                        }
                      }),
                  SizedBox(
                      width: width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Settings",
                            style: theme.textTheme.bodyLarge,
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          SettingsListItemWidget(
                            onPress: () {
                              Get.toNamed(AppRoutes.changePassword);
                            },
                            title: "change password",
                            prefixIconPath: Constants.passChangeIcon,
                            sufixIconPath: Constants.arrowIcon,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          SettingsListItemWidget(
                            onPress: () {},
                            title: "Language",
                            prefixIconPath: Constants.langIcon,
                            sufixIconPath: Constants.arrowIcon,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          SettingsListItemWidget(
                            onPress: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Policy(
                                      mdFile: 'privacy_policy.md',
                                      radius: 8,
                                    );
                                  });
                            },
                            title: "Terms and Policy",
                            prefixIconPath: Constants.handshakeIcon,
                            sufixIconPath: Constants.arrowIcon,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),

                          SettingsListItemWidget(
                            onPress: () {
                              showAboutDialog(context: context);
                            },
                            title: "About us",
                            prefixIconPath: Constants.programmingIcon,
                            sufixIconPath: Constants.arrowIcon,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          SettingsListItemWidget(
                            onPress: () {},
                            title: "logout",
                            prefixIconPath: Constants.logoutIcon,
                            sufixIconPath: Constants.arrowIcon,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),

                          // SettingsListItemWidget(
                          //   onPress: () {},
                          //   title: "FAQ",
                          //   prefixIconPath: Constants.faqIcon,
                          //   sufixIconPath: Constants.arrowIcon,
                          // ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}

class SettingProfile extends GetWidget<SettingController> {
  final String profileImgPath;
  final String fulName;
  final String email;
  final String passportNo;
  final String phoneNo;
  const SettingProfile({
    super.key,
    required this.profileImgPath,
    required this.fulName,
    required this.email,
    required this.passportNo,
    required this.phoneNo,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: height * 0.5,
      child: ListView(
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: width * 0.15,
                backgroundImage: NetworkImage(
                  profileImgPath,
                ),
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
            height: height * 0.02,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Passport No or National ID",
                style: theme.textTheme.bodyMedium,
              ),
              SizedBox(
                height: height * 0.001,
              ),
              Text(
                passportNo,
                style: theme.textTheme.titleSmall,
              ),
              Text(
                "Mobile",
                style: theme.textTheme.bodyMedium,
              ),
              SizedBox(
                height: height * 0.001,
              ),
              Text(
                phoneNo,
                style: theme.textTheme.titleSmall,
              ),
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: width * 0.35,
                height: height * 0.04,
                child: CustomElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.editProfile, arguments: {
                      'profile_image': controller.imageUrl,
                      'name': controller.name,
                      'email': email
                    });
                  },
                  text: "Edit profile",
                  buttonStyle: CustomButtonStyles.outlinePrimaryTL10,
                  buttonTextStyle: TextStyle(
                      color: theme.colorScheme.background,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SettingsListItemWidget extends StatelessWidget {
  final String title;
  final String prefixIconPath;
  final String sufixIconPath;
  final VoidCallback onPress;
  const SettingsListItemWidget({
    super.key,
    required this.title,
    required this.prefixIconPath,
    required this.sufixIconPath,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onPress,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    prefixIconPath,
                    height: 20,
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 18,
                        color: title == "logout"
                            ? Colors.red
                            : theme.colorScheme.onPrimary),
                  ),
                ],
              ),
              SvgPicture.asset(sufixIconPath,
                  height: 20,
                  // ignore: deprecated_member_use
                  color: title == "logout"
                      ? Colors.red
                      : theme.colorScheme.onPrimary),
            ],
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Divider(
            color: theme.colorScheme.onPrimary.withOpacity(0.1),
          )
        ],
      ),
    );
  }
}
