import 'package:flutter_test/flutter_test.dart';
import 'package:tests_example/math/great_math_library.dart';

void main() {
  test('Sum of numbers should be correct', () {
    final result = GreatMathLibrary.sum(2, 2);
    expect(result, 4);
  });
}


