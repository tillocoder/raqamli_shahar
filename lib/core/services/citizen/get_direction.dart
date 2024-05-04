import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tamorqa_app/core/services/app_urls/urls.dart';
import 'package:tamorqa_app/core/services/base_options/base_options.dart';
import 'package:tamorqa_app/data/entity/directios.dart';

class DirectionGetListServices {
  static Dio dio = Dio(Baseoption.baseOptionsT);
  static List<Directions> directions = [];
  static Future<void> getdirectionList() async {
    var response = await dio.get(Urls.apiDirectionList);

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        directions = (response.data as List).map((e) => Directions.fromJson(e)).toList();
        debugPrint(directions.toString());
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      debugPrint('Exception ${response.statusCode}');
    }
  }
}
