import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

final mylocationController =
    ChangeNotifierProvider.autoDispose((ref) => MyLocation());

class MyLocation extends ChangeNotifier {
  MyLocation() {
    joylashuvniAniqlash();
  }

//! maskur joylashuvni yuklab olishimiz uchun yaratdik
  late Position myPosition;

  //! joylashuni aniqlab olguncha
  bool isLoading = false;

  Future<Position> joylashuvniAniqlash() async {
    notifyListeners();
    isLoading = false;
    bool joylashuv;

    //? navigator tekshirish
    LocationPermission permission;
    joylashuv = await Geolocator.isLocationServiceEnabled();

    //? Ruxsat olinganmi
    if (!joylashuv) {
      return Future.error('Navigator o`chiq');
    }
    //? Ruxsatni tekshirish
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      //? ruxsat so'raladi
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error('Ruxsat rad etildi');
      }
    }
    //! umrbod rad etilganmi
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Ruxsat umrbod rad etilgan');
    }
    //? nihoyat 😎 joylashuvingizni olamiz
    myPosition = await Geolocator.getCurrentPosition();
    isLoading = true;
    notifyListeners();
    debugPrint('${myPosition.latitude} ${myPosition.longitude}');
    return myPosition;
    // ignore: empty_catches
  }
}
