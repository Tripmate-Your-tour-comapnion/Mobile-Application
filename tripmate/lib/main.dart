import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:tripmate/helpers/init_dependency.dart';

import '../../../core/app_exports.dart';
import 'screens/changePasswordScreen/changepasswordscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await dotenv.load(fileName: ".env");
  InitDependency.init;
  runApp(const TripMateApp());
}

class TripMateApp extends StatelessWidget {
  const TripMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TripMate',
      locale: Get.deviceLocale,
      theme: ThemeData(
        useMaterial3: true,
      ),
<<<<<<< HEAD
     
=======
      // home: ChangePasswordScreen(),
>>>>>>> a4962b977dd0b5ed7bef7490f2bb2d2ed414767f
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.pages,
    );
  }
}
