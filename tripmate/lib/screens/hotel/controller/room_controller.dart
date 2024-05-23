import 'package:tripmate/core/app_exports.dart';

import '../model/room_model.dart';

class RoomController extends GetxController {
  RxList<RoomModel> rooms = [
    RoomModel(
      id: '1',
      hotelId: '1',
      roomName: 'Standard Room',
      roomImage: ['image1.jpg', 'image2.jpg'],
      roomDescription:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries but also the leap into electronic typesetting, remaining essentially unchanged',
      roomPrice: 100.0,
      roomRate: {'value': 4.5, 'total': 100, 'rater_number': 50},
      roomAmount: 10,
      roomsAvailable: 5,
    ),
    RoomModel(
      id: '2',
      hotelId: '1',
      roomName: 'Luxury Suite',
      roomImage: ['image3.jpg', 'image4.jpg'],
      roomDescription:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries but also the leap into electronic typesetting, remaining essentially unchanged',
      roomPrice: 200.0,
      roomRate: {'value': 4.0, 'total': 80, 'rater_number': 40},
      roomAmount: 5,
      roomsAvailable: 3,
    ),
    RoomModel(
      id: '3',
      hotelId: '1',
      roomName: 'Family Room',
      roomImage: ['image5.jpg', 'image6.jpg'],
      roomDescription:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries but also the leap into electronic typesetting, remaining essentially unchanged',
      roomPrice: 150.0,
      roomRate: {'value': 4.2, 'total': 90, 'rater_number': 45},
      roomAmount: 8,
      roomsAvailable: 4,
    ),
    RoomModel(
      id: '4',
      hotelId: '2',
      roomName: 'Deluxe Room',
      roomImage: ['image7.jpg', 'image8.jpg'],
      roomDescription:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries but also the leap into electronic typesetting, remaining essentially unchanged',
      roomPrice: 120.0,
      roomRate: {'value': 4.7, 'total': 95, 'rater_number': 50},
      roomAmount: 12,
      roomsAvailable: 6,
    ),
    RoomModel(
      id: '5',
      hotelId: '2',
      roomName: 'Executive Room',
      roomImage: ['image9.jpg', 'image10.jpg'],
      roomDescription:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries but also the leap into electronic typesetting, remaining essentially unchanged',
      roomPrice: 180.0,
      roomRate: {'value': 4.9, 'total': 100, 'rater_number': 50},
      roomAmount: 4,
      roomsAvailable: 2,
    ),
    RoomModel(
      id: '6',
      hotelId: '2',
      roomName: 'Penthouse Suite',
      roomImage: ['image11.jpg', 'image12.jpg'],
      roomDescription:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries but also the leap into electronic typesetting, remaining essentially unchanged',
      roomPrice: 300.0,
      roomRate: {'value': 4.8, 'total': 96, 'rater_number': 50},
      roomAmount: 7,
      roomsAvailable: 3,
    ),
  ].obs;

  RxList<RoomModel> findRoomByHotelId(String id) {
    RxList<RoomModel> HotelsRoom = <RoomModel>[].obs;
    HotelsRoom.assignAll(rooms.where((room) => id == room.hotelId));
    return HotelsRoom;
  }

  RoomModel findRoomById(String id) {
    return rooms.firstWhere((room) => id == room.id);
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
}
