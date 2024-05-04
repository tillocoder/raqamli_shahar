import 'package:flutter/material.dart';

class ChartText extends StatelessWidget {
  final String text;
  final Color colors;
  final IconData icon;
  final int data;
  final VoidCallback? onTap;
  final double width;

  const ChartText({
    Key? key,
    required this.text,
    required this.colors,
    required this.icon,
    required this.data,
    this.onTap,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        height: 60,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: colors,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              const SizedBox(width: 15),
              Icon(
                icon,
                color: Colors.white,
              ),
              const SizedBox(width: 10),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              Text(
                '$data',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
        ),
      ),
    );
  }
}
