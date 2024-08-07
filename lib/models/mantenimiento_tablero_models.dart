class MantenimientoTablero {
  final String? mantenimiento; // Campo para el valor del dropdown

  MantenimientoTablero({this.mantenimiento});

  // Método para crear una copia del objeto con posibles cambios
  MantenimientoTablero copyWith({String? mantenimiento}) {
    return MantenimientoTablero(
      mantenimiento: mantenimiento ?? this.mantenimiento,
    );
  }

  // Método para convertir el objeto a un mapa (útil para serialización)
  Map<String, dynamic> toMap() {
    return {
      'mantenimiento': mantenimiento,
    };
  }

  // Método para crear un objeto desde un mapa
  factory MantenimientoTablero.fromMap(Map<String, dynamic> map) {
    return MantenimientoTablero(
      mantenimiento: map['mantenimiento'],
    );
  }
}
