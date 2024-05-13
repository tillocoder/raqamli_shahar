import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:tamorqa_app/core/router/name_routes.dart';
import 'package:tamorqa_app/core/widgets/dropdown_widget.dart';
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CTextField(
                        ctr: ctr.passportNumber,
                        hintString: 'PASSPORT',
                        inputTypes: TextInputType.text,
                        validator: (value) {
                          return null;
                        },
                        maxLines: 100,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CTextField(
                        ctr: ctr.passportNumber,
                        hintString: 'PINFL',
                        inputTypes: TextInputType.text,
                        validator: (value) {
                          return null;
                        },
                        maxLines: 100,
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
                        ctr: ctr.passportNumber,
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
                        ctr: ctr.passportNumber,
                        hintString: 'Uy raqami',
                        inputTypes: TextInputType.text,
                        validator: (value) {
                          return null;
                        },
                        maxLines: 100,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CTextField(
                        ctr: ctr.passportNumber,
                        hintString: 'Tug\'ulgan yil',
                        inputTypes: TextInputType.text,
                        validator: (value) {
                          return null;
                        },
                        maxLines: 100,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                CTextField(
                  ctr: ctr.passportNumber,
                  hintString: 'Manzil',
                  inputTypes: TextInputType.text,
                  validator: (value) {
                    return null;
                  },
                  maxLines: 100,
                ),
                const SizedBox(height: 10),
                CTextField(
                  ctr: ctr.passportNumber,
                  hintString: 'Lider tadbirkor',
                  inputTypes: TextInputType.text,
                  validator: (value) {
                    return null;
                  },
                  maxLines: 100,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: DropDownWidget(
                        text: 'Ijtimoiy holati',
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
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: DropDownWidget(
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goNamed(Routes.activitiesAdd);
        },
        child: const Text('Next>'),
      ),
    );
  }
}
