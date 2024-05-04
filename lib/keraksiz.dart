import 'package:flutter/material.dart';
import 'package:tamorqa_app/core/services/citizen/get_id_activities.dart';

class Keraksiz extends StatefulWidget {
  const Keraksiz({super.key});

  @override
  State<Keraksiz> createState() => _KeraksizState();
}

class _KeraksizState extends State<Keraksiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        //! create citizin
        // await CitizenPostServices.postCreatCitezen(
        //   CitizenModel(
        //     personalIdentification: null,
        //     house: 0,
        //     phone: "91 658 23 74",
        //     gender: 2,
        //     fio: "Jasur Jasurov",
        //     address: "Байроқ",
        //   ),
        // );
        //! get list direction
        // await DirectionGetListServices.getdirectionList();
        await ActivitiesGetListServices.getactivitiesList(13875);
      }),
    );
  }
}
