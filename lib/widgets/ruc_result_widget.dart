import 'package:flutter/material.dart';
import '../models/ruc_model.dart';

class RucResultWidget extends StatelessWidget {
  final RucModel rucData;

  const RucResultWidget({required this.rucData});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoCard(
            context,
            icon: Icons.business,
            label: 'Razón Social:',
            content: rucData.razonSocial,
            color: Colors.blue,
          ),
          SizedBox(height: height * 0.02),
          _buildInfoCard(
            context,
            icon: Icons.location_on,
            label: 'Dirección:',
            content: rucData.direccion,
            color: Colors.red,
          ),
          SizedBox(height: height * 0.02),
          _buildInfoCard(
            context,
            icon: Icons.verified,
            label: 'Estado:',
            content: rucData.estado,
            color: Colors.green,
          ),
          SizedBox(height: height * 0.02),
          _buildInfoCard(
            context,
            icon: Icons.rule,
            label: 'Condición:',
            content: rucData.condicion,
            color: Colors.orange,
          ),
          SizedBox(height: height * 0.02),
          _buildInfoCard(
            context,
            icon: Icons.map,
            label: 'Departamento:',
            content: rucData.departamento,
            color: Colors.purple,
          ),
          SizedBox(height: height * 0.02),
          _buildInfoCard(
            context,
            icon: Icons.location_city,
            label: 'Provincia:',
            content: rucData.provincia,
            color: Colors.teal,
          ),
          SizedBox(height: height * 0.02),
          _buildInfoCard(
            context,
            icon: Icons.my_location,
            label: 'Distrito:',
            content: rucData.distrito,
            color: Colors.amber,
          ),
          SizedBox(height: height * 0.02),
          _buildInfoCard(
            context,
            icon: Icons.person,
            label: 'Tipo:',
            content: rucData.tipo,
            color: Colors.brown,
          ),
          SizedBox(height: height * 0.02),
          _buildInfoCard(
            context,
            icon: Icons.group,
            label: 'Número de Trabajadores:',
            content: rucData.numeroTrabajadores,
            color: Colors.cyan,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context,
      {required IconData icon,
      required String label,
      required String content,
      required Color color}) {
    final size = MediaQuery.of(context).size;
    final double width = size.width;

    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(width * 0.05),
        child: Column(
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: width * 0.08),
                SizedBox(width: width * 0.03),
                Flexible(
                  child: Text(
                    label,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: width * 0.05),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              content,
              style: TextStyle(fontSize: width * 0.04),
            ),
          ],
        ),
      ),
    );
  }
}
