import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tamorqa_app/core/services/auth/refresh_token.dart';
import 'package:tamorqa_app/core/services/citizen/get_citizen_list.dart';
import 'package:tamorqa_app/setup.dart';

final homeController = ChangeNotifierProvider.autoDispose((ref) => HomeController());

class HomeController extends ChangeNotifier {
  bool isLoading = true;
  HomeController() {
    debugPrint(box.get('refresh'));
    init();
  }

  void init() async {
    isLoading = false;
    await RefreshTokenService.refreshToken();
    await CitizenGetListServices.getCitezenList();
    isLoading = true;
    notifyListeners();
  }
}
