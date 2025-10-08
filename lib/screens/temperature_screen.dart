import 'package:flutter/material.dart';

class TemperatureScreen extends StatelessWidget {
  const TemperatureScreen({Key? key}) : super(key: key);

  // Definimos estilos y colores
  static const Color tableHeaderColor = Color.fromARGB(
    255,
    230,
    160,
    0,
  ); // Color naranja/ámbar para el encabezado
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
      children: [_buildHeaderCell('Method'), _buildHeaderCell('Normal')],
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
  TableRow _buildDataRow(String method, String normalRange) {
    return TableRow(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      children: [
        _buildDataCell(method, FontWeight.bold),
        _buildDataCell(normalRange),
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
        title: const Text('Temperature (Temperatura)'),
        backgroundColor: tableHeaderColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Rangos Normales de Temperatura (°C) por Método',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: tableHeaderColor,
              ),
            ),
            const SizedBox(height: 15),

            // --- TABLA DE DATOS ---
            Table(
              border: TableBorder.all(color: Colors.black, width: 1.0),
              columnWidths: const {
                0: FlexColumnWidth(1.5), // Ancho para Method
                1: FlexColumnWidth(1.0), // Ancho para Normal
              },
              children: [
                _buildHeaderRow(),
                _buildDataRow('Rectal', '36.6-38.0'),
                _buildDataRow('Tympanic', '35.8-38.0'),
                _buildDataRow('Oral', '35.5-37.5'),
                _buildDataRow('Axillary', '36.5-37.5'),
              ],
            ),

            // --- FIN DE LA TABLA ---
            const SizedBox(height: 20),

            // --- NOTAS ADICIONALES ---
            const Text(
              'Rangos no varían con la edad.',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(
                  context,
                ).style.copyWith(fontSize: 14),
                children: const <TextSpan>[
                  TextSpan(
                    text: 'Screening (Tamizaje): ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'axillary, temporal, tympanic (↓ precisión)\n',
                  ),
                  TextSpan(
                    text: 'Definitive (Definitiva): ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:
                        'rectal & oral (↑ reflejo de la temperatura central)\n',
                  ),
                  TextSpan(
                    text:
                        'Reference: CPS Position Statement on Temperature Measurement in Pediatrics (2015)',
                    style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
