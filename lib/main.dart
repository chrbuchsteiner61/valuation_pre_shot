// import 'package:flutter/foundation.dart';
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
        ChangeNotifierProvider(create: (_) => ChangeTheTeeProvider()),
        ChangeNotifierProvider(create: (_) => ChangeStrokeTable()),
        ChangeNotifierProvider(create: (_) => ChangeStrokeValuationOfATee())
      ],
      child: const MyApp(),
    ),
  );
}

const numberOfStrokes = 10;
const numberOfTees = 18;

class ARow {
  int numberOfRow = 0;
  List<String> valueRow = [];

  ARow(String initialValue) {
    valueRow = List<String>.generate(
        numberOfStrokes, (int index) => initialValue,
        growable: false);
  }

  void getStrokesFromTable(ATable aTable, int theNewTee) {
    numberOfRow = theNewTee;
    for (int i = 0; i < numberOfStrokes; i++) {
      valueRow[i] = aTable.values[theNewTee][i];
    }
  }
}

class ATable {
  List<List<String>> values = [];

  ATable( String initialValue) {

    values = List<List<String>>.generate(
        numberOfTees+1,
        (index) => List<String>.generate(
            numberOfStrokes+1, (int index) => initialValue,
            growable: false),
        growable: false);
  }

  void updateValuesOfARow(ARow aRow) {
    int theTee = aRow.numberOfRow;
    logger.d(aRow.valueRow.length);
    for (int i = 0; i < numberOfStrokes; i++) {
      logger.d(aRow.valueRow[i]);
      values[theTee][i+1] = aRow.valueRow[i];
    }
  }
}

class ChangeStrokeValuationOfATee with ChangeNotifier {
  // 10 columns for strokes
  ARow _strokesOfATee = ARow('0');

  ARow get strokesOfATee => _strokesOfATee;

  void changeStrokesOfATee() {
    notifyListeners();
  }
}

class ChangeStrokeTable with ChangeNotifier {
  // table of strokes per round
  // 18 tees, 10 strokes plus overhead and a column on the side
  ATable _aTable = ATable('0');

  ATable get strokesTable => _aTable;

  void changeTable() {
    // some bimbam

    notifyListeners();
  }
}

class ChangeTheTeeProvider with ChangeNotifier {
  int _aNumber = 1;

  int get aTee => _aNumber;

  void inDecreaseANumber(int anAddedValue, int minValue, int maxValue) {

    // getStrokesOfAController(inputTeeController);
    _aNumber += anAddedValue;
    if (_aNumber > maxValue) {
      _aNumber = maxValue;
    }
    if (_aNumber < minValue) {
      _aNumber = minValue;
    }

    notifyListeners();
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
  String version = '0.988 / 29.02.2024';
  int tee = 1;
  final int numberOfTees = 18;
  final int numberOfStrokes = 10;

  // initialize with 18 + 1 tees and 10 +1 strokes
  ATable aStrokeTable = ATable('0');

  ARow allStrokeOfATeeValuated = ARow('');

  String aValuation = '';

  final aStrokeController = TextEditingController();

  final List<TextEditingController> strokesOfATeeController = [];

  String selectedRoutine = 'an initial routine value';

  final aRoutineInputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    aRoutineInputController.addListener(_getTextOutOfARoutineInputController);
    for (TextEditingController aController in strokesOfATeeController) {
      aController.addListener(_getTextOutOfAStrokeController);
    }
  }

  @override
  void dispose() {
    aRoutineInputController.dispose();
    for (TextEditingController aController in strokesOfATeeController) {
      aController.dispose();
    }
    super.dispose();
  }

  String _getTextOutOfARoutineInputController() {
    selectedRoutine = aRoutineInputController.text;
    return selectedRoutine;
  }

  String _getTextOutOfAStrokeController() {
    aValuation = aStrokeController.text;
    return aValuation;
  }

  List<String> _getValuationsOutOfATeeController() {
    List<String> valuations = [];
    logger.d('Anzahl Controller in strokesOfATee... ${strokesOfATeeController.length}');
    for (TextEditingController aController in strokesOfATeeController) {
      valuations.add(aController.text);
    }
    logger.d(valuations.length);
    return valuations;
  }

  ATable _addjustStrokeTable(ATable aTable) {
    aTable.values[0][0] = 'Bahn / Schlag';

    for (int i = 1; i < 11; i++) {
      aTable.values[0][i] = i.toString();
    }

    for (int j = 1; j < 19; j++) {
      aTable.values[j][0] = j.toString();
    }

    return aTable;
  }

  @override
  Widget build(BuildContext context) {
    aStrokeTable = _addjustStrokeTable(aStrokeTable);
    logger.d(aStrokeTable.values.toString());

    Text bottomText = Text(
      version,
      style: Theme.of(context).textTheme.bodyLarge,
    );

    for (int i = 0; i < 10; i++) {
      strokesOfATeeController.add(TextEditingController(text: ''));
    }

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
          ChangeTheTee(aTable: aStrokeTable, aFunction: _getValuationsOutOfATeeController),
          Center(
            child: InputValuation(
              numberOfStrokes: numberOfStrokes,
              tee: tee,
              strokeValuation: allStrokeOfATeeValuated,
              aValuationController: strokesOfATeeController,
            ),
          ),
          SaveYourRound(
            aTable: aStrokeTable,
            aFunction: _getTextOutOfARoutineInputController,
          )
        ],
      ),
      bottomSheet:
          bottomText, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
