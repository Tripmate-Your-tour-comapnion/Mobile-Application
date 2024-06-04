import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../model/shop_model.dart';

class ShopListController extends GetxController {
  var shopList = <Shop>[].obs; // Make shopList observable
  var filteredShopList = <Shop>[].obs;
  static final dio = Dio();

  Future<void> fetchShops() async {
    try {
      String token =
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NTMzNjRhNmY4OTQ1MjFhNTkyYmEzOSIsInJvbGUiOiJ0b3VyaXN0Iiwic3RhdHVzIjoiYmFubmVkIiwiaWF0IjoxNzE2OTc4NDk4fQ.o4uNWAIGhwpM2pr_aIw13aBOxr1cwFtwUP3wqwW1MLw';
      final headers = {
        'Content-Type': 'application/json',
        'Cookie': 'token=$token',
      };

      final response = await dio.get(
        "${dotenv.env['BACKEND_URL']}/user/search-shop",
        options: Options(method: 'GET', headers: headers),
      );
      print(response);

      if (response.data is List) {
        shopList.value =
            (response.data as List).map((json) => Shop.fromJson(json)).toList();

        filteredShopList.assignAll(shopList);
      } else {
        throw Exception("Invalid data format");
      }
    } catch (e) {
      // Handle error (log, show error message, etc.)
      print("Error fetching destinations: $e");
    }
  }

  void filterShopList(String value) {
    if (value.isEmpty) {
      // If search query is empty, show all products
      filteredShopList.assignAll(shopList);
    } else {
      // Filter the product list based on search query
      filteredShopList.assignAll(shopList.where((shop) =>
          shop.companyName!.toLowerCase().contains(value.toLowerCase())));
    }
  }
}
