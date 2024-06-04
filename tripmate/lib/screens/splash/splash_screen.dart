import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripmate/core/app_exports.dart';
import '../onboarding/controller/onboarding_two_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Controller controller = Get.put(Controller());

  @override
  void initState() {
    super.initState();
    // Navigate after 4 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(controller.route);
    });
  }

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
