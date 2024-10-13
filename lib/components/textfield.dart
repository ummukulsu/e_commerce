import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final Widget? suffixIcon; // Add this to allow passing an icon
  final int? length;
  final bool? expand;
  final String? Function(String?)? validator;

  const InputField({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText = false, // Set default to false (only true for password fields)
    this.suffixIcon, // Optional suffix icon (use for password fields)
    this.length = 1,
    this.expand = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText, // This is for password input
        maxLines: length, // Limit to 1 line if it's a password field
        minLines: expand == true ? null : length, // Use 'expand' for multi-line control
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: suffixIcon, // Add suffix icon here (for toggling visibility)
        ),
        validator: validator,
      ),
    );
  }
}
