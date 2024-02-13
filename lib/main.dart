import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import 'package:valuation_pre_shot/ui_areas/change_the_tee.dart';
import 'package:valuation_pre_shot/ui_areas/input_valuation.dart';
import 'package:valuation_pre_shot/ui_areas//input_your_routine_element.dart';
import 'package:valuation_pre_shot/ui_areas//save_your_round.dart';

var logger = Logger();

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChangeNumber()),
        ChangeNotifierProvider(create: (_) => ChangeStrokeTable())
      ],
      child: const MyApp(),
    ),
  );
}

class ChangeStrokeTable with ChangeNotifier, DiagnosticableTreeMixin {
  // table of strokes per round
  List<List<String>> _aTable = List<List<String>>.generate(18,
      (index) => List<String>.generate(10, (int index) => '0', growable: false),
      growable: false);

  List<List<String>> get strokesTable => _aTable;

  void changeTable() {
    notifyListeners();
  }
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
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String version = '0.98 / ' + (DateTime.now()).toString();
  int tee = 1;
  final int numberOfTees = 18;
  final int numberOfStrokes = 10;

  // initialize with 18 + 1 tees and 10 +1 strokes
  List<List<String>> aStrokeTable = List<List<String>>.generate((19),
      (index) => List<String>.generate(11, (int index) => '0', growable: false),
      growable: false);

  String selectedRoutine = 'an initial routine value';

  final aRoutineInputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    aRoutineInputController.addListener(_getTextOutOfARoutineInputController);
  }

  @override
  void dispose() {
    aRoutineInputController.dispose();
    super.dispose();
  }

  String _getTextOutOfARoutineInputController() {
    selectedRoutine = aRoutineInputController.text;
    logger.d(selectedRoutine);
    return selectedRoutine;
  }

  List<List<String>> _addjustStrokeTable(List<List<String>> aTable) {
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
    aStrokeTable = _addjustStrokeTable(aStrokeTable);
    logger.d(aStrokeTable.toString());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InputYourRoutineElement(
            aController: aRoutineInputController,
          ),
          const ChangeTheTee(),
          Center(
            child: InputValuation(numberOfStrokes: numberOfStrokes, tee: tee),
          ),
          SaveYourRound(
            aTable: aStrokeTable,
            aFunction: _getTextOutOfARoutineInputController,
          )
        ],
      ),
      bottomSheet: Text(
        version,
        style: Theme.of(context).textTheme.bodyLarge,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
