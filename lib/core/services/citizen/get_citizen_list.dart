import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tamorqa_app/core/services/app_urls/urls.dart';
import 'package:tamorqa_app/core/services/base_options/base_options.dart';
import 'package:tamorqa_app/data/entity/citizen_model.dart';
import 'package:tamorqa_app/setup.dart';

final citizenGetListServicesController =
    ChangeNotifierProvider.autoDispose((ref) => CitizenGetListServices());

class CitizenGetListServices extends ChangeNotifier {
  CitizenGetListServices() {
    getCitizenList();
  }

  static Dio dio = Dio(Baseoption.baseOptionsT);
  static List<CitizenModel> citizen = [];
  static List<CitizenModel> male = [];
  static List<CitizenModel> female = [];

  Future<void> getCitizenList() async {
    try {
      final response = await dio.get(Urls.apiCitizenList);
      if (response.statusCode == 200 || response.statusCode == 201) {
        citizen = (response.data as List)
            .map(
              (json) => CitizenModel.fromJson(json),
            )
            .toList();
        // Clear previous lists
        male.clear();
        female.clear();
        // Categorize citizens based on gender
        for (var citizen in citizen) {
          if (citizen.gender == 1) {
            male.add(citizen);
          } else if (citizen.gender == 2) {
            female.add(citizen);
          }
        }
        notifyListeners();
      }
    } catch (e) {
      if (e is DioError) {
        debugPrint(
            'Dio Error: ${e.response?.statusCode} - ${e.response?.data}');
        if (e.response?.statusCode == 401) {
          await refreshAccessToken();
          await getCitizenList();
        } else {
          debugPrint('Dio Error: $e');
        }
      } else {
        debugPrint('Exception: $e');
      }
    }
  }

  static Future<void> refreshAccessToken() async {
    String? refreshToken = await box.get('refresh');
    print(refreshToken);
    if (refreshToken != null) {
      try {
        var response = await dio.post(
          '${Urls.baseUrl}${Urls.apiRefresh}',
          data: {'refresh': refreshToken},
        );
        if (response.statusCode == 200) {
          var responseData = response.data as Map<String, dynamic>;
          String? accessToken = responseData["access"] as String?;
          if (accessToken != null) {
            debugPrint("New Access Token: $accessToken");
            await box.put('access', accessToken);
            // Update token in Dio instance
            dio.options.headers["Authorization"] = "Bearer $accessToken";
          }
        } else {
          debugPrint('Failed to refresh access token');
          // Handle the failure scenario, such as showing an error message
        }
      } catch (e) {
        debugPrint('Failed to refresh access token: $e');
        // Handle the failure scenario, such as showing an error message
      }
    } else {
      debugPrint('No refresh token available');
      // Handle the scenario where there's no refresh token available
    }
  }
}
