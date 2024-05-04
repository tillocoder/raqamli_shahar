import 'package:flutter/material.dart';

class CTextField extends StatelessWidget {
  final TextEditingController ctr;
  final String hintString;
  final TextInputType inputTypes;
  final String? Function(String?)? validator;

  const CTextField({
    super.key,
    required this.ctr,
    required this.hintString,
    required this.inputTypes,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputTypes,
      controller: ctr,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintString,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}