import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/screens/hotel/model/room_reservation_model.dart';

class RoomReservationController extends GetxController {
  List<RoomReservationModel> roomReservations = <RoomReservationModel>[].obs;
  RxString paymentUrl = ''.obs;

  Future reserveRoom(String id, String checkin, String checkout, int quantitiy,
      int days) async {
    Dio dio = Dio();
    String baseUrl = dotenv.get('BASEURL');
    String url = '$baseUrl/reservation/reserve-room/$id';
    Map<String, dynamic> reservationData = {
      'quantity': quantitiy,
      'from': checkin,
      'to': checkout,
      'days': days,
    };
    String token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NTMzNjRhNmY4OTQ1MjFhNTkyYmEzOSIsInJvbGUiOiJ0b3VyaXN0Iiwic3RhdHVzIjoiYmFubmVkIiwiaWF0IjoxNzE2OTc4NDk4fQ.o4uNWAIGhwpM2pr_aIw13aBOxr1cwFtwUP3wqwW1MLw';
    final headers = {
      'Content-Type': 'application/json',
      'Cookie': 'token=$token',
    };
    try {
      final response = await dio.post(url,
          data: reservationData,
          options: Options(
            headers: headers,
          ));
      if (response.statusCode == 200) {
        paymentUrl.value = response.data['paymentUrl'];
        if (kDebugMode) {
          print(paymentUrl.value);
        }
      } else {
        if (kDebugMode) {
          print('reserve failed. ${response.data}');
        }
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (kDebugMode) {
          print('reserve failed. ${e.response?.data}');
        }
      } else {
        if (kDebugMode) {
          print('Error: $e');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('error $e');
      }
    }
  }

  void goToPaymentScreen(String url) {
    Get.to(url);
  }
}
