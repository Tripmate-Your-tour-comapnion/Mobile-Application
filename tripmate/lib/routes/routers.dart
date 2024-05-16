import 'package:tripmate/screens/splash/Binding/splashScreenBinding.dart';

import '../core/app_exports.dart';
import 'package:tripmate/screens/splash/splash_screen.dart';

import '../screens/onboarding/Binding/onboarding_one_binding.dart';
import '../screens/onboarding/Binding/onboarding_two_binding.dart';
import '../screens/onboarding/onboarding_one_screen.dart';
import '../screens/onboarding/onboarding_two_screen.dart';

class AppRoutes{

static const String onboardingoneScreen = '/onboardingScreen_one';
static const String onboardingtwoScreen = '/onboardingScreen_two';
static const String registerScreen = '/registrationScreen';
static const String initialRoute = '/initialRoutes';






  static List<GetPage> pages = [
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
 
  ];


}
