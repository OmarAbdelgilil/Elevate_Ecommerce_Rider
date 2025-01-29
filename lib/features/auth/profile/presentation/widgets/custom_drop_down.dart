import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final String label;
  final String value;
  final List<String>? items;
  final Function(String?)? onChanged;

  const CustomDropdown({
    super.key,
    required this.label,
    required this.value,
    this.items,
    this.onChanged,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  Color labelColor = Colors.grey[850]!;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: widget.value,
      onChanged: widget.onChanged,
      items: (widget.items ?? [widget.value]).map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[850]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[850]!),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        label: Text(
          widget.label,
          style: TextStyle(color: labelColor),
        ),
      ),
      icon: Icon(
        Icons.keyboard_arrow_down,
        color: Colors.grey[850],
      ),
    );
  }
}
