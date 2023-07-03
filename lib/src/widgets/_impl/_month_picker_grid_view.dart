part of '../calendar_date_picker2.dart';

class _MonthPickerGridView extends StatelessWidget {
  const _MonthPickerGridView({
    Key? key,
    this.controller,
    required this.dragStartBehavior,
    required this.itemBuilder,
    required this.itemCount,
    required this.config,
  }) : super(key: key);

  final ScrollController? controller;
  final DragStartBehavior dragStartBehavior;
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final CalendarDatePicker2Config config;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: controller,
      dragStartBehavior: dragStartBehavior,
      gridDelegate: _MonthPickerGridDelegate(config: config),
      itemBuilder: itemBuilder,
      itemCount: itemCount,
      padding: EdgeInsets.symmetric(
        horizontal: config.yearPickerConfig.padding,
      ),
    );
  }
}

class _MonthPickerGridDelegate extends SliverGridDelegate {
  const _MonthPickerGridDelegate({
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
  bool shouldRelayout(_MonthPickerGridDelegate oldDelegate) => false;
}
