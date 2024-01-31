import 'package:flutter/material.dart';

class InputYourRoutineElement extends StatelessWidget {
  const InputYourRoutineElement({super.key});

  @override
  Widget build(BuildContext context) {
    //String? aHintText = 'Element der Pre Shot Routine';
    //String? aLabelText = 'Ich bewerte mein/e ';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Container(
        color: Colors.green,
        child: const Row(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: Text(
                  'Ich bewerte mein/e ',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Element der Pre-Shot-Routine',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
