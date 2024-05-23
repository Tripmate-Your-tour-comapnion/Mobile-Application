import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tripmate/theme/theme_helper.dart';

import '../../../core/app_exports.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const TripMateApp());
}

class TripMateApp extends StatelessWidget {
  const TripMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Set the status bar color and icon brightness here
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Set the color of the status bar
      statusBarIconBrightness: Brightness
          .dark, // Set the brightness of the icons (Brightness.dark for dark icons)
    ));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TripMate',
      locale: Get.deviceLocale,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.pages,
    );
  }
}
