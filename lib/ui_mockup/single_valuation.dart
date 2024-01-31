import 'package:flutter/material.dart';
import 'package:valuation_pre_shot/ui_mockup/colored_container.dart';
import 'package:valuation_pre_shot/ui_mockup/styled_text.dart';

class SingleValuation extends StatelessWidget {
  String teeNumber = '1';

  SingleValuation({super.key, required teeNumber}) {
    this.teeNumber = teeNumber.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.green,
        width: 140,
        height: 40,
        margin: const EdgeInsets.all(4),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Row(
            children: <Widget>[
              StyledText(
                aText: 'Schlag ',
                aWidth: 60,
                aLignment: 'left',
              ),
              StyledText(
                aText: teeNumber,
                aWidth: 28,
                aLignment: 'right',
              ),
              const SizedBox(
                width: 5,
              ),
              const SizedBox(
                width: 38,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
