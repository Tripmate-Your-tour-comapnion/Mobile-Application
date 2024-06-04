import 'package:tripmate/screens/BlogScreen/Controller/blogcontroller.dart';

import '../../homescreen/Controller/home_controller.dart';
import '../controller/bottomnavcontroller.dart';

import '../../../core/app_exports.dart';

class BottomNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavBarController());
    Get.lazyPut(() => HomeScreenController());
    Get.put(() => BlogController());
  }
}
