import 'package:calendar_date_picker2/calendar_date_picker2.dart';
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
    required this.config,
  }) : super(key: key);

  final ScrollController controller;
  final DragStartBehavior dragStartBehavior;
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final CalendarDatePicker2Config config;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: controller,
      dragStartBehavior: dragStartBehavior,
      gridDelegate: _YearPickerGridDelegate(config: config),
      itemBuilder: itemBuilder,
      itemCount: itemCount,
      padding: EdgeInsets.symmetric(
        horizontal: config.yearPickerConfig.padding,
      ),
    );
  }
}

class _YearPickerGridDelegate extends SliverGridDelegate {
  const _YearPickerGridDelegate({
    required this.config,
  });

  final CalendarDatePicker2Config config;

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    final cnf = config.yearPickerConfig;

    final double tileWidth =
        (constraints.crossAxisExtent - (cnf.columnCount - 1) * cnf.rowSpacing) /
            cnf.columnCount;
    return SliverGridRegularTileLayout(
      childCrossAxisExtent: tileWidth,
      childMainAxisExtent: cnf.rowHeight,
      crossAxisCount: cnf.columnCount,
      crossAxisStride: tileWidth + cnf.rowSpacing,
      mainAxisStride: cnf.rowHeight,
      reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
    );
  }

  @override
  bool shouldRelayout(_YearPickerGridDelegate oldDelegate) => false;
}

class C2YearPickerDefaultGridItem extends StatelessWidget {
  const C2YearPickerDefaultGridItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
