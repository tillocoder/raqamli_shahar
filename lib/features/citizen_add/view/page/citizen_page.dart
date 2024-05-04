import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tamorqa_app/core/services/citizen/citizen_create.dart';
import 'package:tamorqa_app/data/entity/citizen_model.dart';
import 'package:tamorqa_app/features/auth/login/view/widgets/c_text_field.dart';
import 'package:tamorqa_app/features/citizen_add/controller/citizen_add_ctr.dart';

TextEditingController pinflCtr = TextEditingController();
TextEditingController phoneNumber = TextEditingController();
TextEditingController houseNumber = TextEditingController();
TextEditingController gender = TextEditingController();
TextEditingController fioCtr = TextEditingController();
TextEditingController address = TextEditingController();

class CitizenAddOrEditScreen extends ConsumerWidget {
  const CitizenAddOrEditScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(citizenAdctr);
    var ctr = ref.read(citizenAdctr);
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
                ctr: pinflCtr,
                hintString: 'Pinfl',
                inputTypes: TextInputType.text,
                validator: (value) {},
              ),
              const SizedBox(height: 10),
              const Text('Uy raqami:'),
              CTextField(
                ctr: houseNumber,
                hintString: 'Uy raqami:',
                inputTypes: TextInputType.number,
                validator: (value) {},
              ),
              const SizedBox(height: 10),
              const Text('Telefon:'),
              CTextField(
                ctr: phoneNumber,
                hintString: 'Telefon',
                inputTypes: TextInputType.text,
                validator: (value) {},
              ),
              const SizedBox(height: 10),
              const Text('Jinsi:'),
              CTextField(
                ctr: gender,
                hintString: 'Jinsi',
                inputTypes: TextInputType.text,
                validator: (value) {},
              ),
              const SizedBox(height: 10),
              const Text('FIO:'),
              CTextField(
                ctr: fioCtr,
                hintString: 'FIO',
                inputTypes: TextInputType.text,
                validator: (value) {},
              ),
              const SizedBox(height: 10),
              const Text('Address:'),
              CTextField(
                ctr: address,
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
            onPressed: ctr.isLoading ? null : postNewCitizen,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              maximumSize: const Size(double.infinity, 70),
              backgroundColor: Colors.indigo,
            ),
            child: Text(
              ctr.isLoading ? 'Saqlanmoqda...' : 'Saqlash',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

void postNewCitizen() async {
  final pinfl = 'terasd';
  final houseNum = houseNumber.text;
  final phone = phoneNumber.text;
  final gen = gender.text;
  final fio = fioCtr.text;
  final addr = address.text;

  final newCitizen = CitizenModel(
    personalIdentification: pinfl,
    house: houseNum,
    phone: phone,
    gender: gen,
    fio: fio,
    address: addr,
    lat: '3242322422',
    lng: '5423422321',
  );

  try {
    await CitizenCreateService.postCreatCitezen(newCitizen);
  } catch (error) {
    print('Error occurred while creating citizen: $error');
  }
}
