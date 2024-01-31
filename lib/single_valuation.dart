import 'package:flutter/material.dart';

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
        width: 120,
        child: Row(
          children: <Widget>[
            Text('Schlag $teeNumber  ',
                style: const TextStyle(fontSize: 16, color: Colors.white)),
            const SizedBox(
              width: 25,
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
    );
  }
}
