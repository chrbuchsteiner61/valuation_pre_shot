import 'package:valuation_pre_shot/main.dart';
import 'package:test/test.dart';
import 'package:logger/logger.dart';

var logger = Logger();

void main() {
  group('Test class MyHomePage', () {
    test('Test  1', () {
      MyHomePage aTestClass = MyHomePage(title: 'test');
      logger.d(aTestClass.title);

      expect(aTestClass.title, 'test');
    });
  });
}
