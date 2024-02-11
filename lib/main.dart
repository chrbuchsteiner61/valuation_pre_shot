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
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChangeNumber()),
        ChangeNotifierProvider(create: (_) => ChangeRoutine())
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

class ChangeRoutine with ChangeNotifier, DiagnosticableTreeMixin {
  String _aString = 'something';
  String get anElementRoutine => _aString;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('anElement', anElementRoutine));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          primary: Colors.green,
          secondary: Colors.white,
        ),
        fontFamily: 'Noto',
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w800, color: Colors.white),
          bodyLarge: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
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

  List<List<String>> _generateStrokeTable() {
    List<List<String>> aTable = List<List<String>>.generate(
        19, (i) => List<String>.generate(11, (j) => '0', growable: false),
        growable: false);

    aTable[0][0] = 'Bahn / Schlag';

    for (int i = 1; i < 11; i++) {
      aTable[0][i] = i.toString();
    }

    for (int j = 1; j < 19; j++) {
      aTable[j][0] = j.toString();
    }

    return aTable;
  }

  @override
  Widget build(BuildContext context) {
    List<List<String>> aStrokeTable = _generateStrokeTable();
    logger.d(aStrokeTable.toString());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InputYourRoutineElement(),
          const ChangeTheTee(),
          Center(
            child: InputValuation(),
          ),
          SaveYourRound(aTable: aStrokeTable)
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
