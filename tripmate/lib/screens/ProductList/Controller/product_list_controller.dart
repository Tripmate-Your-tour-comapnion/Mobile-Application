import 'package:dio/dio.dart';
import 'package:tripmate/screens/ProductList/model/product_model.dart';

import '../../../core/app_exports.dart';

class ProductListController extends GetxController {
  var productList = <Product>[].obs; // Make shopList observable
  var filteredProductList = <Product>[].obs;
  static final dio = Dio();

  Future<void> fetchProduct(String shopId) async {
    try {
      String token =
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NTMzNjRhNmY4OTQ1MjFhNTkyYmEzOSIsInJvbGUiOiJ0b3VyaXN0Iiwic3RhdHVzIjoiYmFubmVkIiwiaWF0IjoxNzE2OTc4NDk4fQ.o4uNWAIGhwpM2pr_aIw13aBOxr1cwFtwUP3wqwW1MLw';
      final headers = {
        'Content-Type': 'application/json',
        'Cookie': 'token=$token',
      };

      final response = await dio.get(
        "${dotenv.env['BACKEND_URL']}/goods/get-all-products/$shopId",
        options: Options(method: 'GET', headers: headers),
      );
      print(response.data);

      if (response.data is List) {
        productList.value = (response.data as List)
            .map((json) => Product.fromJson(json))
            .toList();

        filteredProductList.assignAll(productList);
        print(productList);
      } else {
        throw Exception("Invalid data format");
      }
    } catch (e) {
      // Handle error (log, show error message, etc.)
      print("Error fetching destinations: $e");
    }
  }

  Future<void> searchProduct(String value) async {
    try {
      String token =
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NTMzNjRhNmY4OTQ1MjFhNTkyYmEzOSIsInJvbGUiOiJ0b3VyaXN0Iiwic3RhdHVzIjoiYmFubmVkIiwiaWF0IjoxNzE2OTc4NDk4fQ.o4uNWAIGhwpM2pr_aIw13aBOxr1cwFtwUP3wqwW1MLw';
      final headers = {
        'Content-Type': 'application/json',
        'Cookie': 'token=$token',
      };

      final response = await dio.get(
        "${dotenv.env['BACKEND_URL']}/goods/get-all-products/$value",
        options: Options(method: 'GET', headers: headers),
      );
      print(response.data);

      if (response.data is List) {
        productList.value = (response.data as List)
            .map((json) => Product.fromJson(json))
            .toList();
        print(productList);
      } else {
        throw Exception("Invalid data format");
      }
    } catch (e) {
      // Handle error (log, show error message, etc.)
      print("Error fetching destinations: $e");
    }
  }

  void filterProductList(String value) {
    if (value.isEmpty) {
      print(filteredProductList);
      // If search query is empty, show all products
      filteredProductList.assignAll(productList);
    } else {
      // Filter the product list based on search query
      filteredProductList.assignAll(productList.where((product) =>
          product.productName.toLowerCase().contains(value.toLowerCase())));
    }
  }
}
