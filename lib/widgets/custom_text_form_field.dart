import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final ValueChanged<String> onChanged;
  final String? errorMessage;

  const CustomTextFormField({
    Key? key,
    required this.label,
    this.obscureText = false,
    required this.onChanged,
    this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        errorText: errorMessage,
      ),
    );
  }
}
