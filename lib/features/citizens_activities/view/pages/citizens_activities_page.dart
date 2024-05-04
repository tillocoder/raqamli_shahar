import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tamorqa_app/features/citizens_activities/controller/activities.dart';

class CitezensActivities extends ConsumerWidget {
  const CitezensActivities({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(activitiesController);
    var ctr = ref.read(activitiesController);
    return Scaffold(body: Text('Tamirlash')
        //  ctr.isLoading
        //     ? ListView.builder(
        //         itemCount: ActivitiesGetListServices.activities[0].citizen.length,
        //         itemBuilder: (context, index) {
        //           var itam = ActivitiesGetListServices.activities[0].citizen[index];
        //           return ListTile(
        //             title: Text(itam.executionTime),
        //           );
        //         },
        //       )
        //     : Center(
        //         child: CircularProgressIndicator(),
        //       ),
        );
  }
}
