// ignore_for_file: unnecessary_import

import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/screens/hotel/controller/room_controller.dart';

class RoomBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => RoomController());
  }
}
