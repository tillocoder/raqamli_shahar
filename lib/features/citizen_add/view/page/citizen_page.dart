import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:tamorqa_app/core/router/name_routes.dart';
import 'package:tamorqa_app/core/services/citizen/citizen_create.dart';
import 'package:tamorqa_app/data/entity/citizen_model.dart';
import 'package:tamorqa_app/features/auth/login/view/widgets/c_text_field.dart';
import 'package:tamorqa_app/features/citizen_add/controller/citizen_add_ctr.dart';
import 'package:tamorqa_app/features/citizen_add/controller/golocator.dart';

class CitizenAddScreen extends ConsumerWidget {
  const CitizenAddScreen({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(citizenAdctr);
    ref.watch(mylocationController);
    var ctr = ref.read(citizenAdctr);
    var ctrLocation = ref.read(mylocationController);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('O\'zgartirish'),
      ),
      body: KeyboardDismisser(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CTextField(
                  ctr: ctr.pinflCtr,
                  hintString: 'Pinfl',
                  inputTypes: TextInputType.text,
                  validator: (value) {
                    return null;
                  },
                  maxLines: 30,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: CTextField(
                        ctr: ctr.houseNumber,
                        hintString: 'Uy raqami:',
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
                        ctr: ctr.passportNumber,
                        hintString: 'Passport raqami:',
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
                      flex: 2,
                      child: CTextField(
                        ctr: ctr.phoneNumber,
                        hintString: 'Telefon',
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
                          'Jinsi',
                          style: TextStyle(color: Colors.black),
                        ),
                        isDense: true,
                        borderRadius: BorderRadius.circular(15),
                        value: ctr.selectedGender,
                        onChanged: (newValue) {
                          ctr.setSelectedGender(newValue);
                        },
                        items: const [
                          DropdownMenuItem<int>(
                            value: 2,
                            child: Text('Ayol'),
                          ),
                          DropdownMenuItem<int>(
                            value: 1,
                            child: Text('Erkak'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                CTextField(
                  ctr: ctr.fioCtr,
                  hintString: 'FIO',
                  inputTypes: TextInputType.text,
                  validator: (value) {
                    return null;
                  },
                  maxLines: 100,
                ),
                const SizedBox(height: 10),
                CTextField(
                  ctr: ctr.address,
                  hintString: 'Address',
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
                await ctrLocation.joylashuvniAniqlash();
                final newCitizen = CitizenModel(
                  id: 1,
                  personalIdentification: ctr.pinflCtr.text,
                  house: int.parse(ctr.houseNumber.text),
                  phone: ctr.phoneNumber.text,
                  gender: ctr.selectedGender!,
                  fio: ctr.fioCtr.text,
                  address: ctr.fioCtr.text,
                  lat: ctrLocation.myPosition.latitude.toString(),
                  lng: ctrLocation.myPosition.longitude.toString(),
                  passportNumber: ctr.passportNumber.text,
                );
                await CitizenCreateService.postCreatCitezen(newCitizen);
                context.goNamed(Routes.citizens);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                maximumSize: const Size(double.infinity, 100),
                backgroundColor: Colors.indigo,
              ),
              child: Text(
                ctr.isLoading ? 'Saqlanmoqda...' : 'Saqlash',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
