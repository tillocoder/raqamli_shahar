import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tamorqa_app/core/services/base_options/base_options.dart';
import 'package:tamorqa_app/data/entity/activities_model.dart';

class ActivitiesGetListServices {
  static Dio dio = Dio(Baseoption.baseOptionsT);

  static List<CitizenActivityAddModel> activities = [];

  static Future<void> getactivitiesList(int id) async {
    activities.clear();

    try {
      var response = await dio
          .get('http://mahalla.ijro-app.uz/api/v1/citizen/activities/$id/');
      if (response.statusCode == 200) {
        debugPrint('STATUS CODE: ${response.statusCode}');

        var responseData = response.data as Map<String, dynamic>;
        var citizenData = responseData['citizen'] as List<dynamic>;
        activities = citizenData
            .map((e) => CitizenActivityAddModel.fromJson(e))
            .toList();
        debugPrint('ACTIVITIES: $activities');
      }
    } catch (e) {
      debugPrint('Exception: $e');
    }
  }
}
