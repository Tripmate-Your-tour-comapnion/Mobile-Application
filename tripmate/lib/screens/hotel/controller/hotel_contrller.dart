import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/screens/hotel/model/hotel_model.dart';

class HotelController extends GetxController {
  final RxList<HotelModel> _originalHotels = <HotelModel>[].obs;

  List<HotelModel> get hotels => _originalHotels;

  void goToHotelDetail(String id) {
    Get.toNamed(AppRoutes.hotelDetailScreen, arguments: findById(id));
  }

  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() async {
    searchController.addListener(() {
      fetchHotels(searchController.text);
    });
    await fetchHotels('');
    super.onInit();
  }

  HotelModel findById(String id) {
    return _originalHotels.firstWhere((hotel) => id == hotel.hotelId);
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

  Future fetchHotels(String hotelName) async {
    String baseUrl = dotenv.get('BASEURL');
    String url = '$baseUrl/user/search-hotel/$hotelName';

    Dio dio = Dio();

    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        _originalHotels.value =
            data.map((hotelJson) => HotelModel.fromJson(hotelJson)).toList();
      } else {
        if (kDebugMode) {
          print('Failed to load hotels: ${response.statusCode}');
        }
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
