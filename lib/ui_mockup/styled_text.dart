import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  String aText;
  double aWidth;
  String aLignment;
  TextAlign theAlignment = TextAlign.left;

  StyledText({super.key, required this.aText, required this.aWidth,
  required this.aLignment})
  {
    switch (aLignment)
    {
      case 'left':
        this.theAlignment = TextAlign.left;
      case 'center':
        this.theAlignment = TextAlign.center;
      case 'right':
        this.theAlignment = TextAlign.right;
    }
  }

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
          textAlign: theAlignment,
    ),
      );
  }
}
