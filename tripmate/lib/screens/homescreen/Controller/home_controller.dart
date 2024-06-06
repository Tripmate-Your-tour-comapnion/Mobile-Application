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

// Fetching to
  Future<void> fetchTopRatedHotels() async {
    // isLoading.value = true;

    final headers = {
      'Content-Type': 'application/json',
      'Cookie': 'token=${dotenv.env['TOKEN']}',
    };

    String url = '${dotenv.env['BACKEND_URL']}/rooms/get-all/';

    try {
      final response = await dio.get(
        url,
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );

      final hotels = response.data['message'] as List;
      List<HotelModel> temporaryList = [];

      for (var element in hotels) {
        if (element['room_rate']['value'] >= 4) {
          try {
            final topratedResponse = await dio.get(
              "${dotenv.env['BACKEND_URL']}/user/get-single-provider/${element['owner']}",
              options: Options(
                method: 'GET',
                headers: headers,
              ),
            );

            var hotel = topratedResponse.data;
            temporaryList.add(HotelModel.fromJson(hotel));
          } catch (e) {
            print("Error fetching hotel details: $e");
          }
        }
      }

      topRatedHotels.clear();
      topRatedHotels.addAll(temporaryList);
      print(topRatedHotels);
    } catch (e) {
      print("Error fetching top rated hotels: $e");
    } finally {
      // isLoading.value = false;
    }
  }
}
