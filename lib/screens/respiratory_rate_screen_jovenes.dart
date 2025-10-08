import 'package:flutter/material.dart';

class RespiratoryRateScreenJ extends StatelessWidget {
  const RespiratoryRateScreenJ({Key? key}) : super(key: key);

  // Definimos estilos y colores
  static const Color tableHeaderColor = Color.fromARGB(
    255,
    30,
    130,
    45,
  ); // Color verde oscuro para el encabezado
  static const TextStyle headerTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: 14,
  );
  static const TextStyle cellTextStyle = TextStyle(fontSize: 14);

  // Helper para construir el encabezado de la tabla
  TableRow _buildHeaderRow() {
    return TableRow(
      decoration: const BoxDecoration(color: tableHeaderColor),
      children: [_buildHeaderCell('Age'), _buildHeaderCell('Normal')],
    );
  }

  // Helper para construir una celda de encabezado
  Widget _buildHeaderCell(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      alignment: Alignment.center,
      child: Text(text, style: headerTextStyle, textAlign: TextAlign.center),
    );
  }

  // Helper para construir una fila de datos
  TableRow _buildDataRow(String age, String normalRate) {
    return TableRow(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      children: [
        _buildDataCell(age, FontWeight.bold),
        _buildDataCell(normalRate),
      ],
    );
  }

  // Helper para construir una celda de datos
  Widget _buildDataCell(
    String text, [
    FontWeight fontWeight = FontWeight.normal,
  ]) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
      alignment: Alignment.center,
      child: Text(
        text,
        style: cellTextStyle.copyWith(fontWeight: fontWeight),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Frecuencia Respiratoria (respiraciones/min)'),
        backgroundColor: tableHeaderColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- TABLA DE DATOS ---
            Table(
              border: TableBorder.all(color: Colors.black, width: 1.0),
              columnWidths: const {
                0: FlexColumnWidth(1.5), // Ancho para la columna Age
                1: FlexColumnWidth(1.0), // Ancho para la columna Normal
              },
              children: [
                _buildHeaderRow(),
                _buildDataRow('Infant (<1 y)', '30-53'),
                _buildDataRow('Toddler (1-2 y)', '22-37'),
                _buildDataRow('Preschool (3-5 y)', '20-28'),
                _buildDataRow('School-age (6-11 y)', '18-25'),
                _buildDataRow('Adolescent (12-15 y)', '12-20'),
              ],
            ),

            // --- FIN DE LA TABLA ---
            const SizedBox(height: 20),
            const Text(
              'Fuente: Guías de Referencia Pediátrica.',
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
