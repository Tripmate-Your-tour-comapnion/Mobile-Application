import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tripmate/core/app_exports.dart';
import '../onboarding/controller/onboarding_two_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

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
              ),
              // const SizedBox(height: 20),
              // CircularProgressIndicator(
              //   color: theme.colorScheme.primary,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
