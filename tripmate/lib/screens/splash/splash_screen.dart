import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripmate/screens/onboarding/onboarding_one_screen.dart';

class SplashScreeen extends StatefulWidget {
  const SplashScreeen({super.key});

  @override
  State<SplashScreeen> createState() => _SplashScreeenState();
}

class _SplashScreeenState extends State<SplashScreeen> {
  @override
  void initState() {
   Future.delayed(const Duration(seconds: 2),(){
    Get.to(const OnboardingOneScreen());
   });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("TripMate"),),
    ) ;
  }
}