import 'package:fibonacci_list/data/repositories/fibonacci_repository_impl.dart';
import 'package:fibonacci_list/domain/entities/fibonacci_number_type.dart';
import 'package:fibonacci_list/domain/use_cases/generate_fibonacci_numbers_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late FibonacciRepositoryImpl repository;
  late GenerateFibonacciNumbersUseCase useCase;

  setUp(() {
    repository = FibonacciRepositoryImpl();
    useCase = GenerateFibonacciNumbersUseCase(repository);
  });

  group('GenerateFibonacciNumbersUseCase', () {
    test('should return an empty list when count is 0', () {
      final count = 0;
      final result = useCase(count);

      expect(result, isEmpty);
    });

    test('should generate numbers correctly', () {
      final count = 10;
      final result = useCase(count);

      expect(result.length, count);
      expect(
        result.map((e) => e.number),
        [0, 1, 1, 2, 3, 5, 8, 13, 21, 34],
      );
    });

    test('should assign the correct index to each number', () {
      final count = 10;
      final result = useCase(count);

      for (int i = 0; i < result.length; i++) {
        expect(result[i].index, i);
      }
    });

    test('should calculate the type for each number correctly', () {
      final count = 10;
      final result = useCase(count);

      /// 0 % 3 == 0
      expect(result[0].type(), FibonacciNumberType.a);

      /// 1 % 3 == 1
      expect(result[1].type(), FibonacciNumberType.b);

      /// 1 % 3 == 1
      expect(result[2].type(), FibonacciNumberType.b);

      /// 2 % 3 == 2
      expect(result[3].type(), FibonacciNumberType.c);

      /// 3 % 3 == 0
      expect(result[4].type(), FibonacciNumberType.a);

      /// 5 % 3 == 2
      expect(result[5].type(), FibonacciNumberType.c);

      /// 8 % 3 == 2
      expect(result[6].type(), FibonacciNumberType.c);

      /// 13 % 3 == 1
      expect(result[7].type(), FibonacciNumberType.b);

      /// 21 % 3 == 0
      expect(result[8].type(), FibonacciNumberType.a);

      /// 34 % 3 == 1
      expect(result[9].type(), FibonacciNumberType.b);
    });
  });
}
