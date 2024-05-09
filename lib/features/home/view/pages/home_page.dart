import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tamorqa_app/core/router/name_routes.dart';
import 'package:tamorqa_app/core/services/citizen/get_citizen_list.dart';
import 'package:tamorqa_app/features/home/controller/home_ctr.dart';
import 'package:tamorqa_app/features/home/view/widgets/chart_colorful_texteable.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(homeController);
    // ignore: unused_local_variable
    var ctr = ref.read(homeController);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Mahalla ijro'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ChartText(
                    onTap: () {
                      context.goNamed(Routes.citizens);
                    },
                    text: 'Fuqarolar',
                    colors: Colors.indigo,
                    icon: Icons.people_alt,
                    data: CitizenGetListServices.citizen.length,
                  ),
                  const SizedBox(height: 10),
                  ChartText(
                    onTap: () {
                      context.goNamed(Routes.citizens);
                    },
                    text: 'Erkaklar',
                    colors: Colors.green,
                    icon: Icons.person,
                    data: CitizenGetListServices.male.length,
                  ),
                  const SizedBox(height: 10),
                  ChartText(
                    onTap: () {
                      context.goNamed(Routes.citizens);
                    },
                    text: 'Ayollar',
                    colors: Colors.orange,
                    icon: Icons.woman,
                    data: CitizenGetListServices.female.length,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
