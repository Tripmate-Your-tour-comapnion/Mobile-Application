import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/screens/hotel/Binding/room_reservation_binding.dart';
import 'package:tripmate/screens/hotel/controller/room_controller.dart';

class RoomBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => RoomController());
  }
}
