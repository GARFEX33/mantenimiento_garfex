import 'package:flutter/material.dart';

class PhotoPicker extends StatelessWidget {
  final String label;
  final Future<void> Function() onPickImage;

  const PhotoPicker({Key? key, required this.label, required this.onPickImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          SizedBox(width: 16.0),
          ElevatedButton(
            onPressed: onPickImage,
            child: Text('Seleccionar'),
          ),
        ],
      ),
    );
  }
}
