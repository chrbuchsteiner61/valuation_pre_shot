import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const numberOfStrokesPerTee = 10;
const numberOfTees = 18;
const initialValue = '';
const numberOfStrokes = numberOfTees * numberOfStrokesPerTee;

String version = '1.24 / ${getCurrentDateTime()}';

const infoDrawerBackgroundColor = Colors.lightBlueAccent;

const SizedBox spaceBetween = SizedBox(width: 16);

List<String> allStrokes = List<String>.generate(
    numberOfStrokesPerTee * numberOfTees, (int index) => initialValue,
    growable: false);

String getCurrentDateTime() {
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('dd.MM.yyyy, HH:mm');
  return formatter.format(now);
}    
