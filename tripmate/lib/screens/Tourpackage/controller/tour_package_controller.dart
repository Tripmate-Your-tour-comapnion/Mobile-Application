// ignore_for_file: unused_import

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/screens/agent_detail_screen/model/tour_agent_model.dart';

import '../../hotel/model/hotel_model.dart';
import '../model/tourpackage_model.dart';

class TourPackageController extends GetxController {
  RxList<TourpackageModel> tours = <TourpackageModel>[].obs;

  TextEditingController searchController = TextEditingController();
  RxList<TourpackageModel> filteredTours = <TourpackageModel>[].obs;
  RxString paymentUrl = "".obs;
  @override
  void onInit() async {
    await fetchTourpackages();
    if (searchController.text == "") {
      filteredTours.value = tours;
    }
    super.onInit();
  }

  void searchTourpackage(String query) {
    if (query.isEmpty) {
      filteredTours.value = tours;
    } else {
      filteredTours.value = tours.where((tour) {
        return tour.packageName!.toLowerCase().contains(query.toLowerCase()) ||
            tour.packageDescription!
                .toLowerCase()
                .contains(query.toLowerCase());
      }).toList();
    }
  }

  Future fetchTourpackages() async {
    String baseUrl = dotenv.get('BASEURL');
    String url = '$baseUrl/tours/get-all';

    Dio dio = Dio();
    String token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NTMzNjRhNmY4OTQ1MjFhNTkyYmEzOSIsInJvbGUiOiJ0b3VyaXN0Iiwic3RhdHVzIjoiYmFubmVkIiwiaWF0IjoxNzE2OTc4NDk4fQ.o4uNWAIGhwpM2pr_aIw13aBOxr1cwFtwUP3wqwW1MLw';
    final headers = {
      'Content-Type': 'application/json',
      'Cookie': 'token=$token',
    };
    try {
      final response = await dio.get(url,
          options: Options(
            headers: headers,
          ));

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['tours'];

        tours.value =
            data.map((tour) => TourpackageModel.fromJson(tour)).toList();
        if (kDebugMode) {
          print(tours);
        }
      } else {
        if (kDebugMode) {
          print('Failed to load hotels: ${response.statusCode}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }

  TourpackageModel findTourById(String id) {
    return tours.firstWhere((tour) => tour.iId == id);
  }

  void goToPackageDetail(String tourId) {
    if (kDebugMode) {
      print(tourId);
    }
    Get.toNamed(AppRoutes.packageDetail, arguments: {
      'package': findTourById(tourId),
    });
  }

  Future subscribePackage(String tourId, int qnt) async {
    String baseUrl = dotenv.get('BASEURL');
    String url = '$baseUrl/subscribe/subscribe-tour/$tourId';

    Dio dio = Dio();
    Map<String, dynamic> data = {
      "quantity": qnt,
    };
    String token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NTMzNjRhNmY4OTQ1MjFhNTkyYmEzOSIsInJvbGUiOiJ0b3VyaXN0Iiwic3RhdHVzIjoiYmFubmVkIiwiaWF0IjoxNzE2OTc4NDk4fQ.o4uNWAIGhwpM2pr_aIw13aBOxr1cwFtwUP3wqwW1MLw';
    final headers = {
      'Content-Type': 'application/json',
      'Cookie': 'token=$token',
    };
    try {
      final response = await dio.post(url,
          data: data,
          options: Options(
            headers: headers,
          ));

      if (response.statusCode == 200) {
        paymentUrl.value = response.data['paymentUrl'];
        if (kDebugMode) {
          print(paymentUrl);
        }
      } else {
        if (kDebugMode) {
          print('Failed to to subscribes: ${response.statusCode}');
        }
        return response.data;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
    return 'error';
  }
}
