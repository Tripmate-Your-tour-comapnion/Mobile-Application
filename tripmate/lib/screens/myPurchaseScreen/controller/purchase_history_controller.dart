import 'package:dio/dio.dart';
import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/screens/productDetail/model/order_model.dart';

import '../model/reservation.dart';

class PurchaseHistoryController extends GetxController {
  var reservationList = <Reservation>[].obs;
  final dio = Dio();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchOrders();
  }

  Future<void> fetchOrders() async {
    try {
      final headers = {
        'Content-Type': 'application/json',
        'Cookie': 'token=${dotenv.env['TOKEN']}',
      };

      final response = await dio.get(
        "${dotenv.env['BACKEND_URL']}/user/get-my-activity/",
        options: Options(method: 'GET', headers: headers),
      );
      print(response.data['reservations']);

      if (response.data['reservations'] is List) {
        reservationList.value = (response.data['reservations'] as List)
            .map((json) => Reservation.fromJson(json))
            .toList();
      }

      print(reservationList);
    } catch (e) {
      print(e);
    }
  }
}
