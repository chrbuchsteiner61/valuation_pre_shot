import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  final String aText;
  final double aWidth;
  final TextAlign aAlignment;
  
  const StyledText({super.key,
      required this.aText,
      required this.aWidth,
      required this.aAlignment}) ; 
      
  @override
  Widget build(BuildContext context) {
   
    return SizedBox(
      width: aWidth,
      child: Text(
        aText,
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: aAlignment,
      ),
    );
  }
}
