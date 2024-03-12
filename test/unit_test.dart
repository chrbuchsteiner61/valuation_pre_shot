import 'package:valuation_pre_shot/main.dart';
import 'package:test/test.dart';
import 'package:logger/logger.dart';

var logger = Logger();

void main() {
  group('Test start, increment, decrement', () {
  test('Test InDeCrease 1', () {
    TeeProvider aTestTee = TeeProvider();
    logger.d(aTestTee.aTee);
    aTestTee.inDecreaseANumber(1, 0, 10);

    expect(aTestTee.aTee, 2);
  });

  test('Test InDeCrease 2', () {
    TeeProvider aTestTee = TeeProvider();
    logger.d(aTestTee.aTee);
    aTestTee.inDecreaseANumber(-2, 2, 10);

    expect(aTestTee.aTee,2);
  });

  test('Test InDeCrease 3', () {
    TeeProvider aTestTee = TeeProvider();
    logger.d(aTestTee.aTee);
    aTestTee.inDecreaseANumber(-2, -2, 10);

    expect(aTestTee.aTee,-1);
  });

  test('Test InDeCrease 4', () {
    TeeProvider aTestTee = TeeProvider();
    logger.d(aTestTee.aTee);
    aTestTee.inDecreaseANumber(13, 1, 10);

    expect(aTestTee.aTee,10);
  });

});
}