import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:valuation_pre_shot/language_persistent.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:valuation_pre_shot/ui_areas/change_the_tee.dart';
import 'package:valuation_pre_shot/ui_areas/input_valuation.dart';
import 'package:valuation_pre_shot/ui_areas/input_your_routine_element.dart';
import 'package:valuation_pre_shot/ui_areas/save_your_round.dart';
import 'package:valuation_pre_shot/ui_elements/the_info_drawer.dart';
import 'package:valuation_pre_shot/constants.dart';
import 'package:valuation_pre_shot/styles/theme_data.dart';

var logger = Logger();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        
        ChangeNotifierProvider(create: (_) => TeeProvider()),
      ],
      child: const GolfRatingApp(),
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

  const GolfRatingApp({super.key});

  @override
  GolfRatingAppState createState() => GolfRatingAppState();

  // Define the 'of' method
  static GolfRatingAppState? of(BuildContext context) {
    // This method returns the nearest _GolfRatingAppState instance in the widget tree
    return context.findAncestorStateOfType<GolfRatingAppState>();
  }
}

class GolfRatingAppState extends State<GolfRatingApp> {
  LanguageService languageService = LanguageService();
  Locale _locale = const Locale('es');

  Future<void> initialLocale() async {
    String? aLanguageKey = await languageService.loadLanguage();
    setState(() {
      _locale = Locale(aLanguageKey ?? 'de');
    });
  }

  @override
  void initState() {
    super.initState();
    initialLocale(); // Move this call from build to initState
  }

  void setLocale(String locale) {
    setState(() {
      _locale = Locale(locale);
    });
  }

  Locale get currentLocale => _locale;

  @override
  Widget build(BuildContext context) {
   // initialLocale();
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('de'),
        Locale('fr'),
        Locale('es'),
        Locale('it'),
        Locale('da'),
        Locale('sv'),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Rate your Golf Routine',
      theme: AppTheme.data,
      home: const StartingPage(),
      locale: _locale,
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
    aRoutineInputController.removeListener(_getTextOutOfARoutineInputController);
    aRoutineInputController.dispose();
    for (TextEditingController aController in strokesController) {
      aController.removeListener(_getTextOutOfAStrokeController);
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
    final String localizedTitle = localizations!.appTitle;

    Text bottomText = Text(
      version,
      style: Theme.of(context).textTheme.bodyLarge,
    );

    return Consumer<TeeProvider>(builder: (context, teeProvider, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[300],
          title: Text(localizedTitle)
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
              closeRoundText: localizations.closeTheRound,
              aPdfTitle: localizations.pdfTitle,
              aPdfTableHeader: localizations.pdfTableHeader,
              aPdfSubHeader: localizations.pdfSubHeader,
              aPdfRoutineText: localizations.pdfRoutine,
              formattedDate: DateFormat('d.MM.yyyy').format(DateTime.now()),

            )
          ],
        ),
        bottomSheet:
            bottomText, // This trailing comma makes auto-formatting nicer for build methods.
      );
    });
  }
}
