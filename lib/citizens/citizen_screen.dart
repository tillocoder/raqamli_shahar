import 'package:flutter/material.dart';

class CitizensList extends StatefulWidget {
  const CitizensList({super.key});

  @override
  State<CitizensList> createState() => _CitizensListState();
}

class _CitizensListState extends State<CitizensList> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: const Text(
            'Fuqarolar',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: ListView.separated(
            itemBuilder: (context, index) => SizedBox(
              height: 70,
              width: double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 7),
            itemCount: 22,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.indigoAccent,
          onPressed: () {},
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
