import 'package:dio/dio.dart';
import 'package:tamorqa_app/core/services/app_urls/urls.dart';
import 'package:tamorqa_app/core/services/base_options/base_options.dart';
import 'package:tamorqa_app/data/entity/citizen_model.dart';

class CitizenGetListServices {
  static Dio dio = Dio(Baseoption.baseOptionsT);
  static List<CitizenModel> citizen = [];

  static Future<void> getCitizenList() async {
    try {
      final response = await dio.get(Urls.apiCitizenList);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
        citizen = (response.data as List)
            .map(
              (json) => CitizenModel.fromJson(json),
            )
            .toList();
      }
    } catch (e) {
      print('Exception: $e');
    }
  }
}
