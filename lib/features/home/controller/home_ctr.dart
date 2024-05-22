import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tamorqa_app/core/services/citizen/get_citizen_list.dart';

final homeController = ChangeNotifierProvider.autoDispose(
  (ref) => HomeController(),
);

class HomeController extends ChangeNotifier {
  bool isLoading = true;

  HomeController() {
    init();
  }

  int male = 0;
  int female = 0;

  void init() async {
    isLoading = true;
    notifyListeners();

    CitizenGetListServices a = CitizenGetListServices();
    await a.getCitizenList();

    male = CitizenGetListServices.male.length;
    female = CitizenGetListServices.female.length;

    isLoading = false;
    notifyListeners();
  }
}
