import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

const List<String> _fallbackMonthLabels = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec',
];

class HeaderConfig {
  const HeaderConfig({
    this.disableMonthPagination = false,
    this.contentAlignX = MainAxisAlignment.start,
    this.enableMonthPicker = false,
  });

  final bool disableMonthPagination;
  final MainAxisAlignment contentAlignX;
  final bool enableMonthPicker;
}

class MonthPickerConfig {
  const MonthPickerConfig({
    this.rowSpacing = 8.0,
    this.padding = 16.0,
    this.rowHeight = 52.0,
    this.columnCount = 3,
    this.itemBuilder,
    List<String>? monthLabels,
  })  : assert(monthLabels == null || monthLabels.length == 12),
        monthLabels = monthLabels ?? _fallbackMonthLabels;

  final double padding;
  final double rowHeight;
  final double rowSpacing;
  final int columnCount;
  final CalendarMonthItemBuilder? itemBuilder;
  final List<String> monthLabels;

  String getLabelByMonth(int month) {
    assert(month > 0 && month <= 12);
    return monthLabels.elementAt(month - 1);
  }

  MonthPickerConfig copyWith({
    double? rowSpacing,
    double? padding,
    double? rowHeight,
    int? columnCount,
    CalendarMonthItemBuilder? itemBuilder,
    final List<String>? monthLabels,
  }) {
    return MonthPickerConfig(
      rowHeight: rowHeight ?? this.rowHeight,
      rowSpacing: rowSpacing ?? this.rowSpacing,
      padding: padding ?? this.padding,
      columnCount: columnCount ?? this.columnCount,
      itemBuilder: itemBuilder ?? this.itemBuilder,
      monthLabels: monthLabels ?? this.monthLabels,
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
