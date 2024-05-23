import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/screens/hotel/model/hotel_model.dart';

import '../../../data/constants.dart';

class HotelController extends GetxController {
  final RxList<HotelModel> _originalHotels = [
    HotelModel(
      id: 1,
      name: 'Hotel 1',
      location: 'Location 1',
      rate: 50.0,
      services: ['Service A', 'Service B'],
      imgs: [
        Constants.hotelImg,
        Constants.profileImg,
        Constants.hotelImg,
        Constants.profileImg,
        Constants.hotelImg,
        Constants.profileImg
      ],
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      price: 100.0,
    ),
    HotelModel(
      id: 2,
      name: 'Hotel 2',
      location: 'Location 2',
      rate: 60.0,
      services: ['Service C', 'Service D'],
      imgs: [
        Constants.hotelImg,
        Constants.profileImg,
        Constants.hotelImg,
        Constants.profileImg,
        Constants.hotelImg,
        Constants.profileImg
      ],
      description: 'Description for Hotel 2',
      price: 120.0,
    ),
    // Add more hotels with ids as needed
  ].obs;

  RxList<HotelModel> _hotels = <HotelModel>[].obs;

  List<HotelModel> get hotels => _hotels.toList();

  void goToHotelDetail(int id) {
    Get.toNamed(AppRoutes.hotelDetailScreen, arguments: findById(id));
  }

  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    _hotels.assignAll(_originalHotels);
    searchController.addListener(() {
      searchHotels(searchController.text);
    });
    super.onInit();
  }

  void searchHotels(String query) {
    if (query.isEmpty) {
      _hotels.assignAll(_originalHotels);
    } else {
      _hotels.assignAll(_originalHotels.where((hotel) {
        return hotel.name.toLowerCase().contains(query.toLowerCase());
      }).toList());
    }
  }

  HotelModel findById(int id) {
    return _hotels.firstWhere((hotel) => id == hotel.id);
  }

  final RxBool _isDescriptionExpanded = false.obs;

  bool get isExpanded => _isDescriptionExpanded.value;

  void expandAndShrink() {
    _isDescriptionExpanded.value = !_isDescriptionExpanded.value;
  }

  void goToRoomListScreen(HotelModel hotel) {
    // Get.back();
    Get.toNamed(AppRoutes.roomListScreen, arguments: hotel);
  }
}
