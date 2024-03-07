import 'package:flutter/material.dart';

class ColoredContainer extends StatelessWidget {
  final Widget aWidget;

  const ColoredContainer({super.key, required this.aWidget});

  //Color backgroundColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Container(
        decoration:
            BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(4)),
              color: Theme.of(context).colorScheme.primary,),

        height: 50,
        child: aWidget,
      ),
    );
  }
}
