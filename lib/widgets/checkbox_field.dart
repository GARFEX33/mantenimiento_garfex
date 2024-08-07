import 'package:flutter/material.dart';

class CompactCheckboxField extends StatelessWidget {
  final String title;
  final bool value;
  final void Function(bool?) onChanged;

  const CompactCheckboxField({
    Key? key,
    required this.title,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: CheckboxListTile(
        title: Text(title, style: TextStyle(fontSize: 14.0)),
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}

