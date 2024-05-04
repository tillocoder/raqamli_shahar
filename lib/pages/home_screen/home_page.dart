import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tamorqa_app/citizens/citizen_screen.dart';
import 'package:tamorqa_app/domain/models/user_list.dart';

import 'widgets/chart_colorful_texteable.dart';
import 'widgets/chart_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> loadTokens() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      accessToken = prefs.getString('access_token') ?? '';
      refreshToken = prefs.getString('refresh_token') ?? '';
    });
  }

  String accessToken = '';
  String refreshToken = '';

  Dio dio = Dio();
  List<UsersList> userList = [];
  int touchedIndex = -1;

  Future<void> citizenGet() async {
    try {
      Response response = await dio.get(
        'http://mahalla.ijro-app.uz/api/v1/citizen/list/',
        options: Options(
          headers: {
            'Authorization': 'Bearer $refreshToken',
          },
        ),
      );
      if (response.statusCode == 200) {
        print(response.data);
        List<UsersList> usersList = usersListFromJson(response.data);
        setState(() {
          userList = usersList;
        });
      } else {
        print("error");
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Internet connection error'),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    loadTokens();
    citizenGet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: Column(
          children: [
            DrawerHeader(
                child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Hikmatillo Rahmonjonov',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                )
              ],
            )),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: const Text('Mahalla ijro'),
      ),
      body: SingleChildScrollView(
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
                  const Row(
                    children: [
                      Expanded(
                        child: ChartText(
                          text: 'Ayollar',
                          colors: Colors.orange,
                          icon: Icons.woman,
                          data: 0,
                          width: 100,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ChartText(
                          text: 'Erkaklar',
                          colors: Colors.green,
                          icon: Icons.person,
                          data: 0,
                          width: 100,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ChartText(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => const CitizensList()),
                      );
                    },
                    text: 'Fuqarolar',
                    colors: Colors.indigo,
                    icon: Icons.people_alt,
                    data: 0,
                    width: double.infinity,
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
