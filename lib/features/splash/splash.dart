import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tamorqa_app/features/splash/controller/splash_controller.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(splashController);
    var ctr = ref.read(splashController);
    return const Scaffold(
      body: Center(
        child: Text('Raqamli Shahar'),
      ),
    );
  }
}
