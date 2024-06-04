import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/screens/packageDetail/controller/package_detail_controller.dart';

class PackageDetailScreenBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => PackageDetailController());
  }
}
