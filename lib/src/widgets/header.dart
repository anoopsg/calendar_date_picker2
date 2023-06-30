import 'package:calendar_date_picker2/src/constants.dart';
import 'package:calendar_date_picker2/src/widgets/picker_toggle_button.dart';
import 'package:flutter/material.dart';

import '../../calendar_date_picker2.dart';

/// A button that used to toggle the [DatePickerMode] for a date picker.
///
/// This appears above the calendar grid and allows the user to toggle the
/// [DatePickerMode] to display either the calendar view or the year list.
class C2PickerHeader extends StatefulWidget {
  const C2PickerHeader({
    Key? key,
    required this.mode,
    required this.title,
    required this.onTitlePressed,
    required this.config,
  }) : super(key: key);

  /// The current display of the calendar picker.
  final DatePickerMode mode;

  /// The text that displays the current month/year being viewed.
  final String title;

  /// The callback when the title is pressed.
  final VoidCallback onTitlePressed;

  /// The calendar configurations
  final CalendarDatePicker2Config config;

  @override
  DatePickerModeToggleButtonState createState() =>
      DatePickerModeToggleButtonState();
}

class DatePickerModeToggleButtonState extends State<C2PickerHeader> {
  bool get shouldShowMonthPicker {
    if (widget.config.centerAlignModePicker == true) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    var datePickerOffsetPadding = C2Constants.monthNavButtonsWidth;
    if (widget.config.centerAlignModePicker == true) {
      datePickerOffsetPadding /= 2;
    }

    return Container(
      padding: widget.config.centerAlignModePicker == true
          ? EdgeInsets.zero
          : const EdgeInsetsDirectional.only(start: 16, end: 4),
      height: (widget.config.controlsHeight ?? C2Constants.subHeaderHeight),
      child: Row(
        mainAxisAlignment: widget.config.centerAlignModePicker == true
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: <Widget>[
          if (widget.mode == DatePickerMode.day &&
              widget.config.centerAlignModePicker == true)
            // Give space for the prev/next month buttons that are underneath this row
            SizedBox(width: datePickerOffsetPadding),
          Flexible(
            child: Semantics(
              label: MaterialLocalizations.of(context).selectYearSemanticsLabel,
              excludeSemantics: true,
              button: true,
              child: SizedBox(
                height: (widget.config.controlsHeight ??
                    C2Constants.subHeaderHeight),
                child: InkWell(
                  onTap: widget.config.disableModePicker == true
                      ? null
                      : widget.onTitlePressed,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: widget.config.centerAlignModePicker == true
                            ? 0
                            : 8),
                    child: C2PickerToggleButton(
                      isExpanded: widget.mode == DatePickerMode.year,
                      title: widget.title,
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
                    : widget.onTitlePressed,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          widget.config.centerAlignModePicker == true ? 0 : 8),
                  child: C2PickerToggleButton(
                    isExpanded: widget.mode == DatePickerMode.year,
                    title: widget.title,
                    config: widget.config,
                  ),
                ),
              ),
            ),
          if (widget.mode == DatePickerMode.day)
            // Give space for the prev/next month buttons that are underneath this row
            SizedBox(width: datePickerOffsetPadding),
        ],
      ),
    );
  }
}
