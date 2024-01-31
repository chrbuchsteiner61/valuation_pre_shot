import 'package:flutter/material.dart';

class ChangeTheTee extends StatelessWidget {
  const ChangeTheTee({super.key});

  void onPressed() {
    String a = "23";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Container(
        color: Colors.green,
        child: Row(children: <Widget>[
          Text(
            'Bahn ',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: 'Increase volume by 10',
            onPressed: () {},
          ),
          Text(
            '2',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            tooltip: 'Increase volume by 10',
            onPressed: () {},
          ),
        ]),
      ),
    );
  }
}
