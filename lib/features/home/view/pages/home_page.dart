import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:graphic/graphic.dart';
import 'package:tamorqa_app/core/router/name_routes.dart';
import 'package:tamorqa_app/core/services/citizen/get_citizen_list.dart';
import 'package:tamorqa_app/features/home/controller/home_ctr.dart';
import 'package:tamorqa_app/features/home/view/widgets/chart_colorful_texteable.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(homeController);
    // ignore: unused_local_variable
    var ctr = ref.read(homeController);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Mahalla ijro'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ctr.init();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              width: 400,
              child: Chart(
                rebuild: false,
                data: [
                  {"name": 'Erkaklar', "value": ctr.male},
                  {"name": "Ayollar", "value": ctr.female}
                ],
                variables: {
                  'name': Variable(
                    accessor: (Map map) => map['name'] as String,
                  ),
                  'value': Variable(
                    accessor: (Map map) => map['value'] as num,
                    scale: LinearScale(min: 0, marginMax: 0.1),
                  ),
                },
                marks: [
                  IntervalMark(
                    label: LabelEncode(
                      encoder: (tuple) => Label(
                        tuple['name'].toString(),
                        LabelStyle(
                          textStyle: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    shape: ShapeEncode(
                      value: RectShape(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            4,
                          ),
                        ),
                      ),
                    ),
                    color: ColorEncode(
                      variable: 'name',
                      values: Defaults.colors10,
                    ),
                    elevation: ElevationEncode(value: 7),
                    transition: Transition(
                      duration: const Duration(seconds: 2),
                      curve: Curves.bounceOut,
                    ),
                    entrance: {MarkEntrance.y},
                  )
                ],
                coord: PolarCoord(startRadius: 0.15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ChartText(
                    onTap: () {
                      context.goNamed(Routes.citizens);
                    },
                    text: 'Fuqarolar',
                    colors: Colors.indigo,
                    icon: Icons.people_alt,
                    data: CitizenGetListServices.citizen.length,
                  ),
                  const SizedBox(height: 10),
                  ChartText(
                    onTap: () {
                      context.goNamed(Routes.citizens);
                    },
                    text: 'Erkaklar',
                    colors: Colors.green,
                    icon: Icons.person,
                    data: CitizenGetListServices.male.length,
                  ),
                  const SizedBox(height: 10),
                  ChartText(
                    onTap: () {
                      context.goNamed(Routes.citizens);
                    },
                    text: 'Ayollar',
                    colors: Colors.orange,
                    icon: Icons.woman,
                    data: CitizenGetListServices.female.length,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
