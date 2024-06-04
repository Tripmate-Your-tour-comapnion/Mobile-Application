import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../core/app_exports.dart';
import '../model/destination_model.dart'; // Import the models

class HomeScreenController extends GetxController {
  var destinationList = <Destination>[];
  var isLoading = true;
  static final dio = Dio();

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

      print(response);
      if (response.data is List) {
        destinationList = (response.data as List)
            .map((json) => Destination.fromJson(json))
            .toList();
      } else {
        throw Exception("Invalid data format");
      }
    } catch (e) {
      // Handle error (log, show error message, etc.)
      print("Error fetching destinations: $e");
    } finally {}
  }
}
