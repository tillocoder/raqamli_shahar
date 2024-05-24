// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:tamorqa_app/core/router/name_routes.dart';
import 'package:tamorqa_app/core/services/citizen/citizen_activity_add.dart';
import 'package:tamorqa_app/core/services/citizen/get_id_activities.dart';
import 'package:tamorqa_app/core/widgets/dropdown_widget.dart';
import 'package:tamorqa_app/data/entity/activities_model.dart';
import 'package:tamorqa_app/features/auth/login/view/widgets/c_text_field.dart';
import 'package:tamorqa_app/features/citizens_activities/controller/activities.dart';

class CitizenActivitiyAdd extends ConsumerWidget {
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
                        obsecure: false,
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
                        obsecure: false,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                CTextField(
                  ctr: ctr.value,
                  hintString: 'Qiymati',
                  inputTypes: TextInputType.phone,
                  validator: (value) {
                    return null;
                  },
                  maxLines: 10,
                  obsecure: false,
                ),
                const SizedBox(height: 10),
                DropDownWidget(
                  text: 'Yo\'nalish',
                  value: ctr.direction,
                  onChanged: (newValue) {
                    ctr.setSelectedGender(newValue);
                  },
                  items: const [
                    CustomDropdownMenuItem(value: 1, text: 'Issiqxona'),
                    CustomDropdownMenuItem(
                        value: 2, text: 'Qo\'ziqorin Yetishtirish'),
                    CustomDropdownMenuItem(value: 3, text: 'Asalarichilik'),
                    CustomDropdownMenuItem(value: 4, text: 'Parrandachilik'),
                    CustomDropdownMenuItem(value: 5, text: 'Uzumchilik'),
                    CustomDropdownMenuItem(value: 6, text: 'Chorvachilik'),
                    CustomDropdownMenuItem(value: 7, text: 'Dexqonchilik'),
                    CustomDropdownMenuItem(value: 8, text: 'Ishlab chiqarish'),
                    CustomDropdownMenuItem(
                        value: 9, text: 'Xizmat ko\'rsatish'),
                    CustomDropdownMenuItem(value: 10, text: 'Hunarmandchilik'),
                    CustomDropdownMenuItem(value: 11, text: 'Tikuvchilik'),
                    CustomDropdownMenuItem(value: 12, text: 'Pazandachilik'),
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
                  obsecure: false,
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
                  obsecure: false,
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
