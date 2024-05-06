import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tamorqa_app/core/services/citizen/citizen_create.dart';
import 'package:tamorqa_app/data/entity/citizen_model.dart';
import 'package:tamorqa_app/features/auth/login/view/widgets/c_text_field.dart';
import 'package:tamorqa_app/features/citizen_add/controller/citizen_add_ctr.dart';
import 'package:tamorqa_app/features/citizen_add/controller/golocator.dart';

class CitizenAddOrEditScreen extends ConsumerWidget {
  const CitizenAddOrEditScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(citizenAdctr);
    ref.watch(mylocationController);
    var ctr = ref.read(citizenAdctr);
    var ctrLocation = ref.read(mylocationController);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Uzgartirish'),
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
                validator: (value) {},
              ),
              const SizedBox(height: 10),
              const Text('Uy raqami:'),
              CTextField(
                ctr: ctr.houseNumber,
                hintString: 'Uy raqami:',
                inputTypes: TextInputType.number,
                validator: (value) {},
              ),
              const SizedBox(height: 10),
              const Text('Telefon:'),
              CTextField(
                ctr: ctr.phoneNumber,
                hintString: 'Telefon',
                inputTypes: TextInputType.text,
                validator: (value) {},
              ),
              const SizedBox(height: 10),
              const Text('Jinsi:'),
              CTextField(
                ctr: ctr.gender,
                hintString: 'Jinsi',
                inputTypes: TextInputType.text,
                validator: (value) {},
              ),
              const SizedBox(height: 10),
              const Text('FIO:'),
              CTextField(
                ctr: ctr.fioCtr,
                hintString: 'FIO',
                inputTypes: TextInputType.text,
                validator: (value) {},
              ),
              const SizedBox(height: 10),
              const Text('Address:'),
              CTextField(
                ctr: ctr.address,
                hintString: 'Address',
                inputTypes: TextInputType.text,
                validator: (value) {},
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
              ctrLocation.joylashuvniAniqlash();
              final newCitizen = CitizenModel(
                personalIdentification: ctr.pinflCtr.text,
                house: int.parse(ctr.houseNumber.text),
                phone: ctr.phoneNumber.text,
                gender: int.parse(ctr.gender.text),
                fio: ctr.fioCtr.text,
                address: ctr.fioCtr.text,
                lat: '324324',
                lng: '342324',
              );
              await CitizenCreateService.postCreatCitezen(newCitizen);
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
//
// void postNewCitizen() async {
//   final pinfl = ctr.pinflCtr.text;
//   final houseNum = houseNumber.text.toString();
//   final phone = phoneNumber.text.toString();
//   final gen = gender.text.toString();
//   final fio = fioCtr.text.toString();
//   final addr = address.text.toString();
//
//   final newCitizen = CitizenModel(
//     personalIdentification: pinfl,
//     house: houseNum,
//     phone: phone,
//     gender: gen,
//     fio: fio,
//     address: addr,
//     lat: '3242322422',
//     lng: '5423422321',
//   );
//
//   try {
//     await CitizenCreateService.postCreatCitezen(newCitizen);
//   } catch (error) {
//     print('Error occurred while creating citizen: $error');
//   }
// }
