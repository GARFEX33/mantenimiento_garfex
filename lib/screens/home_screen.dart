import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mantenimiento Garfex'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomButton(
              text: 'Mantenimiento a tableros',
              onPressed: () {
                Navigator.pushNamed(context, '/tableros');
              },
            ),
           const SizedBox(height: 20),
            CustomButton(
              text: 'Mantenimiento a transformadores',
              onPressed: () {
                Navigator.pushNamed(context, '/transformadores');
              },
            ),
          ],
        ),
      ),
    );
  }
}
