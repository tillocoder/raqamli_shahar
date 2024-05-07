import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tamorqa_app/core/services/citizen/get_id_activities.dart';

class CitezensActivities extends ConsumerWidget {
  const CitezensActivities({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView.builder(
        itemCount: ActivitiesGetListServices.activities.length,
        itemBuilder: (context, index) {
          var itam = ActivitiesGetListServices.activities[index];
          return ListTile(
            title: Text(
              itam.direction.toString(),
            ),
          );
        },
      ),
    );
  }
}
