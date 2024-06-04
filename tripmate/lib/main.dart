import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tripmate/screens/onboarding/onboarding_one_screen.dart';

import '../../../core/app_exports.dart';
import 'screens/onboarding/controller/onboarding_two_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await dotenv.load(fileName: ".env");
  runApp(const TripMateApp());
}

class TripMateApp extends StatelessWidget {
  const TripMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Set the status bar color and icon brightness here
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white, // Set the color of the status bar
      statusBarIconBrightness: Brightness
          .dark, // Set the brightness of the icons (Brightness.dark for dark icons)
    ));

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TripMate',
      locale: Get.deviceLocale,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        useMaterial3: true,
      ),
      // home:OnboardingOneScreen(),
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.pages,
    );
  }
}
