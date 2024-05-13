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
  TextEditingController passportNumber = TextEditingController();
  int? selectedGender;
  int? selectedBandlik;
  int? ishJoyiDarajasi;
  int? soxa;
  int? selectedHolat;
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

  void setConditionIjtimoiy(int? holatValue) {
    switch (holatValue) {
      case 1:
        selectedHolat = 1;
        break;
      case 2:
        selectedHolat = 2;
        break;
    }
    debugPrint(holatValue.toString());
    notifyListeners();
  }

  void setSoxa(int? newValue) {
    switch (newValue) {
      case 1:
        soxa = 1;
        break;
      case 2:
        soxa = 2;
        break;
    }
    debugPrint(newValue.toString());
    notifyListeners();
  }

  void setConditionBandlik(int? bandlikValue) {
    switch (bandlikValue) {
      case 1:
        selectedBandlik = 1;
        break;
      case 2:
        selectedBandlik = 2;
        break;
      case 3:
        selectedBandlik = 3;
        break;
    }
    debugPrint(selectedBandlik.toString());
    notifyListeners();
  }

  void setIshjoyiDarajasi(int? ishJoyiDarajasiValue) {
    switch (ishJoyiDarajasiValue) {
      case 1:
        ishJoyiDarajasi = 1;
        break;
      case 2:
        ishJoyiDarajasi = 2;
        break;
    }
    debugPrint(ishJoyiDarajasi.toString());
    notifyListeners();
  }

  void init() async {
    isLoading = true;
    notifyListeners();
    try {
      isLoading = false;
    } catch (error) {
      // ignore: avoid_print
      print("Error occurred: $error");
      isLoading = false;
    }
    notifyListeners();
  }
}
