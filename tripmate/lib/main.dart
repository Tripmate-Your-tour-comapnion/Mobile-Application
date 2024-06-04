import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';

import '../../../core/app_exports.dart';

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

      statusBarIconBrightness: Brightness.dark,
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
