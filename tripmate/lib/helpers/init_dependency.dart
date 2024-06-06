import 'package:get/get.dart';
import 'package:tripmate/core/utils/network.dart';

//  this class is used to inject dependancy

class InitDependency {
  static void init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}
