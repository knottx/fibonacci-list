import 'package:flutter/material.dart';

enum FibonacciNumberType {
  a,
  b,
  c,
  ;

  IconData get iconData {
    switch (this) {
      case FibonacciNumberType.a:
        return Icons.circle;
      case FibonacciNumberType.b:
        return Icons.crop_square;
      case FibonacciNumberType.c:
        return Icons.clear;
    }
  }
}
