// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class DropdownWidget extends StatefulWidget {
  final List<String> items;
  final String selectedValue;
  final void Function(String) onChanged;
  final String label;
  final Color containerColor;
  final double borderRadius;
  final TextStyle textStyle;
  final double width;
  final double height;

  const DropdownWidget({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    required this.label,
    this.containerColor = Colors.white,
    this.borderRadius = 5.0,
    this.textStyle = const TextStyle(color: Colors.black),
    this.width = 150.0,
    this.height = 50.0,
  });

  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: widget.containerColor,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border: Border.all(color: Colors.grey),
      ),
      child: DropdownButton<String>(
        value: widget.selectedValue,
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 24,
        elevation: 16,
        dropdownColor: Colors.white,
        style: widget.textStyle,
        underline: Container(
          height: 0,
          color: Colors.transparent,
        ),
        onChanged: (String? newValue) {
          if (newValue != null) {
            widget.onChanged(newValue);
          }
        },
        items: widget.items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: widget.textStyle),
          );
        }).toList(),
      ),
    );
  }
}
