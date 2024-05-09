import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tamorqa_app/core/services/app_urls/urls.dart';
import 'package:tamorqa_app/core/services/base_options/base_options.dart';
import 'package:tamorqa_app/data/entity/citizen_model.dart';

class SearchService extends ChangeNotifier {
  static bool isLoading = true;
  static List<CitizenModel> list = [];
  static Dio dio = Dio(Baseoption.baseOptionsT);
  static Future<List<CitizenModel>?> getData({required Map<String, Object?> param}) async {
    var response = await dio.get(Urls.apiSearchCitizen, queryParameters: param);
    if (response.statusCode == 200) {
      debugPrint('YAXSHI'); //Ma'lumotni string sifatida olish
      list = (response.data as List).map((e) => CitizenModel.fromJson(e)).toList();
      return list;
    } else {
      return null;
    }
  }
}
