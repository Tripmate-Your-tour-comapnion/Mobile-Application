import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../../core/app_exports.dart';

class SplashScreeen extends StatefulWidget {
  const SplashScreeen({Key? key})
      : super(
          key: key,
        );

  @override
  State<SplashScreeen> createState() => _SplashScreeenState();
}

class _SplashScreeenState extends State<SplashScreeen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    Future.delayed(const Duration(seconds: 2), () {
      final tripmate = GetStorage();
      if (tripmate.read('isOpendBefore') != null) {
        Get.offNamed(AppRoutes.tourpackageScreen);
      } else {
        Get.offNamed(AppRoutes.onboardingoneScreen);
      }
    });

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "TripMate",
                style: theme.textTheme.displayMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}
