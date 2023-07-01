import 'package:calendar_date_picker2/src/settings/settings.dart';
import 'package:calendar_date_picker2/src/widgets/picker_toggle_button.dart';
import 'package:flutter/material.dart';

import '../../calendar_date_picker2.dart';

/// Custom header to toggle the [C2DatePickerMode] for a date picker.
///
/// This appears above the calendar grid and allows the user to toggle the
/// [C2DatePickerMode] to display either the calendar view or the year list
/// or month view.
class CalendarHeader extends StatefulWidget {
  const CalendarHeader({
    Key? key,
    required this.mode,
    required this.config,
    required this.yearPickerLabelFull,
    required this.yearPickerLabelShort,
    required this.monthPickerLabel,
    required this.onMonthPickerTap,
    required this.onYearPickerTap,
  }) : super(key: key);

  final String yearPickerLabelFull;

  final String yearPickerLabelShort;

  final String monthPickerLabel;

  /// The current display of the calendar picker.
  final C2DatePickerMode mode;

  /// The callback when the year picker is pressed.
  final VoidCallback onYearPickerTap;

  /// The callback when the month picker is pressed.
  final VoidCallback onMonthPickerTap;

  /// The calendar configurations
  final CalendarDatePicker2Config config;

  @override
  DatePickerModeToggleButtonState createState() =>
      DatePickerModeToggleButtonState();
}

class DatePickerModeToggleButtonState extends State<CalendarHeader> {
  bool get shouldShowMonthPicker {
    if (widget.config.centerAlignModePicker == true) {
      return false;
    }
    return true;
  }

  String get resolveYearLabel {
    if (shouldShowMonthPicker) {
      return widget.yearPickerLabelShort;
    }
    return widget.yearPickerLabelFull;
  }

  @override
  Widget build(BuildContext context) {
    var datePickerOffsetPadding = Settings.monthNavButtonsWidth;
    if (widget.config.centerAlignModePicker == true) {
      datePickerOffsetPadding /= 2;
    }

    return Container(
      padding: widget.config.centerAlignModePicker == true
          ? EdgeInsets.zero
          : const EdgeInsetsDirectional.only(start: 16, end: 4),
      height: (widget.config.controlsHeight ?? Settings.subHeaderHeight),
      child: Row(
        mainAxisAlignment: widget.config.centerAlignModePicker == true
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: <Widget>[
          if (widget.mode == C2DatePickerMode.day &&
              widget.config.centerAlignModePicker == true)
            // Give space for the prev/next month buttons that are underneath this row
            SizedBox(width: datePickerOffsetPadding),
          Flexible(
            child: Semantics(
              label: MaterialLocalizations.of(context).selectYearSemanticsLabel,
              excludeSemantics: true,
              button: true,
              child: SizedBox(
                height:
                    (widget.config.controlsHeight ?? Settings.subHeaderHeight),
                child: InkWell(
                  onTap: widget.config.disableModePicker == true
                      ? null
                      : widget.onYearPickerTap,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: widget.config.centerAlignModePicker == true
                            ? 0
                            : 8),
                    child: PickerToggleButton(
                      isExpanded: widget.mode == C2DatePickerMode.year,
                      title: resolveYearLabel,
                      config: widget.config,
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (shouldShowMonthPicker)
            Flexible(
              child: InkWell(
                onTap: widget.config.disableModePicker == true
                    ? null
                    : widget.onMonthPickerTap,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          widget.config.centerAlignModePicker == true ? 0 : 8),
                  child: PickerToggleButton(
                    isExpanded: widget.mode == C2DatePickerMode.month,
                    title: widget.monthPickerLabel,
                    config: widget.config,
                  ),
                ),
              ),
            ),
          if (widget.mode == C2DatePickerMode.day)
            // Give space for the prev/next month buttons that are underneath this row
            SizedBox(width: datePickerOffsetPadding),
        ],
      ),
    );
  }
}
