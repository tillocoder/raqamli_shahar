// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:tamorqa_app/core/router/name_routes.dart';
import 'package:tamorqa_app/core/services/citizen/citizen_activity_add.dart';
import 'package:tamorqa_app/core/services/citizen/get_id_activities.dart';
import 'package:tamorqa_app/data/entity/activities_model.dart';
import 'package:tamorqa_app/features/auth/login/view/widgets/c_text_field.dart';
import 'package:tamorqa_app/features/citizens_activities/controller/activities.dart';

class CitizenActivitiyAdd extends ConsumerWidget {
  // ignore: use_key_in_widget_constructors
  const CitizenActivitiyAdd({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var ctr = ref.read(activitiesController);
    ref.watch(activitiesController);
    // var item = CitizenGetListServices.citizen;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Faoliyat Qo\'shish'),
      ),
      body: KeyboardDismisser(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CTextField(
                        ctr: ctr.houseQuantityCtr,
                        hintString: 'Honadon soni',
                        inputTypes: TextInputType.number,
                        validator: (value) {
                          return null;
                        },
                        maxLines: 10,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CTextField(
                        ctr: ctr.areaCtr,
                        hintString: 'Maydoni (sotix)',
                        inputTypes: TextInputType.text,
                        validator: (value) {
                          return null;
                        },
                        maxLines: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: CTextField(
                        ctr: ctr.value,
                        hintString: 'Qiymati',
                        inputTypes: TextInputType.phone,
                        validator: (value) {
                          return null;
                        },
                        maxLines: 10,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: DropdownButton<int>(
                        hint: const Text(
                          'Yo\'nalish',
                          style: TextStyle(color: Colors.black),
                        ),
                        isDense: true,
                        borderRadius: BorderRadius.circular(15),
                        value: ctr.direction,
                        onChanged: (newValue) {
                          ctr.setSelectedGender(newValue);
                        },
                        items: const [
                          DropdownMenuItem<int>(
                            value: 1,
                            child: Text('Issiqxona'),
                          ),
                          DropdownMenuItem<int>(
                            value: 2,
                            child: Text('Qo\'ziqorin Yetishtirish'),
                          ),
                          DropdownMenuItem<int>(
                            value: 3,
                            child: Text('Asalarichilik'),
                          ),
                          DropdownMenuItem<int>(
                            value: 4,
                            child: Text('Parrandachilik'),
                          ),
                          DropdownMenuItem<int>(
                            value: 5,
                            child: Text('Uzumchilik'),
                          ),
                          DropdownMenuItem<int>(
                            value: 6,
                            child: Text('Chorvachilik'),
                          ),
                          DropdownMenuItem<int>(
                            value: 7,
                            child: Text('Dexqonchilik'),
                          ),
                          DropdownMenuItem<int>(
                            value: 8,
                            child: Text('Ishlab chiqarish'),
                          ),
                          DropdownMenuItem<int>(
                            value: 9,
                            child: Text('Xizmat ko\'rsatish'),
                          ),
                          DropdownMenuItem<int>(
                            value: 10,
                            child: Text('Hunarmandchilik'),
                          ),
                          DropdownMenuItem<int>(
                            value: 11,
                            child: Text('Tikuvchilik'),
                          ),
                          DropdownMenuItem<int>(
                            value: 12,
                            child: Text('Pazandachilik'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                CTextField(
                  ctr: ctr.excutionTimeCtr,
                  hintString: 'Ijro vaqti',
                  inputTypes: TextInputType.text,
                  validator: (value) {
                    return null;
                  },
                  maxLines: 100,
                ),
                const SizedBox(height: 10),
                CTextField(
                  ctr: ctr.incomeCtr,
                  hintString: 'Daromad',
                  inputTypes: TextInputType.text,
                  validator: (value) {
                    return null;
                  },
                  maxLines: 100,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () async {
                int id = 0;
                await ActivitiesGetListServices.getactivitiesList(id);
                final newActivityAdd = CitizenActivityAddModel(
                  houseQuantity: ctr.houseQuantityCtr.text,
                  area: ctr.areaCtr.text,
                  value: int.parse(ctr.value.text).toDouble(),
                  executionTime: ctr.excutionTimeCtr.text,
                  income: ctr.incomeCtr.text,
                  citizen: ctr.citezenID!,
                  direction: int.parse(
                    ctr.direction.toString(),
                  ),
                );
                await CitizenActivityAdd.postCreatCitezen(newActivityAdd);
                // ignore: use_build_context_synchronously
                context.goNamed(Routes.citizens);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                maximumSize: const Size(double.infinity, 100),
                backgroundColor: Colors.indigo,
              ),
              child: const Text(
                'Saqlash',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
