import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class LanguageService {
  static const String _languageKey = 'de';

  // Save selected language to shared preferences
  Future<void> saveLanguage(String languageCode) async {
    logger.d('save: $_languageKey');
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, languageCode);
  }

  // Load selected language from shared preferences
  Future<String?> loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    logger.d('load: $_languageKey');
    return prefs.getString(_languageKey);
  }
}
