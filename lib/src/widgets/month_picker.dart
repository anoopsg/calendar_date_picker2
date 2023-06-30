import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:calendar_date_picker2/src/widgets/month_picker_grid_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class C2MonthPicker extends StatefulWidget {
  /// Creates a year picker.
  const C2MonthPicker({
    required this.config,
    required this.selectedDates,
    required this.onChanged,
    required this.initialMonth,
    this.dragStartBehavior = DragStartBehavior.start,
    Key? key,
  }) : super(key: key);

  /// The calendar configurations
  final CalendarDatePicker2Config config;

  /// The currently selected dates.
  ///
  /// Selected dates are highlighted in the picker.
  final List<DateTime?> selectedDates;

  /// Called when the user picks a year.
  final ValueChanged<DateTime> onChanged;

  /// The initial month to display.
  final DateTime initialMonth;

  /// {@macro flutter.widgets.scrollable.dragStartBehavior}
  final DragStartBehavior dragStartBehavior;

  @override
  State<C2MonthPicker> createState() => _C2MonthPickerState();
}

class _C2MonthPickerState extends State<C2MonthPicker> {
  Widget _buildYearItem(BuildContext context, int index) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    final int indexToMonth = index + 1;
    final DateTime displayedDate = widget.initialMonth;

    final String monthLabel = getMonthLabelFromLocale(
      DateTime(displayedDate.year, indexToMonth),
      context,
    );

    final bool isSelected = indexToMonth == displayedDate.month;
    final bool isDisabled = displayedDate == widget.config.firstDate &&
        indexToMonth < widget.config.firstDate.month;

    const double decorationHeight = 36.0;
    const double decorationWidth = 72.0;

    final Color textColor;
    if (isSelected) {
      textColor = colorScheme.onPrimary;
    } else if (isDisabled) {
      textColor = colorScheme.onSurface.withOpacity(0.38);
    } else {
      textColor = colorScheme.onSurface.withOpacity(0.87);
    }
    TextStyle? itemStyle = widget.config.yearTextStyle ??
        textTheme.bodyLarge?.apply(color: textColor);
    if (isSelected) {
      itemStyle = widget.config.selectedYearTextStyle ?? itemStyle;
    }

    BoxDecoration? decoration;
    if (isSelected) {
      decoration = BoxDecoration(
        color: widget.config.selectedDayHighlightColor ?? colorScheme.primary,
        borderRadius: widget.config.yearBorderRadius ??
            BorderRadius.circular(decorationHeight / 2),
      );
    }

    Widget monthItem = widget.config.monthPickerBuilder?.call(
          month: indexToMonth,
          textStyle: itemStyle,
          decoration: decoration,
          isSelected: isSelected,
          isDisabled: isDisabled,
        ) ??
        Center(
          child: Container(
            decoration: decoration,
            height: decorationHeight,
            width: decorationWidth,
            child: Center(
              child: Semantics(
                selected: isSelected,
                button: true,
                child: Text(
                  monthLabel.toString(),
                  style: itemStyle,
                ),
              ),
            ),
          ),
        );

    if (isDisabled) {
      monthItem = ExcludeSemantics(
        child: monthItem,
      );
    } else {
      monthItem = InkWell(
        key: ValueKey<int>(indexToMonth),
        onTap: () => widget.onChanged(
          DateTime(
            displayedDate.year,
            indexToMonth,
          ),
        ),
        child: monthItem,
      );
    }

    return monthItem;
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    return Column(
      children: <Widget>[
        const Divider(),
        Expanded(
          child: C2MonthPickerGridView(
            config: widget.config,
            dragStartBehavior: widget.dragStartBehavior,
            itemBuilder: _buildYearItem,
            itemCount: 12,
          ),
        ),
        const Divider(),
      ],
    );
  }
}
