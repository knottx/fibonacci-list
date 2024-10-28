import 'package:fibonacci_list/home/selected_fibonacci_bottom_sheet.dart';
import 'package:fibonacci_list/home/widgets/fibonacci_list_tile.dart';
import 'package:fibonacci_list/models/fibonacci_number.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  List<FibonacciNumber> mainList = [];
  List<FibonacciNumber> selectedList = [];

  FibonacciNumber? recentlyAdded;

  @override
  void initState() {
    List<int> fibonacciNumbers = [0, 1];
    for (int i = 2; i < 40; i++) {
      fibonacciNumbers.add(fibonacciNumbers[i - 1] + fibonacciNumbers[i - 2]);
    }

    mainList = fibonacciNumbers
        .asMap()
        .entries
        .map(
          (e) => FibonacciNumber(
            index: e.key,
            number: e.value,
          ),
        )
        .toList();

    super.initState();
  }

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
          itemCount: mainList.length,
          itemBuilder: (context, index) {
            final fibonacciNumber = mainList[index];

            return FibonacciListTile(
              fibonacciNumber: fibonacciNumber,
              selected: recentlyAdded == fibonacciNumber,
              selectedColor: Colors.red,
              onTap: () {
                final selected = mainList.removeAt(index);
                selectedList.add(selected);
                selectedList.sort((a, b) => a.index.compareTo(b.index));

                setState(() {});

                _showSelectedList(selected: selected);
              },
            );
          },
        ),
      ),
    );
  }

  void _showSelectedList({
    required FibonacciNumber selected,
  }) async {
    final fibonacciNumber = await SelectedFibonacciBottomSheet.show(
      context,
      selected: selected,
      selectedList: selectedList,
    );

    if (fibonacciNumber != null) {
      selectedList.remove(fibonacciNumber);

      mainList.add(fibonacciNumber);
      mainList.sort((a, b) => a.index.compareTo(b.index));

      setState(() {
        recentlyAdded = fibonacciNumber;
      });

      final scrollIndex = mainList.indexOf(fibonacciNumber);
      if (scrollIndex >= 0) {
        final targetOffset = (scrollIndex - 2) * 56.0;
        final maxScrollExtent = _scrollController.position.maxScrollExtent;

        _scrollController.animateTo(
          targetOffset.clamp(0, maxScrollExtent),
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeIn,
        );
      }
    }
  }
}
