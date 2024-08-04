import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'router/routers.dart';
import 'config/theme.dart';
import 'config/supabase_config.dart';
import 'blocs/home/home_bloc.dart';
import 'blocs/formulario_tableros/formulario_tableros_bloc.dart'; // Añadir esta línea

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Ruta absoluta al archivo .env
  const envPath = '/Users/gfx/Documents/mantenimiento_garfex/.env';
  await dotenv.load(fileName: envPath);
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
        BlocProvider<FormularioTablerosBloc>( // Añadir esta sección
          create: (context) => FormularioTablerosBloc()..add(CargarMantenimientos()),
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
