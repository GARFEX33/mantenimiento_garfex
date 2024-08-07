import 'package:flutter/material.dart';

class DropdownField extends StatelessWidget {
  final String labelText;
  final List<String> items;
  final String? selectedValue;
  final String? errorMessage;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;

  const DropdownField({
    super.key,
    required this.labelText,
    required this.items,
    this.selectedValue,
    this.errorMessage,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: labelText,
          enabledBorder: border,
          focusedBorder: border.copyWith(
            borderSide: BorderSide(color: colors.primary),
          ),
          errorBorder: border.copyWith(
            borderSide: BorderSide(color: Colors.red.shade800),
          ),
          focusedErrorBorder: border.copyWith(
            borderSide: BorderSide(color: Colors.red.shade800),
          ),
          isDense: true,
          errorText: errorMessage,
        ),
        value: selectedValue,
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
