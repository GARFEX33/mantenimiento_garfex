import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'router/routers.dart';
import 'config/theme.dart';
import 'config/supabase_config.dart';
import 'blocs/home/home_bloc.dart';
import 'blocs/formulario_tableros/formulario_tableros_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dotenv.load(fileName: '.env');
    print('Archivo .env cargado correctamente.');
  } catch (e) {
    print('Error al cargar el archivo .env: $e');
  }
  await initializeSupabase();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
        BlocProvider<FormularioTablerosBloc>(
          create: (context) => FormularioTablerosBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Mantenimiento Garfex',
        theme: appTheme,
        onGenerateRoute: generateRoute,
        initialRoute: '/',
      ),
    );
  }
}
