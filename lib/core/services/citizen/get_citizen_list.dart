import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tamorqa_app/core/services/app_urls/urls.dart';
import 'package:tamorqa_app/core/services/base_options/base_options.dart';
import 'package:tamorqa_app/data/entity/citizen_model.dart';

class CitizenGetListServices {
  static Dio dio = Dio(Baseoption.baseOptionsT);
  static List<CitizenModel> citizen = [];
  static Future<void> getCitezenList() async {
    var response = await dio.get(Urls.apiCitizenList);

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        citizen = (response.data as List).map((e) => CitizenModel.fromJson(e)).toList().reversed.toList();
      }
    } catch (e) {
      debugPrint('Exception ${response.statusCode}');
    }
  }
}
