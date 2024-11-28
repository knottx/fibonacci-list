import 'package:fibonacci_list/data/models/fibonacci_number_model.dart';
import 'package:fibonacci_list/domain/repositories/fibonacci_repository.dart';

class FibonacciRepositoryImpl implements FibonacciRepository {
  @override
  List<FibonacciNumberModel> generateFibonacciNumbers(int count) {
    if (count <= 0) return [];

    final List<int> fibonacciNumbers = [];

    for (int i = 0; i < count; i++) {
      if (i == 0) {
        fibonacciNumbers.add(0);
      } else if (i == 1) {
        fibonacciNumbers.add(1);
      } else {
        fibonacciNumbers.add(
          fibonacciNumbers[i - 1] + fibonacciNumbers[i - 2],
        );
      }
    }

    return fibonacciNumbers
        .asMap()
        .entries
        .map(
          (e) => FibonacciNumberModel(
            index: e.key,
            number: e.value,
          ),
        )
        .toList();
  }
}
