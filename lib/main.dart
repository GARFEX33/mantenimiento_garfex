import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'router/routers.dart';
import 'config/theme.dart';
import 'config/supabase_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dotenv.load(fileName: '.env');
    print('Archivo .env cargado correctamente.');
  } catch (e) {
    print('Error al cargar el archivo .env: $e');
  }
  await initializeSupabase();

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mantenimiento Garfex',
      theme: appTheme,
      onGenerateRoute: generateRoute,
      initialRoute: '/',
    );
  }
}
