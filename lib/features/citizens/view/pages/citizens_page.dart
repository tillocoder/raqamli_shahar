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
    var ctr = ref.read(activitiesController);
    var citizens = CitizenGetListServices.citizen;

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: ctr.serchCtr,
          onChanged: (value) async {
            await ctr.searching(value);
          },
          decoration: const InputDecoration(
            hintText: 'Fuqarolar',
            suffixIcon: Icon(Icons.search_rounded),
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              gapPadding: 5,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: citizens.length,
        itemBuilder: (context, index) {
          var item = citizens[index];
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Card(
              elevation: 6,
              shadowColor: Colors.grey.shade300,
              surfaceTintColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                onTap: () async {
                  debugPrint(ctr.citezenID.toString());
                  // context.goNamed(Routes.activities);
                },
                title: Text(item.fio),
                subtitle: Text(
                  "Tel: ${item.phone}",
                  style: const TextStyle(color: Colors.blue),
                ),
                trailing: Text(
                  "${item.house} - Uy",
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
