lib/
|- blocs/
|  |- home/
|     |- home_bloc.dart
|     |- home_event.dart
|     |- home_state.dart
|- screens/
|  |- home_screen.dart
|- widgets/
|  |- custom_button.dart
|- main.dart


mantenimiento_garfex/
├── lib/
│   └── main.dart
├── .env
│ 
├── pubspec.yaml


##Formulario Tableros

1. **Campos del Formulario**:
   - ¿Cuáles son todos los campos que se deben incluir en el formulario?
        - Mantenimiento -> Dropdown Lista de mantenimientos disponibles desde tabla supabase.
        - Tablero: String
        - Fecha:  Date
        - Fases y neutro Identificados: Seleccion Si o No 
        - Conductores peinados: Seleccion Si o No
        - Protecciones de acuerdo al calibre del conductor: Seleccion Si o No
        - Directorio de circuitos: Seleccion Si o No
        - Tablero con barra de tierras: Seleccion Si o No
        - Tablero con barra de neutros: Seleccion Si o No
        - Tablero aterrizado: Seleccion Si o No
        - AB: float min 0, caracteres maximo 8
        - AC: float min 0, caracteres maximo 8
        - BC: float min 0, caracteres maximo 8
        - A: float min 0, caracteres maximo 8
        - B: float min 0, caracteres maximo 8
        - C: float min 0, caracteres maximo 8
        - Neutro: float min 0, caracteres maximo 8
        - Tierra fisica: float min 0, caracteres maximo 8
        - Foto Antes: adjunto imagen 
        - Foto Despues: adjunto imagen
        - Termo Antes: String 15 caracteres maximo
        - Termo Despues: String 15 caracteres maximo
        - Observaciones: string multilinea

2. **Validaciones**:
   - ¿Qué validaciones se deben aplicar a cada campo?
        - cuando sea float, validar que sea solo numeros.
        -adjuntar imagen solo deben ser imagenes.
   - ¿Algún campo es opcional o todos son obligatorios?
        - Todo obligatorio

3. **Manejo de Estado**:
   - ¿Cómo deseas manejar los estados del formulario (por ejemplo, cargando, éxito, error)?
        - Formulario enviado cargando y entragado con existo en base de dato.
   - ¿Qué mensajes o acciones deben ocurrir en cada estado?
   una barra de loading de la foto.

4. **Envío del Formulario**:
   - ¿A dónde se enviará la información del formulario?
    - se enviara a supabasae a la tabla de mantenimiento_tableros.
   - ¿Qué debe suceder después de que se envíe el formulario (navegación, mensaje de éxito, etc.)?
   navegar al home, si al cargar la imagen tiene un tiempo mostrar una barra de loading y avance, al terminar mostrar mensaje que indique que se subio con exito cuando tengamos respuesta exitosa de supabase.

5. **Interfaz de Usuario**:
   - ¿Hay algún diseño específico o estilo que deseas aplicar al formulario?
    - Necesitamos basar en el thema y colores de la aplicacion(Si no lo sabes solicitame el codigo), necesito que sea practico pero a la vez estetico.
   - ¿Necesitas algún componente personalizado para los campos del formulario?
    - diseña componentes personalizados de acuerdo a tu cratividad usa las tecnicas UX/UI. (Si necesitas informacion solicitame mas)


