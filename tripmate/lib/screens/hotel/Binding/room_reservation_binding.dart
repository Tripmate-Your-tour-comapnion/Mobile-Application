import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/screens/hotel/controller/room_reservation_controller.dart';

class RoomReservationBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(() => RoomReservationController());
  }
}
