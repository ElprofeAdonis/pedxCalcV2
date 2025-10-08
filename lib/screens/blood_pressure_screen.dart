import 'package:flutter/material.dart';

class BloodPressureScreen extends StatelessWidget {
  const BloodPressureScreen({Key? key}) : super(key: key);

  // Definimos estilos y colores
  static const Color tableHeaderColor = Color.fromARGB(
    255,
    14,
    113,
    194,
  ); // Azul para el encabezado
  static const TextStyle headerTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: 14,
  );
  static const TextStyle cellTextStyle = TextStyle(fontSize: 14);

  // Helper para construir la celda de encabezado
  Widget _buildHeaderCell(String text, {int maxLines = 1}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      alignment: Alignment.center,
      child: Text(
        text,
        style: headerTextStyle,
        textAlign: TextAlign.center,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      ),
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

  // Fila especial para el encabezado de la presión arterial (2 niveles)
  TableRow _buildComplexHeader() {
    return TableRow(
      decoration: const BoxDecoration(color: tableHeaderColor),
      children: [
        _buildHeaderCell('Age', maxLines: 2),
        _buildHeaderCell('Systolic', maxLines: 2),
        _buildHeaderCell('Diastolic', maxLines: 2),
        _buildHeaderCell('Systolic Hypotension', maxLines: 2),
      ],
    );
  }

  // Fila especial para los sub-rangos de Birth
  TableRow _buildBirthSubRow(
    String ageDetail,
    String systolic,
    String diastolic,
    String hypotension, {
    Color color = Colors.white,
  }) {
    return TableRow(
      decoration: BoxDecoration(
        color: color,
        border: const Border(
          bottom: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      children: [
        // La columna Age es la única que tiene sub-divisiones
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
          alignment: Alignment.center,
          child: Text(
            ageDetail,
            style: cellTextStyle.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        _buildDataCell(systolic),
        _buildDataCell(diastolic),
        _buildDataCell(hypotension),
      ],
    );
  }

  // Fila estándar para los rangos por edad
  TableRow _buildDataRow(
    String age,
    String systolic,
    String diastolic,
    String hypotension,
  ) {
    return TableRow(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      children: [
        _buildDataCell(age, FontWeight.bold),
        _buildDataCell(systolic),
        _buildDataCell(diastolic),
        _buildDataCell(hypotension),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blood Pressure (Presión Arterial)'),
        backgroundColor: tableHeaderColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Rangos Normales y de Hipotensión por Edad (mmHg)',
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
                0: FlexColumnWidth(1.5), // Age
                1: FlexColumnWidth(1.0), // Systolic
                2: FlexColumnWidth(1.0), // Diastolic
                3: FlexColumnWidth(2.0), // Systolic Hypotension
              },
              children: [
                _buildComplexHeader(),
                // Nota: Usamos filas separadas para los sub-rangos de Birth
                _buildDataRow('Birth (12 h) <1 kg', '39-59', '16-36', '<40-50'),
                _buildDataRow('Birth (12 h) 3 kg', '60-76', '31-45', '<50'),

                _buildDataRow('Neonate (96 h)', '67-84', '35-53', '<60'),
                _buildDataRow('Infant (1-12 mos)', '72-104', '37-56', '<70'),

                // Estos rangos tienen 'N/A' en la tabla original o se aplica la fórmula
                _buildDataRow('Toddler (1-2 y)', '86-106', '42-63', 'N/A'),
                _buildDataRow(
                  'Preschool (3-5 y)',
                  '89-112',
                  '46-72',
                  '<70 + (age in years × 2)',
                ),
                _buildDataRow('School-age (6-9 y)', '97-115', '57-76', 'N/A'),
                _buildDataRow(
                  'Preadolescent (10-11 y)',
                  '102-120',
                  '61-80',
                  'N/A',
                ),

                _buildDataRow(
                  'Adolescent (12-15 y)',
                  '110-131',
                  '64-83',
                  '<90',
                ),
              ],
            ),

            // La fila de Birth tuvo que ser simplificada para encajar en el widget Table
            // La información de <1kg y 3kg se muestra en las celdas de Systolic/Diastolic/Hypotension.
            const SizedBox(height: 20),
            const Text(
              'Nota: El umbral de hipotensión sistólica para las edades preescolar se calcula: 70 + (edad en años × 2).',
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
