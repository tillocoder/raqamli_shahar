import 'package:dio/dio.dart';
import 'package:tamorqa_app/core/services/app_urls/urls.dart';
import 'package:tamorqa_app/core/services/base_options/base_options.dart';
import 'package:tamorqa_app/data/entity/citizen_model.dart';

class CitizenGetListServices {
  static Dio dio = Dio(Baseoption.baseOptionsT);
  static List<CitizenModel> citizen = [];
  static List<CitizenModel> male = [];
  static List<CitizenModel> female = [];

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
        // Clear previous lists
        male.clear();
        female.clear();

        // Categorize citizens based on gender
        for (var citizen in citizen) {
          if (citizen.gender == 1) {
            male.add(citizen);
          } else if (citizen.gender == 2) {
            female.add(citizen);
          }
        }
      }
    } catch (e) {
      print('Exception: $e');
    }
  }
}
