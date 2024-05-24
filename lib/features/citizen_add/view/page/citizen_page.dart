// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:tamorqa_app/core/router/name_routes.dart';
import 'package:tamorqa_app/core/services/soha_list/soha.dart';
import 'package:tamorqa_app/core/widgets/dropdown_widget.dart';
import 'package:tamorqa_app/data/entity/soxa_model.dart';
import 'package:tamorqa_app/features/auth/login/view/widgets/c_text_field.dart';
import 'package:tamorqa_app/features/citizen_add/controller/citizen_add_ctr.dart';
import 'package:tamorqa_app/features/citizen_add/controller/golocator.dart';

class CitizenAddScreen extends ConsumerWidget {
  // ignore: use_key_in_widget_constructors
  const CitizenAddScreen({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(citizenAdctr);
    ref.watch(mylocationController);
    ref.watch(soxaGetService);

    var ctr = ref.read(citizenAdctr);
    var ctrLocation = ref.read(mylocationController);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Fuqaro va faoliyat'),
      ),
      body: KeyboardDismisser(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                  ctr: ctr.passportNumber,
                  hintString: 'PASSPORT',
                  inputTypes: TextInputType.text,
                  validator: (value) {
                    return null;
                  },
                  maxLines: 100,
                ),
                const SizedBox(height: 10),
                CTextField(
                  ctr: ctr.pinflCtr,
                  hintString: 'PINFL',
                  inputTypes: TextInputType.text,
                  validator: (value) {
                    return null;
                  },
                  maxLines: 15,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: CTextField(
                        ctr: ctr.phoneNumber,
                        hintString: 'TEL',
                        inputTypes: TextInputType.text,
                        validator: (value) {
                          return null;
                        },
                        maxLines: 100,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: DropDownWidget(
                        text: 'Jinsi',
                        value: ctr.selectedGender,
                        onChanged: (newValue) {
                          ctr.setSelectedGender(newValue);
                        },
                        items: const [
                          CustomDropdownMenuItem(value: 2, text: 'Ayol'),
                          CustomDropdownMenuItem(value: 1, text: 'Erkak'),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: CTextField(
                        ctr: ctr.houseNumber,
                        hintString: 'Uy raqami',
                        inputTypes: TextInputType.text,
                        validator: (value) {
                          return null;
                        },
                        maxLines: 4,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CTextField(
                        ctr: ctr.birthDate,
                        hintString: 'Tug\'ulgan yil',
                        inputTypes: TextInputType.text,
                        validator: (value) {
                          return null;
                        },
                        maxLines: 4,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                CTextField(
                  ctr: ctr.manzil,
                  hintString: 'Manzil',
                  inputTypes: TextInputType.text,
                  validator: (value) {
                    return null;
                  },
                  maxLines: 100,
                ),
                const SizedBox(height: 10),
                DropDownWidget(
                  text: 'Lider Tadbirkor',
                  value: ctr.selectedHolat,
                  onChanged: (newValue) {
                    ctr.setConditionIjtimoiy(newValue);
                  },
                  items: const [
                    CustomDropdownMenuItem(
                      value: 2,
                      text: 'Yordamga muhtoj',
                    ),
                    CustomDropdownMenuItem(
                      value: 1,
                      text: 'Yordamga muhtoj emas',
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.white,
                  surfaceTintColor: Colors.white10,
                  elevation: 20,
                  shadowColor: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        DropDownWidget(
                          text: 'Bandlik holat',
                          value: ctr.selectedBandlik,
                          onChanged: (value) {
                            ctr.setConditionBandlik(value);
                          },
                          items: const [
                            CustomDropdownMenuItem(
                              value: 3,
                              text: 'Ishl bilan taminlandi',
                            ),
                            CustomDropdownMenuItem(
                              value: 2,
                              text: 'Ish joyiga ega',
                            ),
                            CustomDropdownMenuItem(
                              value: 1,
                              text: 'Ishsiz',
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Visibility(
                          visible: ctr.selectedBandlik == 2,
                          child: Column(
                            children: [
                              DropDownWidget(
                                text: 'Ish joyi darajasi',
                                value: ctr.ishJoyiDarajasi,
                                onChanged: (value) {
                                  ctr.setIshjoyiDarajasi(value);
                                },
                                items: const [
                                  CustomDropdownMenuItem(
                                    value: 2,
                                    text: 'Viloyat',
                                  ),
                                  CustomDropdownMenuItem(
                                    value: 1,
                                    text: 'Tuman',
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              DropDownWidget(
                                text: 'Soxasi',
                                value: ctr.soxa,
                                onChanged: (value) {
                                  ctr.setSoxa(value);
                                },
                                items: const [
                                  CustomDropdownMenuItem(
                                    value: 2,
                                    text: 'Ijtimoiy',
                                  ),
                                  CustomDropdownMenuItem(
                                    value: 1,
                                    text: 'Iqtisodiy',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await ctrLocation.joylashuvniAniqlash();
            context.goNamed(Routes.activitiesAdd);
          } catch (e) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Xatolik'),
                content: Text('$e'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Ok'),
                  ),
                ],
              ),
            );
          }
        },
        child: const Text('Keyingi>'),
      ),
    );
  }
}
