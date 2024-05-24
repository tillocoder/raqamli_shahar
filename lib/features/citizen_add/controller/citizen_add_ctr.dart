import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tamorqa_app/core/services/soha_list/soha.dart';
import 'package:tamorqa_app/core/widgets/dropdown_widget.dart';

final citizenAdctr = ChangeNotifierProvider.autoDispose(
  (ref) => CitizenAddController(),
);

class CitizenAddController extends ChangeNotifier {
  bool isLoading = false;
  CitizenAddController() {
    init();
  }

  TextEditingController fioCtr = TextEditingController();
  TextEditingController pinflCtr = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController houseNumber = TextEditingController();
  TextEditingController passportNumber = TextEditingController();
  int? selectedGender;
  int? selectedBandlik;
  int? ishJoyiDarajasi;
  int? soxa;
  int? selectedHolat;
  TextEditingController manzil = TextEditingController();
  TextEditingController birthDate = TextEditingController();
  List<CustomDropdownMenuItem> soxaItems = [];

  void setSelectedGender(int? newValue) {
    selectedGender = newValue;
    debugPrint(selectedGender.toString());
    notifyListeners();
  }

  void setConditionIjtimoiy(int? holatValue) {
    selectedHolat = holatValue;
    debugPrint(holatValue.toString());
    notifyListeners();
  }

  Future<void> setSoxa(int? newValue) async {
    soxa = newValue;
    if (soxa == 1) {
      await fetchSoxaItems();

      yonalish = 1;
    } else if (soxa == 2) {
      await fetchSoxaItems();

      yonalish = 2;
    }
    debugPrint(soxa.toString());
    notifyListeners();
  }

  void setConditionBandlik(int? bandlikValue) {
    selectedBandlik = bandlikValue;
    debugPrint(selectedBandlik.toString());
    notifyListeners();
  }

  void setIshjoyiDarajasi(int? ishJoyiDarajasiValue) {
    ishJoyiDarajasi = ishJoyiDarajasiValue;
    debugPrint(ishJoyiDarajasi.toString());
    notifyListeners();
  }

  Future<void> fetchSoxaItems() async {
    try {
      SohaGetListServices sohaService = SohaGetListServices();
      await sohaService.getSoxaListFunction(yonalish);

      // Clear existing items to avoid duplication
      soxaItems.clear();

      // Use a Set to ensure uniqueness
      Set<int> uniqueIds = {};

      // Iterate through the response and add unique IDs to the Set
      sohaService.soxaList.forEach((soxa) {
        if (!uniqueIds.contains(soxa.id)) {
          uniqueIds.add(soxa.id);
          soxaItems.add(
            CustomDropdownMenuItem(
              value: soxa.id,
              text: soxa.name,
            ),
          );
        }
      });
    } catch (error) {
      debugPrint("Error fetching soxa items: $error");
    }
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
