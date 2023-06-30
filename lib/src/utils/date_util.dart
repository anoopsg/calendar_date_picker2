import 'package:flutter/material.dart';

int getMonthFirstDayOffset(int year, int month, int firstDayOfWeekIndex) {
  // 0-based day of week for the month and year, with 0 representing Monday.
  final int weekdayFromMonday = DateTime(year, month).weekday - 1;

  // firstDayOfWeekIndex recomputed to be Monday-based, in order to compare with
  // weekdayFromMonday.
  firstDayOfWeekIndex = (firstDayOfWeekIndex - 1) % 7;

  // Number of days between the first day of week appearing on the calendar,
  // and the day corresponding to the first of the month.
  return (weekdayFromMonday - firstDayOfWeekIndex) % 7;
}

//TODO: replace with solid implementation
String getMonthLabelFromLocale(DateTime date, BuildContext context) {
  final labels =
      MaterialLocalizations.of(context).formatMonthYear(date).split(' ');
  return (labels.length == 2 && labels.first.length >= 3)
      ? labels.first.substring(0, 3)
      : 'Err';
}
