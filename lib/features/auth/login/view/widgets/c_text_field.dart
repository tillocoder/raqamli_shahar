import 'package:flutter/material.dart';

class CTextField extends StatelessWidget {
  final TextEditingController ctr;
  final String hintString;
  final TextInputType inputTypes;
  final double width;
  final int maxLines;

  const CTextField({
    super.key,
    required this.ctr,
    required this.hintString,
    required this.inputTypes,
    this.width = double.infinity,
    required this.maxLines,
    required String? Function(dynamic value) validator,
  });

  @override
  Widget build(BuildContext context) {
    final isTabletOrLaptop = MediaQuery.of(context).size.width >= 600;

    return Center(
      child: SizedBox(
        width: isTabletOrLaptop ? 400 : width,
        child: TextField(
          maxLength: maxLines,
          controller: ctr,
          keyboardType: inputTypes,
          decoration: InputDecoration(
            hintText: hintString,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
