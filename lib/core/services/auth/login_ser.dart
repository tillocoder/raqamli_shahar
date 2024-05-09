import 'dart:convert';

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
        String? refreshToken = responseData["refresh"] as String?; // fix here
        if (accessToken != null) {
          debugPrint("Access Token: $accessToken");
          debugPrint("Refresh Token: $refreshToken");
          await box.put('access', accessToken);
          await box.put('refresh', refreshToken);
          context.go(Routes.home);
        } else {
          return;
        }
      } else {
        debugPrint('token ololmadi tasdiqlanmagan user');
        return;
      }
    } catch (e) {
      SnackBarHelper.showInternetConnectionError(
        context,
        'Kirish uchun ruxsat yo\'q',
      );
      debugPrint('token ololmadi tasdiqlanmagan user');
      return;
    }
  }

  static Future<String?> getAccessToken() async {
    // Function to retrieve the access token from wherever you've stored it
    return box.get('access');
  }

  static Future<String?> getRefreshToken() async {
    // Function to retrieve the refresh token from wherever you've stored it
    return box.get('refresh');
  }

  static Future<void> refreshTokenIfNeeded() async {
    String? accessToken = await getAccessToken();
    if (accessToken != null) {
      // Check if the access token is expired
      if (JwtUtils.isExpired(accessToken)) {
        // Access token is expired, refresh it
        String? refreshToken = await getRefreshToken();
        if (refreshToken != null) {
          try {
            // Send a request to refresh the access token
            var response = await dio.post('${Urls.baseUrl}${Urls.apiRefresh}',
                data: {"refresh": refreshToken});
            if (response.statusCode == 200 || response.statusCode == 201) {
              var responseData = response.data as Map<String, dynamic>;
              String? newAccessToken = responseData["access"] as String?;
              if (newAccessToken != null) {
                await box.put('access', newAccessToken);
              }
            }
          } catch (e) {
            // Handle error while refreshing token
            debugPrint('Error refreshing token: $e');
          }
        }
      }
    }
  }
}

class JwtUtils {
  static bool isExpired(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('Invalid token');
    }
    final payload = parts[1];
    final decoded = Uri.tryParse(Uri.decodeComponent(payload))?.query;
    if (decoded == null) {
      throw Exception('Invalid payload');
    }
    final data = json.decode(decoded) as Map<String, dynamic>;
    final exp = data['exp'] as int?;
    if (exp == null) {
      throw Exception('Expiration not found');
    }
    final expirationDate = DateTime.fromMillisecondsSinceEpoch(exp * 1000);
    final now = DateTime.now();
    return now.isAfter(expirationDate);
  }
}
