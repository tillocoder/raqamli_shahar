import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:tamorqa_app/core/services/app_urls/urls.dart';
import 'package:tamorqa_app/core/services/base_options/base_options.dart';
import 'package:tamorqa_app/setup.dart';

class RefreshTokenService {
  static Dio dio = Dio(Baseoption.baseOptions);
  static Future<void> refreshToken() async {
    String tokenn = box.get('refresh') ?? '';
    var response = await dio.post(Urls.apiRefresh, data: {"refresh": tokenn});
    if (response.statusCode == 200 || response.statusCode == 201) {
      var responseData = response.data as Map<String, dynamic>;
      String? accessToken = responseData["access"] as String?;
      box.put('access', accessToken);
      debugPrint(
        'TOKEN :$accessToken',
      );
    } else {
      debugPrint('😀Refresh token not found: ${response.statusCode}');
    }
  }
}
