import 'package:test/test.dart';

const double _defaultErrorTolerance = 1e-10;

Matcher moreOrLessEquals(double value,
    {double epsilon = _defaultErrorTolerance}) {
  return _MoreOrLessEquals(value, epsilon);
}

class _MoreOrLessEquals extends Matcher {
  const _MoreOrLessEquals(this.value, this.epsilon) : assert(epsilon >= 0);

  final double value;
  final double epsilon;

  @override
  bool matches(Object object, Map<dynamic, dynamic> matchState) {
    if (object is! num) return false;
    if (object == value) return true;
    final num test = object as num;
    return (test - value).abs() <= epsilon;
  }

  @override
  Description describe(Description description) =>
      description.add('$value (±$epsilon)');

  @override
  Description describeMismatch(Object item, Description mismatchDescription,
      Map<dynamic, dynamic> matchState, bool verbose) {
    return super
        .describeMismatch(item, mismatchDescription, matchState, verbose)
          ..add('$item is not in the range of $value (±$epsilon).');
  }
}
