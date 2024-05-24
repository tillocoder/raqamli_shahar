import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tamorqa_app/core/services/app_urls/urls.dart';
import 'package:tamorqa_app/core/services/base_options/base_options.dart';
import 'package:tamorqa_app/data/entity/soxa_model.dart';

int yonalish = 0;

final soxaGetService = ChangeNotifierProvider.autoDispose(
  (ref) => SohaGetListServices(),
);

class SohaGetListServices extends ChangeNotifier {
  List<SoxaModel> soxaList = [];
  SohaGetListServices() {
    getSoxaListFunction(yonalish);
  }

  static Dio dio = Dio(Baseoption.baseOptionsT);
  Future<void> getSoxaListFunction(yonalish) async {
    try {
      final response =
          await dio.get(Urls.apiSoxalar, queryParameters: {'status': yonalish});
      if (response.statusCode == 200 || response.statusCode == 201) {
        soxaList = List<SoxaModel>.from(
          response.data.map(
            (x) => SoxaModel.fromJson(x),
          ),
        );
        print(response.data);
        notifyListeners();
      }
    } catch (e) {
      if (e is DioError) {
        debugPrint(
            'Dio Error: ${e.response?.statusCode} - ${e.response?.data}');
        if (e.response?.statusCode == 401) {
          // Handle 401 Unauthorized error
        } else {
          debugPrint('Dio Error: $e');
        }
      } else {
        debugPrint('Exception: $e');
      }
    }
  }
}
