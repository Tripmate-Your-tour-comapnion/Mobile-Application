import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/screens/Tourpackage/controller/tour_package_controller.dart';

class TourPackageBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => TourPackageController());
  }
}
