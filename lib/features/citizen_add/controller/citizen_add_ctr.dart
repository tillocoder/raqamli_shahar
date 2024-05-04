import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final citizenAdctr = ChangeNotifierProvider.autoDispose(
  (ref) => CitizenAddController(),
);

class CitizenAddController extends ChangeNotifier {
  bool isLoading = false;
  CitizenAddController() {
    init();
  }

  void init() async {
    isLoading = true;
    notifyListeners();
    try {
      isLoading = false;
    } catch (error) {
      print("Error occurred: $error");
      isLoading = false;
    }
    notifyListeners();
  }
}
