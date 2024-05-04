import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tamorqa_app/core/services/app_urls/urls.dart';
import 'package:tamorqa_app/core/services/base_options/base_options.dart';
import 'package:tamorqa_app/data/entity/citizen_model.dart';

class CitizenCreateService {
  static Dio dio = Dio(Baseoption.baseOptionsT);
  static Future<void> postCreatCitezen(CitizenModel data) async {
    print('loading');
    var response = await dio.post(Urls.apiCitizenCreate, data: data.toJson());
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
        debugPrint(
          data.toString(),
        );
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      debugPrint('Exception ${response.statusCode}');
    }
  }
}
