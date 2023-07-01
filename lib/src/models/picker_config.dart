abstract class _PickerConfig {
  const _PickerConfig({
    required this.padding,
    required this.rowHeight,
    required this.rowSpacing,
    required this.columnCount,
  });

  final double padding;
  final double rowHeight;
  final double rowSpacing;
  final int columnCount;
}

class MonthPickerConfig extends _PickerConfig {
  const MonthPickerConfig({
    double rowSpacing = 8.0,
    double padding = 16.0,
    double rowHeight = 52.0,
    int columnCount = 3,
  }) : super(
          rowSpacing: rowSpacing,
          rowHeight: rowHeight,
          padding: padding,
          columnCount: columnCount,
        );

  MonthPickerConfig copyWith({
    double? rowSpacing,
    double? padding,
    double? rowHeight,
    int? columnCount,
  }) {
    return MonthPickerConfig(
      rowHeight: rowHeight ?? this.rowHeight,
      rowSpacing: rowSpacing ?? this.rowSpacing,
      padding: padding ?? this.padding,
      columnCount: columnCount ?? this.columnCount,
    );
  }
}

class YearPickerConfig extends _PickerConfig {
  const YearPickerConfig({
    double rowSpacing = 8.0,
    double padding = 16.0,
    double rowHeight = 52.0,
    int columnCount = 3,
  }) : super(
          rowSpacing: rowSpacing,
          rowHeight: rowHeight,
          padding: padding,
          columnCount: columnCount,
        );

  YearPickerConfig copyWith({
    double? rowSpacing,
    double? padding,
    double? rowHeight,
    int? columnCount,
  }) {
    return YearPickerConfig(
      rowHeight: rowHeight ?? this.rowHeight,
      rowSpacing: rowSpacing ?? this.rowSpacing,
      padding: padding ?? this.padding,
      columnCount: columnCount ?? this.columnCount,
    );
  }
}
