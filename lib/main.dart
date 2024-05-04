import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tamorqa_app/app.dart';
import 'package:tamorqa_app/setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitial.setup();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
