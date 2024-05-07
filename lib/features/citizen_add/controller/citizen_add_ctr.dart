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

  void setSelectedGender(int? gender) {
    selectedGender = gender;
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
