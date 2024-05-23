// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tamorqa_app/core/router/name_routes.dart';
import 'package:tamorqa_app/core/services/citizen/get_citizen_list.dart';
import 'package:tamorqa_app/features/home/controller/home_ctr.dart';
import 'package:tamorqa_app/features/home/view/widgets/chart_colorful_texteable.dart';
import 'package:tamorqa_app/setup.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(homeController);
    var ctr = ref.read(homeController);
    String? firstName = box.get('first_name');
    String? region = box.get('region');
    String? mahalla = box.get('mahalla');

    return Scaffold(
      drawer: Drawer(
        child: DrawerHeader(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 10,
                shadowColor: Colors.blue,
                color: Colors.blue,
                child: ListTile(
                  leading: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  title: Text(
                    firstName ?? "Ism yoq ",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: const Text(
                    "FIO",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 10,
                color: Colors.blue,
                shadowColor: Colors.blue,
                child: ListTile(
                  leading: const Icon(
                    Icons.location_city_outlined,
                    color: Colors.white,
                  ),
                  title: Text(
                    region ?? "shahar yoq ",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: const Text(
                    "Shahar",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 10,
                shadowColor: Colors.blue,
                color: Colors.blue,
                child: ListTile(
                  leading: const Icon(
                    Icons.holiday_village,
                    color: Colors.white,
                  ),
                  title: Text(
                    mahalla ?? "mahalla yoq ",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: const Text(
                    "Mahalla",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      surfaceTintColor: Colors.white,
                      backgroundColor: Colors.white,
                      title: const Text("Accountdan chiqishni hohlaysizmi"),
                      actions: [
                        GestureDetector(
                          onTap: () async {
                            await box.delete("access");
                            await box.delete("refresh");
                            context.goNamed(Routes.login);
                          },
                          child: const Card(
                            elevation: 10,
                            shadowColor: Colors.blue,
                            color: Colors.blue,
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 8,
                                bottom: 8,
                                left: 24,
                                right: 24,
                              ),
                              child: Text("Ha"),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Card(
                            elevation: 10,
                            shadowColor: Colors.blue,
                            color: Colors.blue,
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 8,
                                bottom: 8,
                                left: 20,
                                right: 20,
                              ),
                              child: Text("Yo'q"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: const Card(
                  elevation: 10,
                  shadowColor: Colors.red,
                  color: Colors.red,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Accountdan chiqish"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 10),
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
                    text: 'Erkaklar',
                    colors: Colors.green,
                    icon: Icons.person,
                    data: CitizenGetListServices.male.length,
                  ),
                  const SizedBox(height: 10),
                  ChartText(
                    text: 'Ayollar',
                    colors: Colors.orange,
                    icon: Icons.woman,
                    data: CitizenGetListServices.female.length,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: double.infinity,
                height: 170,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Eslatma',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.orangeAccent,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Platforma boyicha muammo, taklif va savollar uchun',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              await launchUrlString(
                                'https://t.me/+IXb5d2DW5IozZWIy',
                              );
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.telegram),
                                Text('  Telegram'),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              await launchUrlString(
                                'tel:+998330007800',
                              );
                            },
                            child: const Row(
                              children: [
                                Icon(Icons.phone),
                                Text('  33 000 78 00'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
