import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import 'package:valuation_pre_shot/ui_areas/change_the_tee.dart';
import 'package:valuation_pre_shot/ui_areas/input_valuation.dart';
import 'package:valuation_pre_shot/ui_areas//input_your_routine_element.dart';
import 'package:valuation_pre_shot/ui_areas//save_your_round.dart';

var logger = Logger();

// table of strokes per round
List<List<int>> strokesPerRound = List<List<int>>.generate(
    18, (index) => List<int>.generate(10, (int index) => 3, growable: false),
    growable: false);

void main() {
  // test of list strokesPerRound
  logger.d(strokesPerRound[3][5]);
  // later may be to remove
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChangeNumber()),
      ],
      child: const MyApp(),
    ),
  );
}

class ChangeNumber with ChangeNotifier, DiagnosticableTreeMixin {
  int _aNumber = 1;

  int get aTee => _aNumber;

  void inDecreaseANumber(int anAddedValue, int minValue, int maxValue) {
    _aNumber += anAddedValue;
    if (_aNumber > maxValue) {
      _aNumber = maxValue;
    }
    if (_aNumber < minValue) {
      _aNumber = minValue;
    }

    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', aTee));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          primary: Colors.green,
          secondary: Colors.white,
        ),
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      home: const MyHomePage(title: 'Bewerte Deine Pre-Shot-Routine'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int tee = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const InputYourRoutineElement(),
          const ChangeTheTee(),
           Center(
            child: InputValuation(),
          ),
          SaveYourRound()
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
