import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class LanguageService {
  static const String languageCode = 'de';

  // Save selected language to shared preferences
  Future<void> saveLanguage(String languageCode) async {
    logger.d('save: $languageCode');
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageKey', languageCode);
  }

  // Load selected language from shared preferences
  Future<String?> loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('languageKey');
  }
}
