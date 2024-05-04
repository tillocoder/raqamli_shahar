import 'package:flutter/widgets.dart';
import 'package:tamorqa_app/core/config/lang_setting/locale_controller.dart';

@immutable
class InheritedLocalNotifier extends InheritedNotifier<LocalController> {
  const InheritedLocalNotifier({
    required final LocalController localController,
    required super.child,
    super.key,
  }) : super(
          notifier: localController,
        );

  static LocalController? maybeOf(BuildContext context, {bool listen = true}) {
    if (listen) {
      return context.dependOnInheritedWidgetOfExactType<InheritedLocalNotifier>()?.notifier;
    } else {
      final inhW = context.getElementForInheritedWidgetOfExactType<InheritedLocalNotifier>()?.widget;
      return inhW is InheritedLocalNotifier ? inhW.notifier : null;
    }
  }
}
