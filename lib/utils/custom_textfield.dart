import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final Function(String)? onChange;
  final TextEditingController controller;
  final bool obscureText;
  final bool? readOnly;
  final String label;
  final String? Function(String?)? validator;
  final String? errorText;
  final Widget? suffix; // Added suffix parameter

  const CustomTextField({
    super.key,
    required this.hint,
    this.onChange,
    this.obscureText = false,
    this.validator,
    required this.label,
    required this.controller,
    this.errorText,
    this.readOnly,
    this.suffix, // Added to constructor
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;
  Color labelColor = Colors.grey[850]!;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  String? _validate(String? value) {
    final error = widget.validator != null
        ? widget.validator!(value)
        : (value!.isEmpty ? 'This field is required' : null);
    if (error != null && error.isNotEmpty) {
      setState(() {
        labelColor = Colors.red;
      });
    }
    return error;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      validator: _validate,
      readOnly: widget.readOnly ?? false,
      onChanged: widget.onChange,
      controller: widget.controller,
      decoration: InputDecoration(
        errorText: widget.errorText,
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[850]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[850]!),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        label: Text(
          widget.label,
          style: TextStyle(color: labelColor),
        ),
        hintText: widget.hint,
        hintStyle: const TextStyle(color: Colors.grey),
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey[850],
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : widget.suffix, // Use custom suffix if not password field
      ),
    );
  }
}
