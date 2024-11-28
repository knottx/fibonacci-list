import 'package:fibonacci_list/domain/entities/fibonacci_number.dart';
import 'package:flutter/material.dart';

class FibonacciNumberListTile extends StatelessWidget {
  final FibonacciNumber fibonacciNumber;
  final bool selected;
  final Color selectedColor;
  final VoidCallback onTap;

  const FibonacciNumberListTile({
    super.key,
    required this.fibonacciNumber,
    required this.onTap,
    required this.selected,
    required this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ListTile(
        onTap: onTap,
        tileColor: selected ? selectedColor : null,
        leading: Text(
          [
            'Index:',
            fibonacciNumber.index.toString(),
          ].join(' '),
        ),
        title: Text(
          [
            'Number:',
            fibonacciNumber.number.toString(),
          ].join(' '),
        ),
        trailing: Icon(
          fibonacciNumber.type().iconData,
        ),
      ),
    );
  }
}
