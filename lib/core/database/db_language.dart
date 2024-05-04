import 'package:flutter/material.dart';
import 'package:tamorqa_app/setup.dart';

class DBLanguage extends ChangeNotifier {
  String? applanguage;
  DBLanguage() {
    loadtodo();
  }

  Future<String> loadtodo() async {
    //? savat olindi
    notifyListeners();

    return prefss.getString('applang') ?? 'uz';
  }

  Future<void> save(String languagecode) async {
    //? savatga malumotlar saqlandi
    prefss.setString('applang', languagecode);
    notifyListeners();
  }
}
