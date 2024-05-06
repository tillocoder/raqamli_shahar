import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tamorqa_app/core/router/name_routes.dart';
import 'package:tamorqa_app/core/services/citizen/get_citizen_list.dart';
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
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    offset: const Offset(1, 1),
                    spreadRadius: 10,
                    blurRadius: 10,
                  )
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              height: 70,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.fio,
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          "${item.house.toString()}",
                          style: const TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                    Text(item.phone),
                  ],
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
