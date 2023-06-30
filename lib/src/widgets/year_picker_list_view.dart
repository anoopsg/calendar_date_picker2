import 'package:calendar_date_picker2/src/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class C2YearPickerListView extends StatelessWidget {
  const C2YearPickerListView({
    Key? key,
    required this.dragStartBehavior,
    required this.itemBuilder,
    required this.itemCount,
    required this.controller,
  }) : super(key: key);

  final DragStartBehavior dragStartBehavior;
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      dragStartBehavior: dragStartBehavior,
      itemBuilder: itemBuilder,
      itemCount: itemCount,
      padding: const EdgeInsets.symmetric(
        horizontal: C2Constants.yearPickerPadding,
      ),
    );
  }
}

class C2YearPickerDefaultListItem extends StatelessWidget {
  const C2YearPickerDefaultListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
