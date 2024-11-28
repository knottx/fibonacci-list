import 'package:fibonacci_list/domain/entities/fibonacci_number_type.dart';

class FibonacciNumber {
  final int index;
  final int number;

  const FibonacciNumber({
    required this.index,
    required this.number,
  });

  FibonacciNumberType type() {
    switch (number % 3) {
      case 0:
        return FibonacciNumberType.a;
      case 1:
        return FibonacciNumberType.b;
      default:
        return FibonacciNumberType.c;
    }
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FibonacciNumber &&
        other.index == index &&
        other.number == number;
  }

  @override
  int get hashCode => index.hashCode ^ number.hashCode;
}
