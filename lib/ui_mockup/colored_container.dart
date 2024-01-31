import 'package:flutter/material.dart';

class ColoredContainer extends StatelessWidget {
  Widget aWidget;

  ColoredContainer({super.key, required this.aWidget});

  Color backgroundColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Container(
        color: backgroundColor,
        child: aWidget,
      ),
    );
  }
}
