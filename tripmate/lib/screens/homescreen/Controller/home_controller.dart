import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:tripmate/screens/hotel/model/hotel_model.dart';
import 'package:tripmate/screens/hotel/model/room_model.dart';
import 'package:tripmate/screens/regitration/controller/registration_controller.dart';
import 'package:tripmate/screens/splash/controller/splashscreencontroller.dart';
import '../../../core/app_exports.dart';
import '../model/destination_model.dart'; // Import the models

class HomeScreenController extends GetxController {
  var destinationList = <Destination>[];
  var topRatedHotels = <HotelModel>[].obs;
  var topRatedRooms = <RoomModel>[].obs;
  var hotel;
  var isLoading = true;
  static final dio = Dio();
   RxString profileImage = "".obs;
  RxString userName = "".obs;

  @override
<<<<<<< HEAD
  onInit() async{
=======
  onInit() {
>>>>>>> a4962b977dd0b5ed7bef7490f2bb2d2ed414767f
    super.onInit();
    fetchTopRatedHotels();
   RegistrationController registrationController = Get.put(RegistrationController());
   
   await getUserByToken(await registrationController.tokenGetter());
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

<<<<<<< HEAD
  Future<void> getUserByToken(String token)async{
  String baseUrl = dotenv.get('BASEURL');
  final url = "$baseUrl/user/get-user-with-token";
  final dataToken = {
    'token':token
  };
  try {
    final response = await dio.get(url,data: dataToken);

    if (response.statusCode == 200) {
      if (kDebugMode) {
        
         print('the current user is: ${response.data}');
          //  profileImage.value = response.data[''];
   userName.value =response.data['full_name'];
       
      }

      
    } else {
      if (kDebugMode) {
        print('Request failed with status: ${response.statusCode}, data: ${response.data}');
      }

    }
  } on DioException catch (e) {
    if (e.response != null) {
      if (kDebugMode) {
        print("Dio error response status: ${e.response!.statusCode}, data: ${e.response!.data}");
      }

    } else {
      if (kDebugMode) {
        print('Dio error: $e.messaget');
      }
    }
  } catch (e) {
    if (kDebugMode) {
      print('Unexpected error: $e');
    }
            

  }
       


  }
=======
  Future<void> searchForEverything() async {}
>>>>>>> a4962b977dd0b5ed7bef7490f2bb2d2ed414767f
}
