//  Screens

import 'package:tripmate/screens/AddProduct/Binding/add_product_binding.dart';
import 'package:tripmate/screens/AddProduct/addProduct.dart';
import 'package:tripmate/screens/AddTourPackage/Binding/add_tour_binding.dart';
import 'package:tripmate/screens/AddTourPackage/add_tour_package.dart';
import 'package:tripmate/screens/BlogScreen/blog_detail.dart';
import 'package:tripmate/screens/BottomNavigation/Bindings/bottom_nav_bar_bindings.dart';
import 'package:tripmate/screens/BottomNavigation/bottomnavigation.dart';
import 'package:tripmate/screens/DiscoveryDetail/Binding/discovery_detail_bindings.dart';
import 'package:tripmate/screens/DiscoveryDetail/discoverydetailscreen.dart';
import 'package:tripmate/screens/ProductList/Binding/product_list_binder.dart';
import 'package:tripmate/screens/ProductList/product_list_screen.dart';
import 'package:tripmate/screens/ShopListScreen/Binding/shop_list_binding.dart';
import 'package:tripmate/screens/ShopListScreen/shop_list_screen.dart';
import 'package:tripmate/screens/Tourpackage/Binding/tour_package_binding.dart';
import 'package:tripmate/screens/Tourpackage/tour_package_screen.dart';
import 'package:tripmate/screens/packageDetail/Binding/package_detail_binding.dart';
import 'package:tripmate/screens/packageDetail/package_detail_screen.dart';
import 'package:tripmate/screens/productDetail/Binding/product_detail_binding.dart';
import 'package:tripmate/screens/productDetail/program_detail.dart';

import '../screens/BlogScreen/Binding/blogdetail_binding.dart';
import '../screens/homescreen/Binding/home_bindings.dart';
import '../screens/regitration/Binding/registration_bindings.dart';
import '../screens/onboarding/Binding/onboarding_one_binding.dart';
import '../screens/onboarding/Binding/onboarding_two_binding.dart';

//  Bindings

import '../screens/onboarding/onboarding_one_screen.dart';
import '../screens/onboarding/onboarding_two_screen.dart';
import '../screens/regitration/registeration_screen.dart';
import '../screens/homescreen/homescreen.dart';

//  Core File

import '../core/app_exports.dart';

// Route Implementation

class AppRoutes {
  static const String onboardingoneScreen = '/onboardingScreen_one';
  static const String onboardingtwoScreen = '/onboardingScreen_two';
  static const String registerationScreen = '/registrationScreen';
  static const String homescreen = '/homescreen';
  static const String discoveryDetail = '/discoverydetail';
  static const String blogDetail = '/blogDetail';
  static const String shoplist = '/shoplist';
  static const String productList = "/productList";
  static const String productDetail = "/productDetail";
  static const String addProduct = "/addProduct";
  static const String addTourPackage = "/addTourPackage";
  static const String tourPackage = "/tourpackageScreen";
  static const String packageDetail = "/packagedetailScreen";
  static const String initialRoute = '/initialRoutes';

  static List<GetPage> pages = [
    // GetPage(
    //   name: initialRoute,
    //   page: () => const SplashScreeen(),
    //   bindings: [SplashScreenBinding()],
    // ),
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
    GetPage(
      name: initialRoute,
      page: () => BottomNavigation(),
      bindings: [BottomNavBarBinding()],
    ),
    GetPage(
      name: discoveryDetail,
      page: () => DiscoveryDetail(),
      bindings: [DiscoveryDetailBinding()],
    ),
    GetPage(
      name: blogDetail,
      page: () => const BlogDetail(),
      bindings: [BlogDetailBinding()],
    ),
    GetPage(
      name: shoplist,
      page: () => const ShopListScreen(),
      bindings: [ShopListBinding()],
    ),
    GetPage(
        name: productList,
        page: () => const ProductListScreen(),
        bindings: [ProductListBinding()]),

    GetPage(
        name: productDetail,
        page: () => const ProductDetailScreen(),
        bindings: [ProductDetailBinding()]),

    GetPage(
        name: addProduct,
        page: () => const AddProductScreen(),
        bindings: [AddProductBinding()]),
    GetPage(
        name: addTourPackage,
        page: () => const AddTourPackageScreen(),
        bindings: [AddTourPackageBinding()]),

    GetPage(
        name: tourPackage,
        page: () => const TourPackageScreen(),
        bindings: [TourPackageBinding()]),
    GetPage(
        name: packageDetail,
        page: () => const PackageDetailScreen(),
        bindings: [PackageDetailScreenBinding()])
  ];
}
