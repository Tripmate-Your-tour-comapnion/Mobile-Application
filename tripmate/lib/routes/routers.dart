//  Screens

// ignore_for_file: unused_import, duplicate_import

import 'package:tripmate/screens/agent_detail_screen/agent_deatil_screen.dart';
import 'package:tripmate/screens/agent_detail_screen/bindings/agent_binding.dart';
import 'package:tripmate/screens/Tourpackage/controller/tour_package_controller.dart';
import 'package:tripmate/screens/hotel/Binding/hotel_binding.dart';
import 'package:tripmate/screens/hotel/hotel_detail_screen.dart';
import 'package:tripmate/screens/hotel/room_detail_screen.dart';
import 'package:tripmate/screens/hotel/rooms_list_screen.dart';
import 'package:tripmate/screens/regitration/Binding/registration_bindings.dart';
import 'package:tripmate/screens/setting/Binding/edit_profile_Binding.dart';
import 'package:tripmate/screens/setting/Binding/setting_binding.dart';
import 'package:tripmate/screens/setting/edit_profile_screen.dart';
import 'package:tripmate/screens/splash/Binding/splashScreenBinding.dart';

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
import 'package:tripmate/screens/productDetail/product_detail.dart';

import '../screens/BlogScreen/Binding/blogdetail_binding.dart';
import '../screens/homescreen/Binding/home_bindings.dart';
import '../screens/hotel/controller/room_reservation_controller.dart';
import '../screens/hotel/room_payment_with_chapa.dart';
import '../screens/regitration/Binding/registration_bindings.dart';

import '../screens/hotel/Binding/room_binding.dart';
import '../screens/hotel/Binding/room_reservation_binding.dart';
import '../screens/hotel/hotels_screen.dart';
import '../screens/hotel/room_payment_summary_screen.dart';

import '../screens/onboarding/Binding/onboarding_one_binding.dart';

//  Bindings

import '../screens/onboarding/onboarding_one_screen.dart';

import '../screens/regitration/registeration_screen.dart';

//  Core File

import '../core/app_exports.dart';
import '../screens/setting/setting_screen.dart';
import '../screens/splash/splash_screen.dart';

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

  static const String roomDtailScreen = '/room_detail_screen';
  static const String roomListScreen = '/room_list_screen';
  static const String roomPaymentSummaryScreen = '/room_payment_summary_screen';
  static const String hotelDetailScreen = '/hotel_detail_screen';
  static const String hotelHomeScreen = '/hotels_screen';
  static const String editProfile = '/edit_profile_screen';
  static const String settingScreen = '/setting_screen';
  static const String bottomNavigation = '/bottomNavigation';

  static const String tourpackageScreen = '/tourpackage_screen';
  static const String agentDetailScreen = '/agent_detial_contrller';

  static const String paymentwebView = '/paymentWebView';

  static List<GetPage> pages = [
    GetPage(
      name: agentDetailScreen,
      page: () => AgentDeatilScreen(),
      bindings: [AgentBinding()],
    ),
    GetPage(
      name: tourpackageScreen,
      page: () => TourPackageScreen(),
      bindings: [TourPackageBinding()],
    ),
    GetPage(
      name: bottomNavigation,
      page: () => BottomNavigation(),
      bindings: [BottomNavBarBinding(), HomeScreenBinding()],
    ),
    GetPage(
      name: roomDtailScreen,
      page: () => RoomDetailScreen(),
      bindings: [RoomBinding()],
    ),
    GetPage(
      name: roomListScreen,
      page: () => RoomListScreen(),
      bindings: [RoomBinding()],
    ),
    GetPage(
      name: roomPaymentSummaryScreen,
      page: () => RoomPaymentSummaryScreen(),
      bindings: [RoomReservationBinding()],
    ),
    GetPage(
      name: hotelDetailScreen,
      page: () => HotelDetailScreen(),
      bindings: [HotelBinding()],
    ),
    GetPage(
      name: hotelHomeScreen,
      page: () => const HotelsScreen(),
      bindings: [HotelBinding()],
    ),
    GetPage(
      name: bottomNavigation,
      page: () => BottomNavigation(),
      bindings: [BottomNavBarBinding(), HomeScreenBinding()],
    ),
    GetPage(
      name: editProfile,
      page: () => EditProfileScreen(),
      bindings: [EditProfileBinding()],
    ),
    GetPage(
      name: settingScreen,
      page: () => const SettingScreen(),
      bindings: [SettingBinding()],
    ),
    GetPage(
      name: initialRoute,
      page: () => const SplashScreen(),
      bindings: [SplashScreenBinding(), OnboardingOneBinding()],
    ),
    GetPage(
      name: onboardingoneScreen,
      page: () => const OnboardingOneScreen(),
      bindings: [OnboardingOneBinding()],
    ),
    GetPage(
      name: registerationScreen,
      page: () => const RegistrationScreen(),
      bindings: [RegistrationBinding()],
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
      page: () => ShopListScreen(),
      bindings: [ShopListBinding()],
    ),
    GetPage(
        name: productList,
        page: () => ProductListScreen(),
        bindings: [ProductListBinding()]),
    GetPage(
        name: productDetail,
        page: () => ProductDetailScreen(),
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
        page: () => TourPackageScreen(),
        bindings: [TourPackageBinding()]),
    GetPage(
        name: packageDetail,
        page: () => PackageDetailScreen(),
        bindings: [PackageDetailScreenBinding()])
  ];
}
