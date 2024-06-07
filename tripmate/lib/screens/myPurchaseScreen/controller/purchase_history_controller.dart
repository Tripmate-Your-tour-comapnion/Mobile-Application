import 'package:dio/dio.dart';
import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/screens/myPurchaseScreen/model/subscription.dart';
import 'package:tripmate/screens/productDetail/model/order_model.dart';

import '../model/orders.dart';
import '../model/reservation.dart';

class PurchaseHistoryController extends GetxController {
  var reservationList = <Reservation>[].obs;
  var purchaseList = <Purchase>[].obs;
  var subscriptionList = <TravelPackage>[].obs;
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

      if (response.data['reservations'] is List) {
        final newReservations = (response.data['reservations'] as List)
            .map((json) => Reservation.fromJson(json))
            .toList();

        for (var reservation in newReservations) {
          if (!reservationList.contains(reservation)) {
            reservationList.add(reservation);
          }
        }
      }

      if (response.data['purchases'] is List) {
        final newPurchases = (response.data['purchases'] as List)
            .map((json) => Purchase.fromJson(json))
            .toList();

        for (var purchase in newPurchases) {
          if (!purchaseList.contains(purchase)) {
            purchaseList.add(purchase);
          }
        }
      }

      if (response.data['subscriptions'] is List) {
        final newSubscriptions = (response.data['subscriptions'] as List)
            .map((json) => TravelPackage.fromJson(json))
            .toList();

        for (var subscription in newSubscriptions) {
          if (!subscriptionList.contains(subscription)) {
            subscriptionList.add(subscription);
          }
        }
      }

      update();
    } catch (e) {
      print(e);
    }
  }
}
