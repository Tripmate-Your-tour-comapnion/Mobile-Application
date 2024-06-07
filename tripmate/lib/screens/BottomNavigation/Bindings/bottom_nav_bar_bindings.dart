import 'package:tripmate/screens/BlogScreen/Controller/blogcontroller.dart';
import 'package:tripmate/screens/setting/controller/setting_controller.dart';

import '../../homescreen/Controller/home_controller.dart';
import '../../myPurchaseScreen/controller/purchase_history_controller.dart';
import '../controller/bottomnavcontroller.dart';

import '../../../core/app_exports.dart';

class BottomNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavBarController());
    Get.lazyPut(() => HomeScreenController());
    Get.put(() => BlogController());
    Get.put(() => SettingController());
    Get.put(PurchaseHistoryController());
  }
}
