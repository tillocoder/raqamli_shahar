import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tamorqa_app/core/config/lang_setting/inherted_locale.dart';
import 'package:tamorqa_app/core/config/lang_setting/locale_controller.dart';
import 'package:tamorqa_app/materialapp.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InheritedLocalNotifier(
      localController: localController,
      child: Builder(builder: (context) {
        return materialApp(context);
      }),
    );
  }
}
