import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';

const numberOfStrokesPerTee = 10;
const numberOfTees = 18;
const initialValue = '';
const numberOfStrokes = numberOfTees * numberOfStrokesPerTee;

String version = '1.241 / 20.12.2024, 10:00';

const infoDrawerBackgroundColor = Colors.lightBlueAccent;

const SizedBox spaceBetween = SizedBox(width: 16);

List<String> allStrokes = List<String>.generate(
    numberOfStrokesPerTee * numberOfTees, (int index) => initialValue,
    growable: false);

  
