import 'package:dio/dio.dart';
import 'package:tamorqa_app/core/services/app_urls/urls.dart';
import 'package:tamorqa_app/setup.dart';

class Baseoption {
  static String tokenn = box.get('access') ?? '';

  static Map<String, Object?> paramSearchProduct(String text) =>
      <String, Object?>{
        "q": text,
      };

  static BaseOptions baseOptionsT = BaseOptions(
    // queryParameters: paramSearchProduct(text),
    baseUrl: Urls.baseUrl,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $tokenn',
    },
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 5),
    contentType: 'application/json',
    responseType: ResponseType.json,
  );
  static BaseOptions baseOptions = BaseOptions(
    baseUrl: Urls.baseUrl,
    headers: {
      'Content-Type': 'application/json',
    },
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 5),
    contentType: 'application/json',
    responseType: ResponseType.json,
  );
}
