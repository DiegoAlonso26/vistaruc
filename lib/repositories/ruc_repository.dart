import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/ruc_model.dart';

class RucRepository {
  final String apiUrlExtended =
      'http://192.168.0.105:5000/api/ruc/extendida'; // Asegúrate de que sea el endpoint correcto

  Future<RucModel> fetchRucExtended(String rucNumber) async {
    try {
      final response = await http.get(Uri.parse('$apiUrlExtended/$rucNumber'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Si no hay datos válidos, lanzamos la excepción de RUC no existente
        if (data['razonSocial'] == null || data['razonSocial'].isEmpty) {
          throw Exception('RUC no existente');
        }

        return RucModel.fromJson(data); // Mapeamos a nuestro modelo
      } else if (response.statusCode == 404) {
        throw Exception('RUC no encontrado');
      } else {
        throw Exception('Error al obtener los datos del RUC');
      }
    } catch (error) {
      throw Exception('Error de conexión con el servidor: $error');
    }
  }
}
