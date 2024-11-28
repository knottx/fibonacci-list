import 'package:fibonacci_list/domain/entities/fibonacci_number.dart';
import 'package:fibonacci_list/presentation/widgets/fibonacci_number_list_tile.dart';
import 'package:flutter/material.dart';

class SelectedFibonacciBottomSheet {
  SelectedFibonacciBottomSheet._();

  static Future<FibonacciNumber?> show(
    BuildContext context, {
    required FibonacciNumber selected,
    required List<FibonacciNumber> selectedList,
  }) {
    return showModalBottomSheet<FibonacciNumber>(
      context: context,
      clipBehavior: Clip.antiAlias,
      builder: (bottomSheetContext) {
        return _SelectedFibonacciBottomSheetView(
          selected: selected,
          selectedList: selectedList,
          onSelected: (fibonacciNumber) {
            Navigator.pop(bottomSheetContext, fibonacciNumber);
          },
        );
      },
    );
  }
}

class _SelectedFibonacciBottomSheetView extends StatefulWidget {
  final FibonacciNumber selected;
  final List<FibonacciNumber> selectedList;
  final void Function(FibonacciNumber) onSelected;

  const _SelectedFibonacciBottomSheetView({
    required this.selected,
    required this.selectedList,
    required this.onSelected,
  });

  @override
  State<_SelectedFibonacciBottomSheetView> createState() =>
      _SelectedFibonacciBottomSheetViewState();
}

class _SelectedFibonacciBottomSheetViewState
    extends State<_SelectedFibonacciBottomSheetView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    final scrollIndex = widget.selectedList.indexOf(widget.selected);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollIndex >= 0) {
        final targetOffset = scrollIndex * 56.0;
        final maxScrollExtent = _scrollController.position.maxScrollExtent;

        _scrollController.animateTo(
          targetOffset.clamp(0, maxScrollExtent),
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredList = widget.selectedList
        .where((e) => e.type() == widget.selected.type())
        .toList();

    return Scrollbar(
      controller: _scrollController,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: filteredList.length,
        itemBuilder: (context, index) {
          final fibonacciNumber = filteredList[index];

          return FibonacciNumberListTile(
            fibonacciNumber: fibonacciNumber,
            selected: widget.selected == fibonacciNumber,
            selectedColor: Colors.green,
            onTap: () => widget.onSelected(fibonacciNumber),
          );
        },
      ),
    );
  }
}
