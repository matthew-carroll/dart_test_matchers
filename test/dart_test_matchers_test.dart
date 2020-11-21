import 'package:dart_test_matchers/dart_test_matchers.dart';
import 'package:test/test.dart';

void main() {
  test('moreOrLessEquals', () {
    // This is the highest level of precision that a double
    // in Dart will tolerate. If any numbers are added to the
    // left of the decimal point, we will lose precision to
    // the right of the decimal.
    expect(
      0.00000000000000001,
      moreOrLessEquals(0.0, epsilon: 10e-17),
    );

    // Test an arbitrary positive fraction.
    expect(
      5.3,
      moreOrLessEquals(5.0, epsilon: 1.0),
    );

    // Test an arbitrary negative integer.
    expect(
      -109,
      moreOrLessEquals(-110, epsilon: 1),
    );
  });
}
