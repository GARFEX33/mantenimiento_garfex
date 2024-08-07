import 'package:flutter/material.dart';

class DateField extends StatelessWidget {
  final TextEditingController controller;
  final Future<void> Function(BuildContext) selectDate;

  const DateField({Key? key, required this.controller, required this.selectDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: 'Fecha',
          suffixIcon: IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () => selectDate(context),
          ),
        ),
        readOnly: true,
      ),
    );
  }
}
