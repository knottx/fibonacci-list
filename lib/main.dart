import 'package:fibonacci_list/data/repositories/fibonacci_repository_impl.dart';
import 'package:fibonacci_list/domain/entities/fibonacci_number.dart';
import 'package:fibonacci_list/domain/use_cases/generate_fibonacci_numbers_use_case.dart';
import 'package:fibonacci_list/presentation/screens/home/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  final fibonacciRepository = FibonacciRepositoryImpl();
  final generateFibonacciNumbersUseCase = GenerateFibonacciNumbersUseCase(
    fibonacciRepository,
  );

  final fibonacciNumbers = generateFibonacciNumbersUseCase(40);

  runApp(MyApp(fibonacciNumbers: fibonacciNumbers));
}

class MyApp extends StatelessWidget {
  final List<FibonacciNumber> fibonacciNumbers;

  const MyApp({
    super.key,
    required this.fibonacciNumbers,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fibonacci List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: HomeScreen(
        fibonacciNumbers: fibonacciNumbers,
      ),
    );
  }
}
