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
        ChangeNotifierProvider(create: (_) => TeeProvider()),
        ChangeNotifierProvider(create: (_) => ValuationOfStrokesArrayProvider())
      ],
      child: const MyApp(),
    ),
  );
}

const numberOfStrokes = 10;
const numberOfTees = 18;
const initialValue = '';

List<String> allStrokes = List<String>.generate(
    numberOfStrokes * numberOfTees, (int index) => initialValue,
    growable: false);

class ValuationOfStrokesArrayProvider with ChangeNotifier {
  List<String> _strokesOfATee = List<String>.generate(
      numberOfStrokes * numberOfTees, (int index) => initialValue,
      growable: false);
  List<String> get strokesOfATee => _strokesOfATee;

  void changeStrokesOfATee() {
    notifyListeners();
  }
}

class TeeProvider with ChangeNotifier {
  int _aTee = 1;
  int get aTee => _aTee;

  void inDecreaseANumber(int anAddedValue, int minValue, int maxValue) {
    // getStrokesOfAController(inputTeeController);
    _aTee += anAddedValue;
    if (_aTee > maxValue) {
      _aTee = maxValue;
    }
    if (_aTee < minValue) {
      _aTee = minValue;
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
  final String version = '1.00 / 07.03.2024';
  int tee = 1;
  // final int numberOfTees = 18;
//  final int numberOfStrokes = 10;

  String aValuation = '';

  final aStrokeController = TextEditingController();

  final List<TextEditingController> strokesController =
      List<TextEditingController>.generate(
          numberOfTees * numberOfStrokes, (index) => TextEditingController());

  String selectedRoutine = 'an initial routine value';

  final aRoutineInputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    aRoutineInputController.addListener(_getTextOutOfARoutineInputController);
    for (TextEditingController aController in strokesController) {
      aController.addListener(_getTextOutOfAStrokeController);
    }
  }

  @override
  void dispose() {
    aRoutineInputController.dispose();
    for (TextEditingController aController in strokesController) {
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

  List<String> getAllValuationsFromController() {
    List<String> valuations = [];
    logger
        .d('Anzahl Controller in strokesOfATee... ${strokesController.length}');
    for (TextEditingController aController in strokesController) {
      valuations.add(aController.text);
    }
    logger.d(valuations.length);
    return valuations;
  }

  @override
  Widget build(BuildContext context) {
    //Provider.of<TeeProvider>(context, listen: false);

    Text bottomText = Text(
      version,
      style: Theme.of(context).textTheme.bodyLarge,
    );

    return Consumer<TeeProvider>(builder: (context, teeProvider, child) {
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
            ChangeTheTee(
                // aTable: aStrokeTable,
                aFunction: getAllValuationsFromController),
            InputValuation(
             // tee: tee,
              strokeValuation: allStrokes,
              aValuationController: strokesController,
            ),
            SaveYourRound(
              aFunction: _getTextOutOfARoutineInputController,
              aControllerFunction: getAllValuationsFromController,
              //currentTee: tee,
            )
          ],
        ),
        bottomSheet:
            bottomText, // This trailing comma makes auto-formatting nicer for build methods.
      );
    });
  }
}
