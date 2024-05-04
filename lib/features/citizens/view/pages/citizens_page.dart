import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tamorqa_app/core/router/name_routes.dart';
import 'package:tamorqa_app/core/services/citizen/get_citizen_list.dart';
class CitizensPage extends ConsumerWidget {
  const CitizensPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watch(activitiesController);
    // var ctr = ref.read(activitiesController);
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: CitizenGetListServices.citizen.length,
          itemBuilder: (context, index) {
            var item = CitizenGetListServices.citizen[index];
            return Card(
              child: ListTile(
                onTap: () {
                  context.goNamed(Routes.activities);
                },
                title: Text(item.fio),
                trailing: Icon(
                  item.gender == 1 ? Icons.girl_outlined : Icons.boy,
                  color: item.gender == 1 ? Colors.green : Colors.indigoAccent,
                  size: 28,
                ),
              ),
            );
          }),
    );
  }
}
