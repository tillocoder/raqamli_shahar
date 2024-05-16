import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tamorqa_app/core/services/citizen/get_direction.dart';

final splashController =
    ChangeNotifierProvider.autoDispose((ref) => SplashController());

class SplashController extends ChangeNotifier {
  bool isLoading = true;

  SplashController() {
    init();
  }

  void getdirectionLists() async {
    await DirectionGetListServices.getdirectionList();
  }

  Future<void> init() async {
    isLoading = true;
    notifyListeners();
    await DirectionGetListServices.getdirectionList();
    isLoading = false;
  }
}
