import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tamorqa_app/core/router/name_routes.dart';
import 'package:tamorqa_app/core/services/citizen/get_citizen_list.dart';
import 'package:tamorqa_app/core/services/citizen/get_id_activities.dart';
import 'package:tamorqa_app/features/citizens_activities/controller/activities.dart';

class CitizensPage extends ConsumerWidget {
  const CitizensPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(activitiesController);
    // var ctr = ref.read(activitiesController);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text('Fuqarolar'),
      ),
      body: ListView.builder(
        itemCount: CitizenGetListServices.citizen.length,
        itemBuilder: (context, index) {
          var item = CitizenGetListServices.citizen[index];
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Card(
              color: Colors.white,
              elevation: 6,
              shadowColor: Colors.grey.shade300,
              surfaceTintColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                onTap: () async {
                  await ActivitiesGetListServices.getactivitiesList(item.id!);
                  // ignore: use_build_context_synchronously
                  context.goNamed(Routes.activities);
                },
                title: Text(item.fio),
                subtitle: Text(
                  "Tel: ${item.phone}",
                  style: const TextStyle(color: Colors.blue),
                ),
                trailing: Text(
                  "${item.house.toString()} - Uy",
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goNamed(Routes.citizenAdd);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
