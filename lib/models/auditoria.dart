class Auditoria {
  int id;
  String accion;

  Auditoria({required this.id, required this.accion});

  // Convierte un objeto Auditoría a un Map para interactuar con la base de datos
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'accion': accion,
    };
  }

  // Crea una instancia de Auditoría a partir de un Map
  factory Auditoria.fromMap(Map<String, dynamic> map) {
    return Auditoria(
      id: map['id'],
      accion: map['accion'],
    );
  }
}
