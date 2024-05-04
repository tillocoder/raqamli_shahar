import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tamorqa_app/core/services/base_options/base_options.dart';
import 'package:tamorqa_app/data/entity/activities_model.dart';

class ActivitiesGetListServices {
  static Dio dio = Dio(Baseoption.baseOptionsT);

  static List<Activities> activities = [];

  static Future<void> getactivitiesList(int id) async {
    try {
      var response = await dio.get('http://mahalla.ijro-app.uz/api/v1/citizen/activities/13875/');
      if (response.statusCode == 200) {
        var responseData = json.decode(response.data);
        var citizenData = responseData['citizen'] as List<dynamic>; // Access the 'citizen' key
        activities = citizenData.map((e) => Activities.fromJson(e)).toList();
        debugPrint('ACTIVITIES: $activities');
      }
    } catch (e) {
      debugPrint('Exception: $activities');
    }
  }
}
