import 'package:flutter/material.dart';

class OnboardingTwoScreen extends StatelessWidget {
  const OnboardingTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(
            horizontal: 19,
            vertical: 88,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              Container(
                width: 311,
                margin: const EdgeInsets.only(right: 78),
                child: const Text(
                 "Travel Time",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style:TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: 307,
                margin: const EdgeInsets.only(right: 82),
                child: const Text(
             "Simple",
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ),
              const Spacer(),
              // CustomElevatedButton(
              //   text: "lbl_get_started".tr,
              //   margin: EdgeInsets.symmetric(horizontal: 43.h),
              //   buttonStyle: CustomButtonStyles.outlinePrimaryTL10,
              //   buttonTextStyle: CustomTextStyles.titleLargeBold,
              //   alignment: Alignment.center,
              // )
            ],
          ),
        ),
      ),
    );
  }
}