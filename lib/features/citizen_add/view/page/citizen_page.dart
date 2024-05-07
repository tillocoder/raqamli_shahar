import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
        title: const Text('O\'zgartirish'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text('PINFL:'),
              CTextField(
                ctr: ctr.pinflCtr,
                hintString: 'Pinfl',
                inputTypes: TextInputType.text,
                validator: (value) {
                  return null;
                },
              ),
              const SizedBox(height: 10),
              const Text('Uy raqami:'),
              CTextField(
                ctr: ctr.houseNumber,
                hintString: 'Uy raqami:',
                inputTypes: TextInputType.number,
                validator: (value) {
                  return null;
                },
              ),
              const SizedBox(height: 10),
              const Text('Telefon:'),
              CTextField(
                ctr: ctr.phoneNumber,
                hintString: 'Telefon',
                inputTypes: TextInputType.text,
                validator: (value) {
                  return null;
                },
              ),
              const SizedBox(height: 10),
              const Text('Gender:'),
              DropdownButton<int>(
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
              const SizedBox(height: 10),
              const Text('FIO:'),
              CTextField(
                ctr: ctr.fioCtr,
                hintString: 'FIO',
                inputTypes: TextInputType.text,
                validator: (value) {
                  return null;
                },
              ),
              const SizedBox(height: 10),
              const Text('Address:'),
              CTextField(
                ctr: ctr.address,
                hintString: 'Address',
                inputTypes: TextInputType.text,
                validator: (value) {
                  return null;
                },
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () async {
              await ctrLocation.joylashuvniAniqlash();
              final newCitizen = CitizenModel(
                personalIdentification: ctr.pinflCtr.text,
                house: int.parse(ctr.houseNumber.text),
                phone: ctr.phoneNumber.text,
                gender: ctr.selectedGender!,
                fio: ctr.fioCtr.text,
                address: ctr.fioCtr.text,
                lat: ctrLocation.myPosition.latitude.toString(),
                lng: ctrLocation.myPosition.longitude.toString(),
              );
              await CitizenCreateService.postCreatCitezen(newCitizen);
              context.goNamed(Routes.citizens);
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              maximumSize: const Size(double.infinity, 70),
              backgroundColor: Colors.indigo,
            ),
            child: Text(
              ctr.isLoading ? 'Saqlanmoqda...' : 'Saqlash',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
