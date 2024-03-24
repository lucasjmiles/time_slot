// ignore_for_file: always_use_package_imports

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeItemCard extends StatelessWidget {
  final bool isSelected;
  final bool isDisabled;
  final DateTime time;
  final String locale;
  final IconData? icon;
  final Color? selectedColor;
  final Color? unSelectedColor;
  final Color? disabledColor;
  final ValueChanged<DateTime> onChange;
  const TimeItemCard({
    super.key,
    required this.time,
    required this.onChange,
    required this.isSelected,
    required this.isDisabled,
    required this.locale,
    this.icon,
    this.selectedColor,
    this.unSelectedColor,
    this.disabledColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!isDisabled) {
          onChange(time);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: isDisabled
              ? Color(0xFF505050)
              : isSelected
                  ? selectedColor ?? Theme.of(context).primaryColor
                  : unSelectedColor ?? Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icon,
                    color: isDisabled
                        ? Color.fromARGB(255, 153, 153, 153)
                        : isSelected
                            ? Colors.white
                            : null,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
            Text(
              DateFormat.jm(locale).format(time),
              style: TextStyle(
                color: isDisabled
                    ? Color.fromARGB(255, 153, 153, 153)
                    : isSelected
                        ? Colors.white
                        : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
