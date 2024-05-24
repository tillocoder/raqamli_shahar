import 'package:flutter/material.dart';
import 'package:tamorqa_app/core/config/lang_setting/locale_controller.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Text(
        '🌐 Language ▼',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 1,
          child: Text('Uzbek'),
        ),
        const PopupMenuItem(
          value: 2,
          child: Text('Russian'),
        ),
      ],
      onSelected: (value) {
        switch (value) {
          case 1:
            localController.changLanguages(Language.uz);
            break;
          case 2:
            localController.changLanguages(Language.ru);
            break;
          case 3:
            localController.changLanguages(Language.en);
            break;
        }
      },
    );
  }
}
