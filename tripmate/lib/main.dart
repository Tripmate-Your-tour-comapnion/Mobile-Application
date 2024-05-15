import 'package:flutter/material.dart';

import '../../../core/app_exports.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const TripMateApp());
}

class TripMateApp extends StatelessWidget {
  const TripMateApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TripMate',
      theme: ThemeData(
        useMaterial3: true,
      ),
        initialRoute: AppRoutes.initialRoute,
        getPages: AppRoutes.pages,
    );
  }
}

