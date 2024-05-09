import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tamorqa_app/core/router/name_routes.dart';
import 'package:tamorqa_app/core/services/citizen/get_id_activities.dart';
import 'package:tamorqa_app/core/widgets/text_widget.dart';

class CitezensActivities extends ConsumerWidget {
  const CitezensActivities({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Fuqaro faoliyati'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.builder(
                itemCount: ActivitiesGetListServices.activities.length,
                itemBuilder: (context, index) {
                  var item = ActivitiesGetListServices.activities[index];
                  String directionName = '';
                  switch (item.direction) {
                    case 1:
                      directionName = 'Иссиқхона';
                      break;
                    case 2:
                      directionName = 'Қўзиқорин етиштириш';
                      break;
                    case 3:
                      directionName = 'Асаларичилик';
                      break;
              
                    case 4:
                      directionName = 'Паррандачилик';
                      break;
              
                    case 5:
                      directionName = 'Узумчилик';
                      break;
              
                    case 6:
                      directionName = 'Чорвачилик';
                      break;
              
                    case 7:
                      directionName = 'Деҳқончилик';
                      break;
              
                    case 8:
                      directionName = 'Ишлаб чиқариш';
              
                      break;
                    case 9:
                      directionName = 'Хизмат кўрсатиш';
              
                      break;
                    case 10:
                      directionName = 'Ҳунармандчилик';
              
                      break;
                    case 11:
                      directionName = 'Тикувчилик';
              
                      break;
                    case 12:
                      directionName = 'Пазандачилик';
              
                      break;
                    default:
                      directionName = 'Unknown';
                  }
                  return Card(
                    surfaceTintColor: Colors.white,
                    shadowColor: Colors.grey,
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const TextWidget(
                                text: "Yo\'nalish",
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                              TextWidget(
                                text: directionName,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const TextWidget(
                                text: "Honadon soni",
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                              TextWidget(
                                color: Colors.blue,
                                text: item.houseQuantity,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const TextWidget(
                                text: "Maydoni",
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                              TextWidget(
                                text: "${item.area} sotix",
                                color: Colors.blue,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const TextWidget(
                                text: "Qiymati",
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                              TextWidget(
                                text: "${item.value.toString()} MLN",
                                color: Colors.blue,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const TextWidget(
                                text: 'Ijro vaqti',
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                              TextWidget(
                                text: item.executionTime,
                                color: Colors.blue,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const TextWidget(
                                text: 'Daromad MLN.SUM',
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                              TextWidget(
                                text: item.income,
                                color: Colors.blue,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goNamed(Routes.activitiesAdd);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
