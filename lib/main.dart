import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:valuation_pre_shot/l10n.dart';

import 'package:valuation_pre_shot/ui_areas/change_the_tee.dart';
import 'package:valuation_pre_shot/ui_areas/input_valuation.dart';
import 'package:valuation_pre_shot/ui_areas//input_your_routine_element.dart';
import 'package:valuation_pre_shot/ui_areas//save_your_round.dart';
import 'package:valuation_pre_shot/ui_elements/the_info_drawer.dart';
import 'package:valuation_pre_shot/constants.dart';
import 'package:valuation_pre_shot/styles/theme_data.dart';

var logger = Logger();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? savedLocale = prefs.getString('savedLocale');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TeeProvider()),
      ],
      child: GolfRatingApp(savedLocale: savedLocale),
    ),
  );
}

class TeeProvider with ChangeNotifier {
  int _aTee = 1;
  int get aTee => _aTee;

  void inDecreaseANumber(int anAddedValue, int minValue, int maxValue) {
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

class GolfRatingApp extends StatefulWidget {
  final Locale savedLocale;
  const GolfRatingApp({super.key, required this.savedLocale});

  @override
  _GolfRatingAppState createState() => _GolfRatingAppState();

  // Define the 'of' method
  static _GolfRatingAppState? of(BuildContext context) {
    // This method returns the nearest _GolfRatingAppState instance in the widget tree
    return context.findAncestorStateOfType<_GolfRatingAppState>();
  }
}

class _GolfRatingAppState extends State<GolfRatingApp> {
   Locale _locale = const Locale('en');

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }
  //final String? savedLocale;
  // const GolfRatingApp({super.key, this.savedLocale});

  @override
  Widget build(BuildContext context) {
  //  Locale _locale = savedLocale != null ? Locale(savedLocale!) : Locale('en');
    return MaterialApp(
      locale: _locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      title: 'Golf Shot Valuation',
      theme: AppTheme.data,
      home: const StartingPage(),

    );
  }
}

class StartingPage extends StatefulWidget {
  const StartingPage({super.key});

  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  int tee = 1;
  String aValuation = '';

  final aStrokeController = TextEditingController();

  final List<TextEditingController> strokesController =
      List<TextEditingController>.generate(numberOfTees * numberOfStrokesPerTee,
          (index) => TextEditingController());

  String selectedRoutine = 'initial routine';

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

  List<String> _getAllValuationsFromController() {
    List<String> valuations = [];

    for (TextEditingController aController in strokesController) {
      valuations.add(aController.text);
    }

    return valuations;
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final String localizedTitle = localizations.translate('appTitle');

    Text bottomText = Text(
      version,
      style: Theme.of(context).textTheme.bodyLarge,
    );

    return Consumer<TeeProvider>(builder: (context, teeProvider, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(localizedTitle),
        ),
        drawer: const TheInfoDrawer(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InputYourRoutineElement(
              aController: aRoutineInputController,
            ),
            ChangeTheTee(aFunction: _getAllValuationsFromController),
            InputValuation(
              strokeValuation: allStrokes,
              aValuationController: strokesController,
            ),
            SaveYourRound(
              aFunction: _getTextOutOfARoutineInputController,
              aControllerFunction: _getAllValuationsFromController,
            )
          ],
        ),
        bottomSheet:
            bottomText, // This trailing comma makes auto-formatting nicer for build methods.
      );
    });
  }
}
