import 'package:flutter/material.dart';
import 'package:tamorqa_app/core/services/citizen/get_citizen_list.dart';
import 'package:tamorqa_app/core/services/citizen/search.dart';
import 'package:tamorqa_app/data/entity/citizen_model.dart';

class Keraksiz extends StatefulWidget {
  const Keraksiz({super.key});

  @override
  State<Keraksiz> createState() => _KeraksizState();
}

class _KeraksizState extends State<Keraksiz> {
  final serch = TextEditingController();
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    CitizenGetListServices a = CitizenGetListServices();
    await a.getCitizenList();
    setState(() {});
  }

  bool isLoading = false;
  static Map<String, Object?> paramSearchProduct(String text) => <String, Object?>{
        "q": text,
      };

  Future<void> searching(String text) async {
    if (text.isNotEmpty) {
      CitizenGetListServices.citizen = [];
      List<CitizenModel>? list = [];

      isLoading = false;
      setState(() {});
      list = await SearchService.getData(param: paramSearchProduct(text));
      if (list != null) {
        CitizenGetListServices.citizen = list;
        isLoading = true;
        setState(() {});
      } else {
        isLoading = false;
        setState(() {});
      }
    } else {
      CitizenGetListServices a = CitizenGetListServices();
      await a.getCitizenList();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: serch,
          onChanged: (value) async {
            debugPrint('Value: ' + value);
            await searching(value);
            setState(() {});
          },
        ),
      ),
      body: ListView.builder(
        itemCount: CitizenGetListServices.citizen.length,
        itemBuilder: (context, index) {
          var item = CitizenGetListServices.citizen[index];
          return ListTile(
            title: Text(item.fio),
            subtitle: Text(item.passportNumber),
          );
        },
      ),
    );
  }
}
