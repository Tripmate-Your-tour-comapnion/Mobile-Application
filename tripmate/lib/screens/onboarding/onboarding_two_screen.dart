import 'package:flutter/material.dart';
import 'package:tripmate/screens/onboarding/controller/onboarding_two_controller.dart';
import '../../../core/app_exports.dart';

import '../../widgets/custom_elevated_button.dart';

class OnboardingTwoScreen extends StatelessWidget {
  const OnboardingTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding:  EdgeInsets.symmetric(
          horizontal: size.width*0.03,
            vertical: size.height*0.1,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              Container(
                width: 311,
                margin: EdgeInsets.only(right: size.width*0.04),
                child: Text(
                 "It is travel time let's get descover",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.displayMedium,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: 307,
                margin:  EdgeInsets.only(right: size.width*0.04),
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since.",
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.bodyMediumOnPrimary15,
                ),
              ),
              const Spacer(),
              CustomElevatedButton(
                text: "Lets get Started",
                margin: const EdgeInsets.symmetric(horizontal: 43),
                buttonStyle: CustomButtonStyles.outlinePrimaryTL10,
                buttonTextStyle: CustomTextStyles.titleLargeBold,
                alignment: Alignment.center,
                onPressed: () {
                 OnboardingTwoController().goToRegistration();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
