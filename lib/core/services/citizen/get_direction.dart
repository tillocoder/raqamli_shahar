import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tamorqa_app/core/services/app_urls/urls.dart';
import 'package:tamorqa_app/core/services/base_options/base_options.dart';
import 'package:tamorqa_app/data/entity/directios.dart';
import 'package:tamorqa_app/setup.dart';

class DirectionGetListServices {
  static Dio dio = Dio(Baseoption.baseOptionsT);
  static List<Directions> directions = [];
  static Future<void> getdirectionList() async {
    var response = await dio.get(Urls.apiDirectionList);

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        directions =
            (response.data as List).map((e) => Directions.fromJson(e)).toList();
        debugPrint(
          directions.toString(),
        );
      }
    } catch (e) {
      debugPrint('Exception ${response.statusCode}');
    }
  }

  static Future<void> refreshAccessToken() async {
    String? refreshToken = await box.get('refresh');
    String? accessToken = await box.get('access');
    // print(refreshToken);

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
