import 'package:flutter/material.dart';

class CTextField extends StatelessWidget {
  final TextEditingController ctr;
  final String hintString;
  final TextInputType inputTypes;
  const CTextField({
    super.key,
    required this.ctr,
    required this.hintString,
    required this.inputTypes,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputTypes,
      controller: ctr,
      decoration: InputDecoration(
        enabled: true,
        hintText: hintString,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
