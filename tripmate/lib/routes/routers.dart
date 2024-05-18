import 'package:tripmate/screens/regitration/Binding/registration_bindings.dart';
import 'package:tripmate/screens/setting/Binding/edit_profile_Binding.dart';
import 'package:tripmate/screens/setting/Binding/setting_binding.dart';
import 'package:tripmate/screens/setting/edit_profile_screen.dart';
import 'package:tripmate/screens/splash/Binding/splashScreenBinding.dart';

import '../core/app_exports.dart';
import 'package:tripmate/screens/splash/splash_screen.dart';

import '../screens/onboarding/Binding/onboarding_one_binding.dart';
import '../screens/onboarding/Binding/onboarding_two_binding.dart';
import '../screens/onboarding/onboarding_one_screen.dart';
import '../screens/onboarding/onboarding_two_screen.dart';
import '../screens/regitration/registeration_screen.dart';
import '../screens/setting/setting_screen.dart';

class AppRoutes {
  static const String editProfile = '/edit_profile_screen';
  static const String settingScreen = '/setting_screen';
  static const String onboardingoneScreen = '/onboardingScreen_one';
  static const String onboardingtwoScreen = '/onboardingScreen_two';
  static const String registerationScreen = '/registrationScreen';
// static const String appNavigationScreen = '/app_navigation_screen';
  static const String initialRoute = '/initialRoutes';

  static List<GetPage> pages = [
    GetPage(
      name: editProfile,
      page: () => const EditProfileScreen(),
      bindings: [EditProfileBinding()],
    ),
    GetPage(
      name: settingScreen,
      page: () => const SettingScreen(),
      bindings: [SettingBinding()],
    ),
    GetPage(
      name: initialRoute,
      page: () => const SplashScreeen(),
      bindings: [SplashScreenBinding()],
    ),
    GetPage(
      name: onboardingoneScreen,
      page: () => const OnboardingOneScreen(),
      bindings: [OnboardingOneBinding()],
    ),
    GetPage(
      name: onboardingtwoScreen,
      page: () => const OnboardingTwoScreen(),
      bindings: [OnboardingTwoBinding()],
    ),
    GetPage(
      name: registerationScreen,
      page: () => const RegistrationScreen(),
      bindings: [RegistrationBinding()],
    ),
  ];
}
