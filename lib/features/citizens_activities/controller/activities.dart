import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tamorqa_app/core/services/citizen/get_citizen_list.dart';
import 'package:tamorqa_app/core/services/citizen/get_id_activities.dart';
import 'package:tamorqa_app/core/services/citizen/search.dart';
import 'package:tamorqa_app/data/entity/citizen_model.dart';

final activitiesController = ChangeNotifierProvider.autoDispose(
  (ref) => ActivitiesController(),
);

class ActivitiesController extends ChangeNotifier {
  ActivitiesController() {
    init();
  }
  int? citezenID;
  TextEditingController houseQuantityCtr = TextEditingController();
  TextEditingController areaCtr = TextEditingController();
  TextEditingController value = TextEditingController();
  TextEditingController excutionTimeCtr = TextEditingController();
  TextEditingController incomeCtr = TextEditingController();
  TextEditingController serchCtr = TextEditingController();
  int? citizenIdCtr;
  int? direction;
  bool isLoading = false;
  static Map<String, Object?> paramSearchProduct(String text) =>
      <String, Object?>{
        "q": text,
      };
  Future<void> searching(String text) async {
    if (text.isNotEmpty) {
      CitizenGetListServices.citizen = [];
      List<CitizenModel>? list = [];

      isLoading = false;
      notifyListeners();
      list = await SearchService.getData(param: paramSearchProduct(text));
      if (list != null) {
        CitizenGetListServices.citizen = list;
        isLoading = true;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
      }
    } else {
      await CitizenGetListServices.getCitizenList();
      notifyListeners();
    }
  }

  void setSelectedGender(int? newValue) {
    switch (newValue) {
      case 1:
        direction = 1;
        break;
      case 2:
        direction = 2;
        break;
      case 3:
        direction = 3;
        break;
      case 4:
        direction = 4;
        break;
      case 5:
        direction = 5;
        break;
      case 6:
        direction = 6;
        break;
      case 7:
        direction = 7;
        break;
      case 8:
        direction = 8;
        break;
      case 9:
        direction = 9;
        break;
      case 10:
        direction = 10;
        break;
      case 11:
        direction = 11;
        break;
      case 12:
        direction = 12;
        break;
    }
    debugPrint(direction.toString());
    notifyListeners();
  }

  int id = 13875;
  void init() async {
    isLoading = false;
    await ActivitiesGetListServices.getactivitiesList(id);
    await CitizenGetListServices.getCitizenList();
    isLoading = true;
    notifyListeners();
  }
}
