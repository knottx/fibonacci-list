import 'package:fibonacci_list/data/repositories/fibonacci_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late FibonacciRepositoryImpl repository;

  setUp(() {
    repository = FibonacciRepositoryImpl();
  });

  group('FibonacciRepositoryImpl', () {
    test('should return an empty list when count is 0', () {
      final count = 0;
      final result = repository.generateFibonacciNumbers(count);

      expect(result, isEmpty);
    });

    test('should generate numbers correctly', () {
      final count = 10;
      final result = repository.generateFibonacciNumbers(count);

      expect(result.length, count);
      expect(
        result.map((e) => e.number),
        [0, 1, 1, 2, 3, 5, 8, 13, 21, 34],
      );
    });

    test('should assign the correct index to each number', () {
      final count = 10;
      final result = repository.generateFibonacciNumbers(count);

      for (int i = 0; i < result.length; i++) {
        expect(result[i].index, i);
      }
    });
  });
}
