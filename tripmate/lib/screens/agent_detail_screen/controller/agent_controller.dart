// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tripmate/core/app_exports.dart';

import '../model/tour_agent_model.dart';

class AgentController extends GetxController {
  final agents = [].obs;
  final agentEmail = "".obs;

  TextEditingController searchController = TextEditingController();
  @override
  void onInit() {
    searchController.addListener(() {
      fetchTourAgents(searchController.text);
    });
    super.onInit();
  }

  Future getSingleAgent(String id) async {
    String baseUrl = dotenv.get('BASEURL');
    String url = '$baseUrl/user/get-single-provider/$id';

    Dio dio = Dio();
    try {
      final response = await dio.get(
        url,
      );

      if (response.statusCode == 200) {
        agentEmail.value = response.data['_id']['email'];
      } else {}
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future fetchTourAgents(String text) async {
    String baseUrl = dotenv.get('BASEURL');
    String url = '$baseUrl/user/search-agent/$text';

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
        final data = response.data;

        agents.value =
            data.map((agent) => TourAgentModel.fromJson(agent)).toList();
      } else {
        print('Failed to load hotels: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
