import 'package:flutter/material.dart';
import 'package:valuation_pre_shot/ui_mockup/colored_container.dart';
import 'package:valuation_pre_shot/ui_mockup/styled_text.dart';

class ChangeTheTee extends StatelessWidget {
  const ChangeTheTee({super.key});

  void onPressed() {
    String a = "23";
  }

  @override
  Widget build(BuildContext context) {
    return ColoredContainer(
      //padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      //color: Colors.green,
      aWidget: Row(children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: StyledText(
            aText: 'Bahn ',
            aWidth: 116,
            aLignment: 'left',
          ),
        ),
        Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              //
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.black,
                tooltip: 'nothing',
                onPressed: () {},
              ),
            ),
            StyledText(
              aText: '2',
              aWidth: 36,
              aLignment: 'center',
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              //
              child: IconButton(
                icon: const Icon(Icons.arrow_forward),
                color: Colors.black,
                tooltip: 'Increase volume by 10',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
