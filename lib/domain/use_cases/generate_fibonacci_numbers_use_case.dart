import 'package:fibonacci_list/domain/entities/fibonacci_number.dart';
import 'package:fibonacci_list/domain/repositories/fibonacci_repository.dart';

class GenerateFibonacciNumbersUseCase {
  final FibonacciRepository repository;

  GenerateFibonacciNumbersUseCase(this.repository);

  List<FibonacciNumber> call(int count) {
    return repository.generateFibonacciNumbers(count);
  }
}
