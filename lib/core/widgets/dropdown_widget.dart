import 'package:flutter/material.dart';

class DropDownWidget extends StatelessWidget {
  final String text;
  final int? value;
  final void Function(int?)? onChanged;
  final List<CustomDropdownMenuItem> items;
  const DropDownWidget({
    super.key,
    required this.text,
    required this.value,
    this.onChanged,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: InputDecorator(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<int>(
            isExpanded: true,
            iconSize: 30,
            hint: Text(
              text,
              style: const TextStyle(color: Colors.black),
            ),
            isDense: true,
            borderRadius: BorderRadius.circular(15),
            value: value,
            onChanged: onChanged,
            items: items.map((item) {
              return DropdownMenuItem<int>(
                value: item.value,
                child: Text(item.text),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class CustomDropdownMenuItem extends StatelessWidget {
  final int value;
  final String text;

  const CustomDropdownMenuItem({
    super.key,
    required this.value,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenuItem<int>(
      value: value,
      child: Text(text),
    );
  }
}
