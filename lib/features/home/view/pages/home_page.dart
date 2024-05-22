import 'package:flutter/material.dart';
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
    // ignore: unused_local_variable
    var ctr = ref.read(homeController);
    return Scaffold(
      drawer: Drawer(
        child: DrawerHeader(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Test User'),
                  IconButton(
                    onPressed: () async {
                      box.delete('access');
                      box.delete('refresh');
                      context.goNamed(Routes.login);
                    },
                    icon: const Icon(Icons.logout),
                  )
                ],
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: double.infinity,
                height: 200,
              ),
            )
          ],
        ),
      ),
    );
  }
}
