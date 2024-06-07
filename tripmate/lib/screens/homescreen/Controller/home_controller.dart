import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tripmate/screens/hotel/model/hotel_model.dart';
import 'package:tripmate/screens/hotel/model/room_model.dart';
import '../../../core/app_exports.dart';
import '../model/destination_model.dart'; // Import the models

class HomeScreenController extends GetxController {
  var destinationList = <Destination>[];
  var topRatedHotels = <HotelModel>[].obs;
  var topRatedRooms = <RoomModel>[].obs;
  var hotel;
  var isLoading = true;
  static final dio = Dio();

  @override
  onInit() {
    super.onInit();
    fetchTopRatedHotels();
  }

  static final url = "${dotenv.env['BACKEND_URL']}/destinations/get-all";

  Future<void> fetchDestinations() async {
    try {
      final response = await dio.get(
        url,
        options: Options(
          method: 'GET',
          headers: {
            'Authorization': '',
          },
        ),
      );

      if (response.data is List) {
        destinationList = (response.data as List)
            .map((json) => Destination.fromJson(json))
            .toList();
      } else {
        throw Exception("Invalid data format");
      }
    } catch (e) {
      print("Error fetching destinations: $e");
    } finally {}
  }

  // Fetching top-rated hotels
  Future<void> fetchTopRatedHotels() async {
    try {
      final headers = {
        'Content-Type': 'application/json',
        'Cookie': 'token=${dotenv.env['TOKEN']}',
      };

      String url = '${dotenv.env['BACKEND_URL']}/rooms/get-top-rated-hotels/';

      final response = await dio.get(
        url,
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );
      topRatedHotels.value = (response.data as List)
          .map((json) => HotelModel.fromJson(json))
          .toList();
    } catch (e) {
      print("Error fetching top rated hotels: $e");
    } finally {
      isLoading = false; // Hide loading widget
      update(); // Update UI to hide loading
    }
  }

  Future<void> searchForEverything() async {}
}
