import 'package:flutter/material.dart';
import '../../../core/app_exports.dart';

import '../../widgets/custom_elevated_button.dart';

class OnboardingTwoScreen extends StatelessWidget {
  const OnboardingTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 19.h,
            vertical: 88.v,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 16.v),
              Container(
                width: 311.h,
                margin: EdgeInsets.only(right: 78.h),
                child: Text(
                  "msg_it_s_travel_time".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.displayMedium,
                ),
              ),
              SizedBox(height: 12.v),
              Container(
                width: 307.h,
                margin: EdgeInsets.only(right: 82.h),
                child: Text(
                  "msg_lorem_ipsum_is_simply".tr,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.bodyMediumOnPrimary15,
                ),
              ),
              Spacer(),
              CustomElevatedButton(
                text: "lbl_get_started".tr,
                margin: EdgeInsets.symmetric(horizontal: 43.h),
                buttonStyle: CustomButtonStyles.outlinePrimaryTL10,
                buttonTextStyle: CustomTextStyles.titleLargeBold,
                alignment: Alignment.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
