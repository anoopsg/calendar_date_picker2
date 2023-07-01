import 'package:flutter/material.dart';

/// InheritedWidget indicating what the current focused date is for its children.
///
/// This is used by the [_MonthPicker] to let its children [_DayPicker]s know
/// what the currently focused date (if any) should be.
class FocusedDate extends InheritedWidget {
  const FocusedDate({
    Key? key,
    required Widget child,
    this.date,
  }) : super(key: key, child: child);

  final DateTime? date;

  @override
  bool updateShouldNotify(FocusedDate oldWidget) {
    return !DateUtils.isSameDay(date, oldWidget.date);
  }

  static DateTime? maybeOf(BuildContext context) {
    final FocusedDate? focusedDate =
        context.dependOnInheritedWidgetOfExactType<FocusedDate>();
    return focusedDate?.date;
  }
}
