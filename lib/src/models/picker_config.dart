import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class MonthPickerConfig {
  const MonthPickerConfig({
    this.rowSpacing = 8.0,
    this.padding = 16.0,
    this.rowHeight = 52.0,
    this.columnCount = 3,
    this.itemBuilder,
  });

  final double padding;
  final double rowHeight;
  final double rowSpacing;
  final int columnCount;
  final CalendarMonthItemBuilder? itemBuilder;

  MonthPickerConfig copyWith({
    double? rowSpacing,
    double? padding,
    double? rowHeight,
    int? columnCount,
    CalendarMonthItemBuilder? itemBuilder,
  }) {
    return MonthPickerConfig(
      rowHeight: rowHeight ?? this.rowHeight,
      rowSpacing: rowSpacing ?? this.rowSpacing,
      padding: padding ?? this.padding,
      columnCount: columnCount ?? this.columnCount,
      itemBuilder: itemBuilder ?? this.itemBuilder,
    );
  }
}

class YearPickerConfig {
  const YearPickerConfig({
    this.rowSpacing = 8.0,
    this.padding = 16.0,
    this.rowHeight = 52.0,
    this.columnCount = 3,
    this.itemBuilder,
  });

  final double padding;
  final double rowHeight;
  final double rowSpacing;
  final int columnCount;
  final CalendarYearItemBuilder? itemBuilder;

  YearPickerConfig copyWith({
    double? rowSpacing,
    double? padding,
    double? rowHeight,
    int? columnCount,
    CalendarYearItemBuilder? itemBuilder,
  }) {
    return YearPickerConfig(
      rowHeight: rowHeight ?? this.rowHeight,
      rowSpacing: rowSpacing ?? this.rowSpacing,
      padding: padding ?? this.padding,
      columnCount: columnCount ?? this.columnCount,
      itemBuilder: itemBuilder ?? this.itemBuilder,
    );
  }
}
