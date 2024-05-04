import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tamorqa_app/core/services/citizen/get_citizen_list.dart';

final homeController = ChangeNotifierProvider.autoDispose((ref) => HomeController());

class HomeController extends ChangeNotifier {
  bool isLoading = true;
  HomeController() {
    init();
  }

  void init() async {
    isLoading = false;
    await CitizenGetListServices.getCitezenList();
    isLoading = true;
    notifyListeners();
  }
}
