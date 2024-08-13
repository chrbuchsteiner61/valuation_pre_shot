enum Language {
  english('en', 'GB', 'english'),
  german('de', 'DE', 'deutsch'),
  french('fr', 'FR', 'francais'),
  spanish('es', 'ES', 'espanol'),
  italian('it', 'IT', 'italiano'),
  danish('da', 'DK', 'dansk'),
  swedish('sv', 'SE', 'svenska');

  final String short;
  final String flag;
  final String name;
  const Language(this.short, this.flag, this.name);

  String get languageKey => short;
  String get flagKey => flag;
  String get nameKey => name;
}