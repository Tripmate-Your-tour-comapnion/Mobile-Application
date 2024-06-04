import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/screens/AddTourPackage/controller/add_tour_package.dart';

class AddTourPackageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddTourPackageController());
  }
}
