import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:valuation_pre_shot/constants.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:valuation_pre_shot/main.dart';

class AStatement extends StatelessWidget {
  final String aStHeader;
  final String aStLine1;
  final String aStLine2;
  final String aStLine3;

  const AStatement(
      {super.key,
      required this.aStHeader,
      required this.aStLine1,
      required this.aStLine2,
      required this.aStLine3});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            aStHeader,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(
              height: 8), // Add some spacing between the title and the body
          Text(aStLine1),
          Text(aStLine2),
          Text(aStLine3),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class LanguageFlag extends StatelessWidget {
  final String countryCode;

  const LanguageFlag({super.key, required this.countryCode});

  @override
  Widget build(BuildContext context) {
    return CountryFlag.fromCountryCode(
      countryCode,
      height: 24,
      width: 36,
    );
  }
}

class TheInfoDrawer extends StatefulWidget {
  const TheInfoDrawer({super.key});

  @override
  TheInfoDrawerState createState() => TheInfoDrawerState();
}

class TheInfoDrawerState extends State<TheInfoDrawer> {
  String? _selectedLanguage;

  @override
  void initState() {
    super.initState();
    _selectedLanguage = GolfRatingApp.of(context)!.currentLocale.toString();
    //logger.d(_selectedLanguage);
  }

  Future<void> _changeLanguage(String? languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageKey', languageCode!);
   // logger.d('in Speichern $languageCode');
    // Trigger a rebuild of the app with the new locale
    if (mounted) {
      GolfRatingApp.of(context)!.setLocale(languageCode);
      setState(() {
        _selectedLanguage = languageCode;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.green,
            ),
            child: Text(
              localizations!.drawerHeader,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Text(
            localizations.language,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DropdownButton<String>(
              value: _selectedLanguage,
              elevation: 8,
              dropdownColor: Colors.white,
              onChanged: _changeLanguage,
              items: [
                DropdownMenuItem(
                  value: Language.english.languageKey,
                  child: Row(children: <Widget>[
                    LanguageFlag(
                      countryCode: Language.english.flagKey,
                    ),
                    spaceBetween,
                    Text(Language.english.nameKey),
                  ]),
                ),
                DropdownMenuItem(
                  value: Language.german.languageKey,
                  child: Row(children: <Widget>[
                    LanguageFlag(
                      countryCode: Language.german.flagKey,
                    ),
                    spaceBetween,
                    Text(Language.german.nameKey),
                  ]),
                ),
                DropdownMenuItem(
                  value: Language.french.languageKey,
                  child: Row(children: <Widget>[
                    LanguageFlag(
                      countryCode: Language.french.flagKey,
                    ),
                    spaceBetween,
                    Text(Language.french.nameKey),
                  ]),
                ),
                DropdownMenuItem(
                  value: Language.spanish.languageKey,
                  child: Row(children: <Widget>[
                    LanguageFlag(
                      countryCode: Language.spanish.flagKey,
                    ),
                    spaceBetween,
                    Text(Language.spanish.nameKey),
                  ]),
                ),
                DropdownMenuItem(
                  value: Language.italian.languageKey,
                  child: Row(children: <Widget>[
                    LanguageFlag(
                    countryCode: Language.italian.flagKey,
                  ),
                    spaceBetween,
                    Text(Language.italian.nameKey),
                ],
                  ),
                ),
                DropdownMenuItem(
                  value: Language.danish.languageKey,
                  child: Row(children: <Widget>[
                    LanguageFlag(
                    countryCode: Language.danish.flagKey,
                  ),
                    spaceBetween,
                    Text(Language.danish.nameKey),
                ],
                  ),
                ),
                DropdownMenuItem(
                  value: Language.swedish.languageKey,
                  child: Row(children: <Widget>[
                    LanguageFlag(
                    countryCode: Language.swedish.flagKey,
                  ),
                    spaceBetween,
                    Text(Language.swedish.nameKey),
                ],
                  ),
                ),
              ],
            ),
          ),
          Container(
              color: infoDrawerBackgroundColor,
              child: AStatement(
                aStHeader: localizations.privStHeader,
                aStLine1: localizations.privStLine1,
                aStLine2: localizations.privStLine2,
                aStLine3: localizations.privStLine3,
              )),
          const SizedBox(
            width: 40,
          ),
          Container(
            color: infoDrawerBackgroundColor,
            child: AStatement(
              aStHeader: localizations.kontakt,
              aStLine1: 'Christian Buchsteiner',
              aStLine2: 'christian@buchsteinerconsulting.de',
              aStLine3: 'Wacholderweg 15a, D-61440 Oberursel',
            ),
          ),
        ],
      ),
    );
  }
}
