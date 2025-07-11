import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final bool obscureText;
  final bool alwaysShowLabel;

  const CustomTextField({
    super.key,
    required this.controller,
    this.label = '',
    this.obscureText = false,
    this.alwaysShowLabel = false, // 🔷 new flag
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscure;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final textColor = Colors.grey[800];
    final borderColor = isDark ? Colors.grey : Colors.black26;
    final floatingLabelColor = isDark ? Colors.white : Colors.black;

    return TextField(
      controller: widget.controller,
      obscureText: _obscure,
      style: TextStyle(color: textColor),
      decoration: InputDecoration(
        labelText: widget.label.isNotEmpty ? widget.label : " ",
        labelStyle: TextStyle(fontSize: 14, color: borderColor),
        floatingLabelStyle: TextStyle(
          fontSize: 14,
          color: floatingLabelColor,
          fontWeight: FontWeight.bold,
        ),
        floatingLabelBehavior: widget.alwaysShowLabel
            ? FloatingLabelBehavior.always
            : FloatingLabelBehavior.never, // 🔷 here
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: floatingLabelColor, width: 2),
        ),
        suffixIcon: widget.obscureText
            ? IconButton(
          icon: Icon(
            _obscure ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _obscure = !_obscure;
            });
          },
        )
            : null,
      ),
    );
  }
}
