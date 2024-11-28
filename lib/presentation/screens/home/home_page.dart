import 'package:fibonacci_list/domain/entities/fibonacci_number.dart';
import 'package:fibonacci_list/presentation/widgets/fibonacci_number_list_tile.dart';
import 'package:fibonacci_list/presentation/widgets/selected_fibonacci_bottom_sheet.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final List<FibonacciNumber> fibonacciNumbers;

  const HomeScreen({
    super.key,
    required this.fibonacciNumbers,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  final List<FibonacciNumber> selectedList = [];

  FibonacciNumber? recentlyAdded;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Fibonacci List'),
      ),
      body: Scrollbar(
        controller: _scrollController,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: widget.fibonacciNumbers.length,
          itemBuilder: (context, index) {
            final fibonacciNumber = widget.fibonacciNumbers[index];

            return FibonacciNumberListTile(
              fibonacciNumber: fibonacciNumber,
              selected: recentlyAdded == fibonacciNumber,
              selectedColor: Colors.red,
              onTap: () {
                setState(() {
                  widget.fibonacciNumbers.removeAt(index);
                });

                selectedList.add(fibonacciNumber);
                selectedList.sort((a, b) => a.index.compareTo(b.index));

                _showSelectedList(fibonacciNumber);
              },
            );
          },
        ),
      ),
    );
  }

  void _showSelectedList(FibonacciNumber selected) async {
    final fibonacciNumber = await SelectedFibonacciBottomSheet.show(
      context,
      selected: selected,
      selectedList: selectedList,
    );

    if (fibonacciNumber != null) {
      selectedList.remove(fibonacciNumber);

      widget.fibonacciNumbers.add(fibonacciNumber);
      widget.fibonacciNumbers.sort((a, b) => a.index.compareTo(b.index));

      setState(() {
        recentlyAdded = fibonacciNumber;
      });

      _scrollToFibonacciNumber(fibonacciNumber);
    }
  }

  void _scrollToFibonacciNumber(FibonacciNumber fibonacciNumber) {
    final index = widget.fibonacciNumbers.indexOf(fibonacciNumber);
    if (index >= 0) {
      final targetOffset = (index - 2) * 56.0;
      final maxScrollExtent = _scrollController.position.maxScrollExtent;

      _scrollController.animateTo(
        targetOffset.clamp(0, maxScrollExtent),
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeIn,
      );
    }
  }
}
