import 'package:calendar_date_picker2/src/settings/settings.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class YearPickerGridView extends StatelessWidget {
  const YearPickerGridView({
    Key? key,
    required this.controller,
    required this.dragStartBehavior,
    required this.itemBuilder,
    required this.itemCount,
  }) : super(key: key);

  final ScrollController controller;
  final DragStartBehavior dragStartBehavior;
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: controller,
      dragStartBehavior: dragStartBehavior,
      gridDelegate: const _YearPickerGridDelegate(),
      itemBuilder: itemBuilder,
      itemCount: itemCount,
      padding: const EdgeInsets.symmetric(
        horizontal: Settings.yearPickerPadding,
      ),
    );
  }
}

class _YearPickerGridDelegate extends SliverGridDelegate {
  const _YearPickerGridDelegate();

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    final double tileWidth = (constraints.crossAxisExtent -
            (Settings.yearPickerColumnCount - 1) *
                Settings.yearPickerRowSpacing) /
        Settings.yearPickerColumnCount;
    return SliverGridRegularTileLayout(
      childCrossAxisExtent: tileWidth,
      childMainAxisExtent: Settings.yearPickerRowHeight,
      crossAxisCount: Settings.yearPickerColumnCount,
      crossAxisStride: tileWidth + Settings.yearPickerRowSpacing,
      mainAxisStride: Settings.yearPickerRowHeight,
      reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
    );
  }

  @override
  bool shouldRelayout(_YearPickerGridDelegate oldDelegate) => false;
}
