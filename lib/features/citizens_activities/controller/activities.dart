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

  bool isLoading = true;
  int id = 13875;
  void init() async {
    isLoading = false;
    await ActivitiesGetListServices.getactivitiesList(id);
    await CitizenGetListServices.getCitezenList();
    isLoading = true;
    notifyListeners();
  }
}
