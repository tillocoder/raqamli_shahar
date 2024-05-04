import 'package:dio/dio.dart';
import 'package:tamorqa_app/core/services/app_urls/urls.dart';
import 'package:tamorqa_app/setup.dart';

class Baseoption {
  static String tokenn = box.get('access') ?? '';
  static BaseOptions baseOptionsT = BaseOptions(
    baseUrl: Urls.baseUrl,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $tokenn',
    },
    connectTimeout: const Duration(seconds: 10), // Increase connectTimeout duration
    receiveTimeout: const Duration(seconds: 5),
    contentType: 'application/json',
    responseType: ResponseType.json,
  );
  static BaseOptions baseOptions = BaseOptions(
    baseUrl: Urls.baseUrl,
    headers: {
      'Content-Type': 'application/json',
    },
    connectTimeout: const Duration(seconds: 10), // Increase connectTimeout duration
    receiveTimeout: const Duration(seconds: 5),
    contentType: 'application/json',
    responseType: ResponseType.json,
  );
}
