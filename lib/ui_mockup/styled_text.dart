import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  String aText;
  double aWidth;

  StyledText({super.key, required this.aText, required this.aWidth});

  TextStyle normalTextStyle =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white);

  // Ausrichtung TextAlign

  @override
  Widget build(BuildContext context) {
    return
      Container(
        width: aWidth,
        child: Text(
      aText,
      style: normalTextStyle,
          textAlign: TextAlign.left,
    ),
      );
  }
}
