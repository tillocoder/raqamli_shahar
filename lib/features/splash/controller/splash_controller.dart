import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashController =
    ChangeNotifierProvider.autoDispose((ref) => SplashController());

class SplashController extends ChangeNotifier {
  bool isLoading = true;

  SplashController() {
    init();
  }

  Future<void> init() async {
    isLoading = true;
    notifyListeners();
    isLoading = false;
  }
}
