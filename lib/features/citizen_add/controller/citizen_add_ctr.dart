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

  TextEditingController pinflCtr = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController houseNumber = TextEditingController();
  int? selectedGender;
  TextEditingController fioCtr = TextEditingController();
  TextEditingController address = TextEditingController();

  void setSelectedGender(int? newValue) {
    switch (newValue) {
      case 1:
        selectedGender = 1;
        break;
      case 2:
        selectedGender = 2;
        break;
    }
    debugPrint(selectedGender.toString());
    notifyListeners();
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
