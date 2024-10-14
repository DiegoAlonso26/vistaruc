class RucModel {
  final String ruc;
  final String razonSocial;
  final String direccion;
  final String estado;
  final String condicion;
  final String departamento;
  final String provincia;
  final String distrito;
  final String tipo;
  final String numeroTrabajadores;

  RucModel({
    required this.ruc,
    required this.razonSocial,
    required this.direccion,
    required this.estado,
    required this.condicion,
    required this.departamento,
    required this.provincia,
    required this.distrito,
    required this.tipo,
    required this.numeroTrabajadores,
  });

  factory RucModel.fromJson(Map<String, dynamic> json) {
    return RucModel(
      ruc: json['ruc'] ?? '',
      razonSocial: json['razonSocial'] ?? '',
      direccion: json['direccion'] ?? '',
      estado: json['estado'] ?? 'No disponible',
      condicion: json['condicion'] ?? 'No disponible',
      departamento: json['departamento'] ?? 'No disponible',
      provincia: json['provincia'] ?? 'No disponible',
      distrito: json['distrito'] ?? 'No disponible',
      tipo: json['tipo'] ?? 'No disponible',
      numeroTrabajadores: json['numeroTrabajadores'] ?? 'No disponible',
    );
  }
}
