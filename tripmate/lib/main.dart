import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './screens/splash/splash_screen.dart';

void main() {
  runApp(const TripMateApp());
}

class TripMateApp extends StatelessWidget {
  const TripMateApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TripMate',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SplashScreeen(),
    );
  }
}

