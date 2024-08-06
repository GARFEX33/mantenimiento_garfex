import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mantenimiento_garfex/widgets/custom_button.dart';
import 'package:mantenimiento_garfex/widgets/loading_indicator.dart';

class TableroFormScreen extends StatefulWidget {
  @override
  _TableroFormScreenState createState() => _TableroFormScreenState();
}

class _TableroFormScreenState extends State<TableroFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  late TextEditingController _dateController;

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController(
        text: DateFormat('yyyy-MM-dd').format(DateTime.now()));
  }

  Future<void> _pickImage(bool isBefore) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      // Aquí agregar la lógica para almacenar la imagen
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
      // Aquí agregar la lógica para almacenar la fecha seleccionada
    }
  }

  @override
  Widget build(BuildContext context) {
    final mantenimientos = ['Mantenimiento 1', 'Mantenimiento 2'];
    String? selectedMantenimiento = mantenimientos[0];
    String tablero = '';
    bool fasesYNeutroIdentificados = false;
    bool conductoresPeinados = false;
    bool proteccionesDeAcuerdoAlCalibre = false;
    bool directorioDeCircuitos = false;
    bool tableroConBarraDeTierras = false;
    bool tableroConBarraDeNeutros = false;
    bool tableroAterrizado = false;
    double ab = 0.0;
    double ac = 0.0;
    double bc = 0.0;
    double an = 0.0;
    double bn = 0.0;
    double cn = 0.0;
    double a = 0.0;
    double b = 0.0;
    double c = 0.0;
    double neutro = 0.0;
    double tierraFisica = 0.0;
    String termoAntes = '';
    String termoDespues = '';
    String observaciones = '';

    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario Tableros'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildSectionTitle(context, 'Datos del Servicio y Tablero'),
              _buildDropdownField(
                  context, 'Mantenimiento', mantenimientos, (value) {
                setState(() {
                  selectedMantenimiento = value;
                });
              }),
              SizedBox(height: 8.0),
              _buildTextField(context, 'Tablero', (value) {
                setState(() {
                  tablero = value;
                });
              }),
              SizedBox(height: 8.0),
              _buildDateField(context, _dateController, _selectDate),
              _buildDivider(),
              _buildSectionTitle(context, 'Tablero Check List'),
              _buildCompactCheckboxField(context,
                  'Fases y neutro identificados', fasesYNeutroIdentificados,
                  (value) {
                setState(() {
                  fasesYNeutroIdentificados = value!;
                });
              }),
              _buildCompactCheckboxField(
                  context, 'Conductores peinados', conductoresPeinados, (value) {
                setState(() {
                  conductoresPeinados = value!;
                });
              }),
              _buildCompactCheckboxField(context,
                  'Protecciones de acuerdo al calibre del conductor', proteccionesDeAcuerdoAlCalibre,
                  (value) {
                setState(() {
                  proteccionesDeAcuerdoAlCalibre = value!;
                });
              }),
              _buildCompactCheckboxField(
                  context, 'Directorio de circuitos', directorioDeCircuitos,
                  (value) {
                setState(() {
                  directorioDeCircuitos = value!;
                });
              }),
              _buildCompactCheckboxField(context, 'Tablero con barra de tierras',
                  tableroConBarraDeTierras, (value) {
                setState(() {
                  tableroConBarraDeTierras = value!;
                });
              }),
              _buildCompactCheckboxField(context, 'Tablero con barra de neutros',
                  tableroConBarraDeNeutros, (value) {
                setState(() {
                  tableroConBarraDeNeutros = value!;
                });
              }),
              _buildCompactCheckboxField(
                  context, 'Tablero aterrizado', tableroAterrizado, (value) {
                setState(() {
                  tableroAterrizado = value!;
                });
              }),
              _buildDivider(),
              _buildSectionTitle(context, 'Voltaje'),
              _buildVoltageGrid(context),
              _buildDivider(),
              _buildSectionTitle(context, 'Corrientes'),
              _buildCurrentGrid(context),
              _buildDivider(),
              _buildSectionTitle(context, 'Fotografías'),
              _buildPhotoPicker(context, 'Foto Antes',
                  () => _pickImage(true)),
              SizedBox(height: 8.0),
              _buildPhotoPicker(context, 'Foto Después',
                  () => _pickImage(false)),
              _buildDivider(),
              _buildSectionTitle(context, 'Termografía'),
              _buildTextField(context, 'Termo Antes', (value) {
                setState(() {
                  termoAntes = value;
                });
              }),
              SizedBox(height: 8.0),
              _buildTextField(context, 'Termo Después', (value) {
                setState(() {
                  termoDespues = value;
                });
              }),
              SizedBox(height: 8.0),
              _buildTextField(context, 'Observaciones', (value) {
                setState(() {
                  observaciones = value;
                });
              }, maxLines: 3),
              SizedBox(height: 16.0),
              CustomButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Aquí agregar la lógica para enviar el formulario
                  }
                },
                text: 'Enviar',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }

  Widget _buildDropdownField(BuildContext context, String labelText,
      List<String> items, void Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(labelText: labelText),
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
        validator: (value) =>
            value == null ? 'Este campo es obligatorio' : null,
      ),
    );
  }

  Widget _buildTextField(BuildContext context, String labelText,
      void Function(String) onChanged,
      {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: TextFormField(
        decoration: InputDecoration(labelText: labelText),
        keyboardType:
            labelText.contains('Voltaje') || labelText.contains('Corrientes')
                ? TextInputType.number
                : TextInputType.text,
        onChanged: onChanged,
        validator: (value) =>
            value!.isEmpty ? 'Este campo es obligatorio' : null,
        maxLines: maxLines,
      ),
    );
  }

  Widget _buildDateField(BuildContext context, TextEditingController controller,
      Future<void> Function(BuildContext) selectDate) {
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

  Widget _buildCompactCheckboxField(BuildContext context, String title,
      bool value, void Function(bool?) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: CheckboxListTile(
        title: Text(title, style: TextStyle(fontSize: 14.0)),
        value: value,
        onChanged: onChanged,
        controlAffinity: ListTileControlAffinity.trailing,
        contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
        dense: true,
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(height: 24.0);
  }

  Widget _buildPhotoPicker(
      BuildContext context, String title, void Function() onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        title: Text(title),
        trailing: IconButton(
          icon: Icon(Icons.photo),
          onPressed: onPressed,
        ),
      ),
    );
  }

  Widget _buildVoltageGrid(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: _buildTextField(context, 'AB', (value) {
              setState(() {
                // Aquí agregar la lógica para almacenar el valor
              });
            })),
            SizedBox(width: 8.0),
            Expanded(
                child: _buildTextField(context, 'BC', (value) {
              setState(() {
                // Aquí agregar la lógica para almacenar el valor
              });
            })),
            SizedBox(width: 8.0),
            Expanded(
                child: _buildTextField(context, 'AC', (value) {
              setState(() {
                // Aquí agregar la lógica para almacenar el valor
              });
            })),
          ],
        ),
        SizedBox(height: 8.0),
        Row(
          children: [
            Expanded(
                child: _buildTextField(context, 'AN', (value) {
              setState(() {
                // Aquí agregar la lógica para almacenar el valor
              });
            })),
            SizedBox(width: 8.0),
            Expanded(
                child: _buildTextField(context, 'BN', (value) {
              setState(() {
                // Aquí agregar la lógica para almacenar el valor
              });
            })),
            SizedBox(width: 8.0),
            Expanded(
                child: _buildTextField(context, 'CN', (value) {
              setState(() {
                // Aquí agregar la lógica para almacenar el valor
              });
            })),
          ],
        ),
      ],
    );
  }

  Widget _buildCurrentGrid(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: _buildTextField(context, 'A', (value) {
              setState(() {
                // Aquí agregar la lógica para almacenar el valor
              });
            })),
            SizedBox(width: 8.0),
            Expanded(
                child: _buildTextField(context, 'B', (value) {
              setState(() {
                // Aquí agregar la lógica para almacenar el valor
              });
            })),
            SizedBox(width: 8.0),
            Expanded(
                child: _buildTextField(context, 'C', (value) {
              setState(() {
                // Aquí agregar la lógica para almacenar el valor
              });
            })),
          ],
        ),
        SizedBox(height: 8.0),
        Row(
          children: [
            Expanded(
                child: _buildTextField(context, 'Neutro', (value) {
              setState(() {
                // Aquí agregar la lógica para almacenar el valor
              });
            })),
            SizedBox(width: 8.0),
            Expanded(
                child: _buildTextField(context, 'Tierra física', (value) {
              setState(() {
                // Aquí agregar la lógica para almacenar el valor
              });
            })),
          ],
        ),
      ],
    );
  }
}
