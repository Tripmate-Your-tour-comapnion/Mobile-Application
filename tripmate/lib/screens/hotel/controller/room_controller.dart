import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tripmate/core/app_exports.dart';

import '../model/room_model.dart';

class RoomController extends GetxController {
  RxList<RoomModel> rooms = <RoomModel>[].obs;
  RxString hotelId = ''.obs;

  @override
  void onInit() async {
    // await fetchRoomsOfHotel("665341b902850a67347ccc3a");
    super.onInit();
  }

  RoomModel findRoomById(String id) {
    return rooms.firstWhere((room) => id == room.roomId);
  }

  void goToRoomDetail(String id) {
    Get.toNamed(AppRoutes.roomDtailScreen, arguments: findRoomById(id));
  }

  void goBack() {
    Get.back();
  }

  final RxBool _isDescriptionExpanded = false.obs;

  bool get isExpanded => _isDescriptionExpanded.value;

  void expandAndShrink() {
    _isDescriptionExpanded.value = !_isDescriptionExpanded.value;
  }

  Future fetchRoomsOfHotel(String hotelId) async {
    String baseUrl = dotenv.get('BASEURL');
    String url = '$baseUrl/rooms//get-all-rooms/$hotelId';

    Dio dio = Dio();

    try {
      final response = await dio.get(
        url,
        // options: Options(
        //   headers: {
        //     'Authorization':
        //         'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NTMzNjRhNmY4OTQ1MjFhNTkyYmEzOSIsInJvbGUiOiJ0b3VyaXN0Iiwic3RhdHVzIjoiYmFubmVkIiwiaWF0IjoxNzE2OTc4NDk4fQ.o4uNWAIGhwpM2pr_aIw13aBOxr1cwFtwUP3wqwW1MLw', // Add your token here
        //     'Content-Type': 'application/json',
        //   },
        // )
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        rooms.value = data.map((room) => RoomModel.fromJson(room)).toList();
        if (kDebugMode) {
          print(rooms);
        }
      } else {
        if (kDebugMode) {
          print('Failed to load hotels: ${response.statusCode}');
        }
      }
    } catch (e) {
      print('Error: $e');
    }
  }

// reserve room

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

  void rateRoom(String roomId, double rate) async {
    String baseUrl = dotenv.get('BASEURL');
    String url = '$baseUrl/rooms//rate-room/$roomId';

    Dio dio = Dio();
    Map<String, dynamic> rateData = {
      'rate': rate,
    };
    String token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NTMzNjRhNmY4OTQ1MjFhNTkyYmEzOSIsInJvbGUiOiJ0b3VyaXN0Iiwic3RhdHVzIjoiYmFubmVkIiwiaWF0IjoxNzE2OTc4NDk4fQ.o4uNWAIGhwpM2pr_aIw13aBOxr1cwFtwUP3wqwW1MLw';
    final headers = {
      'Content-Type': 'application/json',
      'Cookie': 'token=$token',
    };
    try {
      final response = await dio.post(url,
          data: rateData,
          options: Options(
            headers: headers,
          ));
      if (response.statusCode == 200) {
        print(response);
      } else {
        if (kDebugMode) {
          print('Failed to rate: ${response.statusCode}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }
}
