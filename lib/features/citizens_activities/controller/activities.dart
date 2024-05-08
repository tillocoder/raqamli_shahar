import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tamorqa_app/core/services/citizen/get_citizen_list.dart';
import 'package:tamorqa_app/core/services/citizen/get_id_activities.dart';

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
  int? citizenIdCtr;
  int? direction;

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

  bool isLoading = true;
  int id = 13875;
  void init() async {
    isLoading = false;
    await ActivitiesGetListServices.getactivitiesList(id);
    await CitizenGetListServices.getCitizenList();
    isLoading = true;
    notifyListeners();
  }
}
