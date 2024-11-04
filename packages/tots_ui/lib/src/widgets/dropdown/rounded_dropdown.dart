// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class RoundedDropdown extends StatefulWidget {
  final List<String> items;
  final String selectedValue;
  final void Function(String) onChanged;
  final Color containerColor;
  final double borderRadius;
  final TextStyle textStyle;
  final TextStyle textStyleDropdown;
  final double width;
  final double height;
  final Color dropdownColor;
  final Color? borderColor;
  final double dropdownBorderRadius;
  final Color? dropdownBorderColor;
  final Widget? icons;
  final Color? textColors;

  const RoundedDropdown({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    this.containerColor = Colors.white,
    this.borderRadius = 5.0,
    this.borderColor = Colors.grey,
    this.textStyle = const TextStyle(color: Colors.black),
    this.width = 150.0,
    this.height = 50.0,
    this.textStyleDropdown = const TextStyle(color: Colors.black),
    this.dropdownColor = Colors.white,
    this.dropdownBorderRadius = 5.0,
    this.dropdownBorderColor = Colors.grey,
    this.icons,
    this.textColors,
  });

  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<RoundedDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: widget.containerColor,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border: Border.all(color: widget.borderColor!, width: 2),
      ),
      child: PopupMenuButton<String>(
        onSelected: (String newValue) {
          widget.onChanged(newValue);
        },
        itemBuilder: (BuildContext context) {
          return List.generate(widget.items.length, (index) {
            final icon = widget.icons;
            final textColor = widget.textColors;

            return PopupMenuItem<String>(
              value: widget.items[index],
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: widget.dropdownBorderColor!, width: 1.5)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 24, height: 24, child: icon),
                        const SizedBox(width: 8),
                        Text(
                          widget.items[index],
                          style: widget.textStyleDropdown.copyWith(
                            color: textColor ?? widget.textStyleDropdown.color,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            );
          });
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.dropdownBorderRadius),
          side: BorderSide(color: widget.dropdownBorderColor ?? Colors.grey),
        ),
        color: widget.dropdownColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.selectedValue, style: widget.textStyle),
            Icon(Icons.keyboard_arrow_down, color: widget.borderColor),
          ],
        ),
      ),
    );
  }
}
