import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  final String aText;
  final double aWidth;
  final String aLignment;
  TextAlign theAlignment = TextAlign.left;

  StyledText(
      {super.key,
      required this.aText,
      required this.aWidth,
      required this.aLignment}) {
    switch (aLignment) {
      case 'left':
        theAlignment = TextAlign.left;
      case 'center':
        theAlignment = TextAlign.center;
      case 'right':
        theAlignment = TextAlign.right;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: aWidth,
        child: Text(
          aText,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: theAlignment,
        ),
    );
  }
}
