import 'package:flutter/material.dart';

const numberOfStrokesPerTee = 10;
const numberOfTees = 18;
const initialValue = '';
const numberOfStrokes = numberOfTees * numberOfStrokesPerTee; 

const String version = '1.20 / 04.07.2024';

const infoDrawerBackgroundColor = Colors.lightBlueAccent;

List<String> allStrokes = List<String>.generate(
    numberOfStrokesPerTee * numberOfTees, (int index) => initialValue,
    growable: false);