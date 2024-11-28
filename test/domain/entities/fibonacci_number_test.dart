import 'package:fibonacci_list/domain/entities/fibonacci_number.dart';
import 'package:fibonacci_list/domain/entities/fibonacci_number_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FibonacciNumber', () {
    test('should return FibonacciNumberType.a when number % 3 == 0', () {
      final fibonacciNumber = FibonacciNumber(index: 0, number: 0);

      expect(
        fibonacciNumber.type(),
        FibonacciNumberType.a,
      );
    });

    test('should return FibonacciNumberType.b when number % 3 == 1', () {
      final fibonacciNumber = FibonacciNumber(index: 1, number: 1);

      expect(
        fibonacciNumber.type(),
        FibonacciNumberType.b,
      );
    });

    test('should return FibonacciNumberType.c when number % 3 == 2', () {
      final fibonacciNumber = FibonacciNumber(index: 3, number: 2);

      expect(
        fibonacciNumber.type(),
        FibonacciNumberType.c,
      );
    });

    test('should be equal with same index and number', () {
      final fibonacciNumber1 = FibonacciNumber(index: 0, number: 0);
      final fibonacciNumber2 = FibonacciNumber(index: 0, number: 0);

      expect(
        fibonacciNumber1,
        equals(fibonacciNumber2),
      );
    });

    test('should not be equal with different index or number', () {
      final fibonacciNumber1 = FibonacciNumber(index: 0, number: 3);
      final fibonacciNumber2 = FibonacciNumber(index: 1, number: 3);
      final fibonacciNumber3 = FibonacciNumber(index: 0, number: 4);

      expect(
        fibonacciNumber1,
        isNot(equals(fibonacciNumber2)),
      );
      expect(
        fibonacciNumber1,
        isNot(equals(fibonacciNumber3)),
      );
    });

    test('should have consistent hashCode for equal FibonacciNumbers', () {
      final fibonacciNumber1 = FibonacciNumber(index: 0, number: 3);
      final fibonacciNumber2 = FibonacciNumber(index: 0, number: 3);

      expect(
        fibonacciNumber1.hashCode,
        equals(fibonacciNumber2.hashCode),
      );
    });

    test('should have different hashCode for different FibonacciNumbers', () {
      final fibonacciNumber1 = FibonacciNumber(index: 0, number: 3);
      final fibonacciNumber2 = FibonacciNumber(index: 1, number: 3);
      final fibonacciNumber3 = FibonacciNumber(index: 0, number: 4);

      expect(
        fibonacciNumber1.hashCode,
        isNot(equals(fibonacciNumber2.hashCode)),
      );
      expect(
        fibonacciNumber1.hashCode,
        isNot(equals(fibonacciNumber3.hashCode)),
      );
    });
  });
}
