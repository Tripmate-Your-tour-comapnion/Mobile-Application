import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/screens/hotel/model/room_model.dart';
import 'package:tripmate/screens/hotel/model/room_reservation_model.dart';

class RoomReservationController extends GetxController {
  List<RoomReservationModel> roomReservations = [
    RoomReservationModel(
      id: '1',
      hotelId: '1',
      roomId: '101',
      userId: 'user1',
      checkInDate: DateTime(2023, 1, 15),
      checkOutDate: DateTime(2023, 1, 20),
      numOfRooms: 2,
      price: 300.0,
      roomName: 'Deluxe Room',
      roomType: 'Deluxe',
    ),
    RoomReservationModel(
      id: '2',
      hotelId: '1',
      roomId: '102',
      userId: 'user2',
      checkInDate: DateTime(2023, 2, 10),
      checkOutDate: DateTime(2023, 2, 15),
      numOfRooms: 1,
      price: 150.0,
      roomName: 'Standard Room',
      roomType: 'Standard',
    ),
    // Add more room reservation entries
    RoomReservationModel(
      id: '3',
      hotelId: '2',
      roomId: '201',
      userId: 'user3',
      checkInDate: DateTime(2023, 3, 5),
      checkOutDate: DateTime(2023, 3, 10),
      numOfRooms: 3,
      price: 250.0,
      roomName: 'Ocean View Room',
      roomType: 'Ocean View',
    ),
    RoomReservationModel(
      id: '4',
      hotelId: '2',
      roomId: '202',
      userId: 'user4',
      checkInDate: DateTime(2023, 4, 20),
      checkOutDate: DateTime(2023, 4, 25),
      numOfRooms: 1,
      price: 180.0,
      roomName: 'Family Room',
      roomType: 'Family',
    ),
    // Add more room reservation entries accordingly
  ].obs;

  RoomReservationModel roomReserve(RoomReservationModel roomResevation) {
    roomReservations.add(roomResevation);
    return roomResevation;
  }

  Rx<DateTime> selectedCheckinDate = DateTime.now().obs;
  Future<void> selectCheckinDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedCheckinDate.value,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedCheckinDate.value) {
      selectedCheckinDate.value = picked;
    }
  }

  Rx<DateTime> selectedCheckoutDate = DateTime.now().obs;
  Future<void> selectCheckoutDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedCheckinDate.value.add(const Duration(days: 1)),
      firstDate: selectedCheckinDate.value.add(const Duration(days: 1)),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedCheckinDate.value) {
      selectedCheckoutDate.value = picked;
    }
  }

// drop down menu

  RxInt selectedDropdownItem = 1.obs;
  late final List<Map<String, dynamic>> dropdownItems;

  void selectDropdownItem(int item) {
    selectedDropdownItem.value = item;
  }

  void goToPay(
      RoomModel room, DateTime checkInDate, DateTime checkOutDate, int rooms) {
    Get.toNamed(AppRoutes.roomPaymentSummaryScreen, arguments: {
      "room": room,
      "checkInDate": selectedCheckinDate.value,
      "checkOutDate": selectedCheckoutDate.value,
      "numberOfRooms": selectedDropdownItem.value
    });
  }
}
