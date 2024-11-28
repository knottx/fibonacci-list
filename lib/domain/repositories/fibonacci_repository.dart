import 'package:fibonacci_list/domain/entities/fibonacci_number.dart';

abstract class FibonacciRepository {
  List<FibonacciNumber> generateFibonacciNumbers(int count);
}
