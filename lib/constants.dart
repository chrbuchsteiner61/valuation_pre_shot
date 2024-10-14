import 'package:flutter/material.dart';

const numberOfStrokesPerTee = 10;
const numberOfTees = 18;
const initialValue = '';
const numberOfStrokes = numberOfTees * numberOfStrokesPerTee;

const String version = '1.23 / 14.10.2024';

const infoDrawerBackgroundColor = Colors.lightBlueAccent;

const SizedBox spaceBetween = SizedBox(width: 16);

List<String> allStrokes = List<String>.generate(
    numberOfStrokesPerTee * numberOfTees, (int index) => initialValue,
    growable: false);
