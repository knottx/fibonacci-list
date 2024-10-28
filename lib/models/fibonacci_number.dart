import 'package:flutter/material.dart';

enum FibonacciType {
  a,
  b,
  c,
  ;

  IconData get iconData {
    switch (this) {
      case FibonacciType.a:
        return Icons.circle;
      case FibonacciType.b:
        return Icons.crop_square;
      case FibonacciType.c:
        return Icons.clear;
    }
  }
}

class FibonacciNumber {
  final int index;
  final int number;

  FibonacciNumber({
    required this.index,
    required this.number,
  });

  FibonacciType type() {
    if (number % 3 == 0) {
      return FibonacciType.a;
    } else if (number % 3 == 1) {
      return FibonacciType.b;
    } else {
      return FibonacciType.c;
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
