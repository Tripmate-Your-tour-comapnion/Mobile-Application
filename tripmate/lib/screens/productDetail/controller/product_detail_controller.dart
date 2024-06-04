import 'package:dio/dio.dart';
import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/screens/ProductList/model/product_model.dart';

import '../model/order_model.dart';
import '../model/payment_model.dart';

class ProductOrderController extends GetxController {
  static final dio = Dio();
  var isLoading = false.obs;
  bool cantOrder = false;
  var quantity = 1.obs;
  PaymentModel paymentModel = PaymentModel(message: '', checkoutUrl: '');
  Product product = Product(
      productName: '',
      productDescription: '',
      productImages: [],
      productPrice: 0,
      productQuantity: 0,
      productAvailable: 0,
      id: 'id');

  Future<void> fetchProduct(String id) async {
    try {
      final headers = {
        'Content-Type': 'application/json',
        'Cookie': 'token=${dotenv.env['TOKEN']}',
      };

      final response = await dio.get(
        "${dotenv.env['BACKEND_URL']}/goods/get-single/$id",
        options: Options(method: 'GET', headers: headers),
      );
      cantOrder = response.isBlank!;
      product = Product.fromJson(response.data);
      print(product);
    } catch (e) {
      print("Error sending order: $e");
    }
  }

  Future<void> orderProduct(Order order) async {
    Map<String, dynamic> finalOrder = {
      'pid': order.productId,
      'quantity': quantity.value,
    };
    isLoading.value = true;
    // print(finalOrder);
    try {
      final headers = {
        'Content-Type': 'application/json',
        'Cookie': 'token=${dotenv.env['TOKEN']}',
      };
      print(finalOrder);
      final response = await dio.post(
        "${dotenv.env['BACKEND_URL']}/purchase/purchase-product/${finalOrder['pid']}",
        data: finalOrder,
        options: Options(method: 'POST', headers: headers),
      );

      print(response);
      if (response.statusCode == 200) {
        if (response.data != null &&
            response.data.containsKey('msg') &&
            response.data.containsKey('paymentUrl')) {
          isLoading.value = true;
          paymentModel.message = response.data['msg'];
          paymentModel.checkoutUrl = response.data['paymentUrl'];
        } else {
          throw Exception('Invalid response data');
        }
      } else {
        throw Exception('Failed to send order: ${response.statusCode}');
      }
    } catch (e) {
      print("Error sending order: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void increaseQuantity() {
    quantity.value = (quantity.value + 1);
    update();
  }

  void decreasQuantity() {
    if (quantity.value > 1) quantity.value = (quantity.value - 1);
    update();
  }
}
