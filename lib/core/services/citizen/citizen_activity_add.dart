import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tamorqa_app/core/services/app_urls/urls.dart';
import 'package:tamorqa_app/core/services/base_options/base_options.dart';
import 'package:tamorqa_app/data/entity/activities_model.dart';

class CitizenActivityAdd {
  static Dio dio = Dio(Baseoption.baseOptionsT);
  static Future<void> postCreatCitezen(CitizenActivityAddModel data) async {
    print('activitiy sending for server');
    var response = await dio.post(
      Urls.apiactivitiescreate,
      data: data.toJson(),
    );
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
