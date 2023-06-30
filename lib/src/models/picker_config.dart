abstract class C2PickerConfig {
  const C2PickerConfig({
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

class C2MonthPickerConfig extends C2PickerConfig {
  const C2MonthPickerConfig({
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

  C2MonthPickerConfig copyWith({
    double? rowSpacing,
    double? padding,
    double? rowHeight,
    int? columnCount,
  }) {
    return C2MonthPickerConfig(
      rowHeight: rowHeight ?? this.rowHeight,
      rowSpacing: rowSpacing ?? this.rowSpacing,
      padding: padding ?? this.padding,
      columnCount: columnCount ?? this.columnCount,
    );
  }
}

class C2YearPickerConfig extends C2PickerConfig {
  const C2YearPickerConfig({
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

  C2YearPickerConfig copyWith({
    double? rowSpacing,
    double? padding,
    double? rowHeight,
    int? columnCount,
  }) {
    return C2YearPickerConfig(
      rowHeight: rowHeight ?? this.rowHeight,
      rowSpacing: rowSpacing ?? this.rowSpacing,
      padding: padding ?? this.padding,
      columnCount: columnCount ?? this.columnCount,
    );
  }
}
