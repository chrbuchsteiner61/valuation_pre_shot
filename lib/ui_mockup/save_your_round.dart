import 'package:flutter/material.dart';

class SaveYourRound extends StatelessWidget {
  const SaveYourRound({super.key});

  void _incrementCounter() {
    String a = 'hallo';
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _incrementCounter,
      tooltip: 'Increment',
      child: const Icon(Icons.save),
    );
  }
}

//int _counter = 0;

//void _incrementCounter() {
//setState(() {
// This call to setState tells the Flutter framework that something has
// changed in this State, which causes it to rerun the build method below
// so that the display can reflect the updated values. If we changed
// _counter without calling setState(), then the build method would not be
// called again, and so nothing would appear to happen.
//_counter++;
//});}