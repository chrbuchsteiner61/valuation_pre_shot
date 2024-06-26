import 'package:flutter/services.dart';

class NumericalFormatter extends TextInputFormatter {
  final double min;
  final double max;

  NumericalFormatter({required this.min, required this.max});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    } else if (double.tryParse(newValue.text) != null) {
      double value = double.parse(newValue.text);
      if (value < min) {
        return const TextEditingValue().copyWith(text: min.toStringAsFixed(2));
      } else if (value > max) {
        return oldValue;
      } else {
        return newValue;
      }
    } else {
      return oldValue;
    }
  }
}
