import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

class PickerToggleButton extends StatefulWidget {
  const PickerToggleButton({
    Key? key,
    required this.isExpanded,
    required this.title,
    required this.config,
  }) : super(key: key);

  final bool isExpanded;
  final String title;
  final CalendarDatePicker2Config config;

  @override
  State<PickerToggleButton> createState() => _PickerButtonState();
}

class _PickerButtonState extends State<PickerToggleButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      value: widget.isExpanded ? 0.5 : 0,
      upperBound: 0.5,
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  void didUpdateWidget(PickerToggleButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isExpanded == widget.isExpanded) {
      return;
    }

    if (widget.isExpanded) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Color controlColor = colorScheme.onSurface.withOpacity(0.60);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(
          child: Text(
            widget.title,
            overflow: TextOverflow.ellipsis,
            style: widget.config.controlsTextStyle ??
                textTheme.titleSmall?.copyWith(
                  color: controlColor,
                ),
          ),
        ),
        widget.config.disableModePicker == true
            ? const SizedBox()
            : RotationTransition(
                turns: _controller,
                child: widget.config.customModePickerIcon ??
                    Icon(
                      Icons.arrow_drop_down,
                      color: widget.config.controlsTextStyle?.color ??
                          controlColor,
                    ),
              ),
      ],
    );
  }
}
