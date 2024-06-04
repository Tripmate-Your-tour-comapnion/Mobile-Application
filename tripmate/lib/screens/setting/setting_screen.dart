import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/data/constants.dart';
import 'package:tripmate/screens/setting/controller/setting_controller.dart';
import 'package:tripmate/widgets/custom_elevated_button.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

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
                  SettingProfile(
                    profileImgPath: Constants.profileImg,
                    fulName: "Brikti Teklu",
                    email: "brktiteklu@gmail.com",
                    passportNo: "908765",
                    phoneNo: "+251905221804",
                  ),
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
                            onPress: () {},
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
                            onPress: () {},
                            title: "Terms and Policy",
                            prefixIconPath: Constants.handshakeIcon,
                            sufixIconPath: Constants.arrowIcon,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          SettingsListItemWidget(
                            onPress: () {},
                            title: "Help",
                            prefixIconPath: Constants.infoIcon,
                            sufixIconPath: Constants.arrowIcon,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          SettingsListItemWidget(
                            onPress: () {},
                            title: "FAQ",
                            prefixIconPath: Constants.faqIcon,
                            sufixIconPath: Constants.arrowIcon,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          SettingsListItemWidget(
                            onPress: () {},
                            title: "Meet the developers",
                            prefixIconPath: Constants.programmingIcon,
                            sufixIconPath: Constants.arrowIcon,
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
                backgroundImage: AssetImage(
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
                    Get.toNamed(AppRoutes.editProfile);
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
    return Column(
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
                  style: theme.textTheme.bodyLarge,
                ),
              ],
            ),
            InkWell(
                onTap: () => onPress,
                child: SvgPicture.asset(
                  sufixIconPath,
                  height: 20,
                )),
          ],
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Divider(
          color: theme.colorScheme.onPrimary.withOpacity(0.1),
        )
      ],
    );
  }
}
