import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/adapters.dart';

late SharedPreferences prefss;
late Box box;

class AppInitial {
  static Future<void> setup() async {
    prefss = await SharedPreferences.getInstance();
    await Hive.initFlutter();
    box = await Hive.openBox('box');
  }
}
