import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tamorqa_app/core/services/app_urls/urls.dart';
import 'package:tamorqa_app/core/services/base_options/base_options.dart';
import 'package:tamorqa_app/data/entity/citizen_model.dart';

final citizenGetListServicesController =
    ChangeNotifierProvider.autoDispose((ref) => CitizenGetListServices());

class CitizenGetListServices extends ChangeNotifier {
  CitizenGetListServices() {
    getCitizenList();
  }
  static Dio dio = Dio(Baseoption.baseOptionsT);
  static List<CitizenModel> citizen = [];
  static List<CitizenModel> male = [];
  static List<CitizenModel> female = [];

  Future<void> getCitizenList() async {
    try {
      final response = await dio.get(Urls.apiCitizenList);
      if (response.statusCode == 200 || response.statusCode == 201) {
        citizen = (response.data as List)
            .map(
              (json) => CitizenModel.fromJson(json),
            )
            .toList();
        // Clear previous lists
        male.clear();
        female.clear();
        notifyListeners();
        // Categorize citizens based on gender
        for (var citizen in citizen) {
          if (citizen.gender == 1) {
            male.add(citizen);
          } else if (citizen.gender == 2) {
            female.add(citizen);
          }
        }
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Exception: $e');
    }
  }
}
