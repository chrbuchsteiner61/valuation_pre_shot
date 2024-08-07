import 'package:flutter/material.dart';

const numberOfStrokesPerTee = 10;
const numberOfTees = 18;
const initialValue = '';
const numberOfStrokes = numberOfTees * numberOfStrokesPerTee;

const String version = '1.23 / 06.08.2024';

const infoDrawerBackgroundColor = Colors.lightBlueAccent;

const SizedBox spaceBetween = SizedBox(width: 16);

List<String> allStrokes = List<String>.generate(
    numberOfStrokesPerTee * numberOfTees, (int index) => initialValue,
    growable: false);

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