// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tamorqa_app/core/router/name_routes.dart';
import 'package:tamorqa_app/core/services/app_urls/urls.dart';
import 'package:tamorqa_app/core/services/base_options/base_options.dart';
import 'package:tamorqa_app/core/widgets/snacbar.dart';
import 'package:tamorqa_app/setup.dart';

class AuthLoginService {
  static Dio dio = Dio(Baseoption.baseOptions);

  static Future<void> getToken(
      Map<String, String> data, BuildContext context) async {
    try {
      var response =
          await dio.post('${Urls.baseUrl}${Urls.apiToken}', data: data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseData = response.data as Map<String, dynamic>;
        String? accessToken = responseData["access"] as String?;
        String? refreshToken = responseData["refresh"] as String?;
        int? userId = responseData["user_id"] as int?;
        String? firstName = responseData["first_name"] as String?;
        String? region = responseData["region"] as String?;
        int? regionId = responseData["region_id"] as int?;
        String? mahalla = responseData["mahalla"] as String?;
        int? mahallaId = responseData["mahalla_id"] as int?;

        if (accessToken != null) {
          debugPrint("Access Token: $accessToken");
          debugPrint("Refresh Token: $refreshToken");
          await box.put('first_name', firstName);
          await box.put('access', accessToken);
          await box.put('refresh', refreshToken);
          await box.put('region', region);
          await box.put('user_id', userId);
          await box.put('region_id', regionId);
          await box.put('mahalla', mahalla);
          await box.put('mahalla_id', mahallaId);
          context.go(Routes.home);
        } else {
          debugPrint('Login failed: Access token is null');
        }
      } else {
        debugPrint(
            'Login failed: ${response.statusCode} - ${response.statusMessage}');
      }
    } catch (e) {
      SnackBarHelper.showInternetConnectionError(
        context,
        'Kirish uchun ruxsat yo\'q',
      );
      debugPrint('Exception during login: $e');
    }
  }
}
