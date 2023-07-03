part of '../calendar_date_picker2.dart';

/// Custom header to toggle the [CalendarDatePicker2Mode] for a date picker.
///
/// This appears above the calendar grid and allows the user to toggle the
/// [CalendarDatePicker2Mode] to display either the calendar view or the year list
/// or month view.
class _CalendarHeader extends StatefulWidget {
  const _CalendarHeader({
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
  final CalendarDatePicker2Mode mode;

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

class DatePickerModeToggleButtonState extends State<_CalendarHeader> {
  bool get shouldShowMonthPicker {
    if (widget.config.headerConfig.enableMonthPicker == true) {
      return true;
    }
    return false;
  }

  String get resolveYearLabel {
    if (shouldShowMonthPicker) {
      return widget.yearPickerLabelShort;
    }
    return widget.yearPickerLabelFull;
  }

  MainAxisAlignment get _resolvedHeaderAlign {
    if (widget.config.centerAlignModePicker == true) {
      MainAxisAlignment.center;
    }
    return widget.config.headerConfig.contentAlignX;
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
        mainAxisAlignment: _resolvedHeaderAlign,
        children: <Widget>[
          if (widget.mode == CalendarDatePicker2Mode.day &&
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
                    child: _PickerToggleButton(
                      isExpanded: widget.mode == CalendarDatePicker2Mode.year,
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
              child: SizedBox(
                height:
                    (widget.config.controlsHeight ?? Settings.subHeaderHeight),
                child: InkWell(
                  onTap: widget.config.disableModePicker == true
                      ? null
                      : widget.onMonthPickerTap,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: widget.config.centerAlignModePicker == true
                            ? 0
                            : 8),
                    child: _PickerToggleButton(
                      isExpanded: widget.mode == CalendarDatePicker2Mode.month,
                      title: widget.monthPickerLabel,
                      config: widget.config,
                    ),
                  ),
                ),
              ),
            ),
          if (widget.mode == CalendarDatePicker2Mode.day &&
              !widget.config.headerConfig.disableMonthPagination)
            // Give space for the prev/next month buttons that are underneath this row
            SizedBox(width: datePickerOffsetPadding),
        ],
      ),
    );
  }
}
