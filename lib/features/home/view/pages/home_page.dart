import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:graphic/graphic.dart';
import 'package:lottie/lottie.dart';
import 'package:tamorqa_app/core/router/name_routes.dart';
import 'package:tamorqa_app/core/services/citizen/get_citizen_list.dart';
import 'package:tamorqa_app/features/home/controller/home_ctr.dart';
import 'package:tamorqa_app/features/home/view/widgets/chart_colorful_texteable.dart';
import 'package:tamorqa_app/features/home/view/widgets/chart_data.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(homeController);
    var ctr = ref.read(homeController);
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text('Mahalla ijro'),
      ),
      body: ctr.isLoading
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 350,
                    height: 300,
                    child: Chart(
                      data: tradeWeekData,
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
                            ),
                          ),
                          shape: ShapeEncode(
                            value: RectShape(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  12,
                                ),
                              ),
                            ),
                          ),
                          color: ColorEncode(
                            variable: 'name',
                            values: Defaults.colors10,
                          ),
                          elevation: ElevationEncode(value: 5),
                          transition: Transition(
                            duration: const Duration(seconds: 2),
                            curve: Curves.elasticOut,
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
                        const ChartText(
                          text: 'Erkaklar',
                          colors: Colors.green,
                          icon: Icons.person,
                          data: 0,
                        ),
                        const SizedBox(height: 10),
                        const ChartText(
                          text: 'Ayollar',
                          colors: Colors.orange,
                          icon: Icons.woman,
                          data: 0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Lottie.asset(
                    'assets/lottie/loading.json',
                    height: 400,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                const Text('Ma\'lumotlar Yuklanmoqda',style: TextStyle(fontSize: 26,fontWeight: FontWeight.w700),)
            ],
          ),
    );
  }
}
