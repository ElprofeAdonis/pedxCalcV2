import 'package:flutter/material.dart';

class PresionArterialMujeresScreenJ extends StatelessWidget {
  const PresionArterialMujeresScreenJ({Key? key}) : super(key: key);

  // Definimos estilos y colores
  static const Color tableHeaderColor = Color.fromARGB(
    255,
    0,
    0,
    0,
  ); // Negro/Gris oscuro
  static const TextStyle headerTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: 12,
  );
  static const TextStyle cellTextStyle = TextStyle(fontSize: 12);
  static const Color subHeaderColor = Color.fromARGB(
    255,
    230,
    230,
    230,
  ); // Gris claro

  // Función para construir una celda de encabezado
  DataColumn _buildDataColumn(String label) {
    return DataColumn(
      label: SizedBox(
        width: 65, // Ancho fijo para manejar el scroll horizontal
        child: Text(
          label,
          style: headerTextStyle.copyWith(color: Colors.black),
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
      ),
    );
  }

  // Función para construir una celda de datos
  DataCell _buildDataCell(
    String text, [
    FontWeight fontWeight = FontWeight.normal,
  ]) {
    return DataCell(
      SizedBox(
        width: 65, // Mismo ancho que la columna
        child: Text(
          text,
          style: cellTextStyle.copyWith(fontWeight: fontWeight),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Presión Arterial Mujeres'),
        backgroundColor: tableHeaderColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Presión Arterial de Mujeres de 1 Semana a 18 Años de Edad',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: tableHeaderColor,
              ),
            ),
            const SizedBox(height: 15),

            // --- TABLA DE DATOS CON SCROLL HORIZONTAL ---
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowHeight: 60, // Aumenta la altura para las etiquetas
                columnSpacing: 10,
                dataRowHeight: 40,
                border: TableBorder.all(color: Colors.grey.shade400, width: 1),

                columns: [
                  _buildDataColumn('EDAD'),
                  _buildDataColumn('Mínima'),
                  _buildDataColumn('Media'),
                  _buildDataColumn('Máxima'),
                  _buildDataColumn('Mínima'),
                  _buildDataColumn('Media'),
                  _buildDataColumn('Máxima'),
                ],

                rows: [
                  // Sub-encabezado (simulado con una fila)
                  DataRow(
                    cells: [
                      _buildDataCell('', FontWeight.bold),
                      _buildDataCell(
                        'Presión arterial sistólica/diastólica',
                        FontWeight.bold,
                      ),
                      _buildDataCell('', FontWeight.bold),
                      _buildDataCell('', FontWeight.bold),
                      _buildDataCell('Presión arterial media', FontWeight.bold),
                      _buildDataCell('', FontWeight.bold),
                      _buildDataCell('', FontWeight.bold),
                    ],
                    color: MaterialStateProperty.all(subHeaderColor),
                  ),

                  // Datos (1 semana a 18 años)
                  _buildDataRowCells(
                    '<7 días',
                    '62.5 / 42.1',
                    '71.8 / 50.5',
                    '81.1 / 58.9',
                    '48.9',
                    '57.6',
                    '66.3',
                  ),
                  _buildDataRowCells(
                    '8-30 días',
                    '69.7 / 39.2',
                    '81.7 / 50.7',
                    '93.7 / 62.2',
                    '49.4',
                    '61.1',
                    '72.7',
                  ),
                  _buildDataRowCells(
                    '1-5 meses',
                    '79.8 / 38.9',
                    '92.0 / 49.5',
                    '104.2 / 60.1',
                    '52.5',
                    '63.7',
                    '74.8',
                  ),
                  _buildDataRowCells(
                    '6-11 meses',
                    '79.9 / 42.9',
                    '94.5 / 52.5',
                    '109.1 / 62.1',
                    '55.2',
                    '66.5',
                    '77.8',
                  ),
                  _buildDataRowCells(
                    '1 año',
                    '80.2 / 43.2',
                    '93.0 / 52.4',
                    '105.8 / 61.6',
                    '55.5',
                    '65.9',
                    '76.3',
                  ),
                  _buildDataRowCells(
                    '2 años',
                    '83.7 / 48.2',
                    '94.6 / 57.0',
                    '105.5 / 65.8',
                    '60.1',
                    '69.5',
                    '79.1',
                  ),
                  _buildDataRowCells(
                    '3 años',
                    '79.9 / 45.3',
                    '92.6 / 55.1',
                    '105.3 / 64.9',
                    '56.8',
                    '67.6',
                    '78.4',
                  ),
                  _buildDataRowCells(
                    '4 años',
                    '77.6 / 45.3',
                    '90.7 / 54.5',
                    '103.8 / 63.7',
                    '56.1',
                    '66.6',
                    '77.1',
                  ),
                  _buildDataRowCells(
                    '5 años',
                    '83.5 / 47.4',
                    '94.1 / 57.3',
                    '104.7 / 67.2',
                    '59.4',
                    '69.6',
                    '79.7',
                  ),
                  _buildDataRowCells(
                    '6 años',
                    '84.9 / 49.1',
                    '95.5 / 59.3',
                    '106.1 / 69.5',
                    '61.1',
                    '71.4',
                    '81.7',
                  ),
                  _buildDataRowCells(
                    '7 años',
                    '86.1 / 49.4',
                    '96.4 / 59.7',
                    '106.7 / 70.0',
                    '61.6',
                    '71.9',
                    '82.2',
                  ),
                  _buildDataRowCells(
                    '8 años',
                    '88.0 / 50.9',
                    '98.3 / 61.0',
                    '108.6 / 71.1',
                    '63.3',
                    '73.4',
                    '83.6',
                  ),
                  _buildDataRowCells(
                    '9 años',
                    '89.4 / 52.5',
                    '100.2 / 62.7',
                    '111.0 / 72.9',
                    '64.8',
                    '75.2',
                    '85.6',
                  ),
                  _buildDataRowCells(
                    '10 años',
                    '90.9 / 53.2',
                    '101.8 / 63.1',
                    '112.7 / 73.0',
                    '65.8',
                    '76.1',
                    '86.2',
                  ),
                  _buildDataRowCells(
                    '11 años',
                    '93.5 / 54.4',
                    '104.6 / 64.5',
                    '115.7 / 74.6',
                    '67.4',
                    '77.9',
                    '88.3',
                  ),
                  _buildDataRowCells(
                    '12 años',
                    '96.0 / 57.4',
                    '107.5 / 67.1',
                    '119.0 / 76.8',
                    '70.3',
                    '80.6',
                    '90.7',
                  ),
                  _buildDataRowCells(
                    '13 años',
                    '95.1 / 56.7',
                    '107.2 / 67.4',
                    '119.3 / 78.1',
                    '69.5',
                    '80.7',
                    '91.8',
                  ),
                  _buildDataRowCells(
                    '14 años',
                    '95.1 / 56.7',
                    '107.2 / 67.4',
                    '119.3 / 78.1',
                    '69.5',
                    '80.7',
                    '91.8',
                  ),
                  _buildDataRowCells(
                    '15 años',
                    '96.0 / 57.0',
                    '107.8 / 67.6',
                    '119.6 / 78.2',
                    '70.1',
                    '81.1',
                    '92.1',
                  ),
                  _buildDataRowCells(
                    '16 años',
                    '96.1 / 56.0',
                    '107.5 / 66.2',
                    '118.9 / 76.4',
                    '69.4',
                    '80.1',
                    '90.6',
                  ),
                  _buildDataRowCells(
                    '17 años',
                    '97.9 / 56.3',
                    '109.1 / 67.0',
                    '120.3 / 77.7',
                    '70.2',
                    '81.1',
                    '91.9',
                  ),
                  _buildDataRowCells(
                    '18 años',
                    '98.8 / 57.5',
                    '109.9 / 67.6',
                    '121.0 / 77.7',
                    '71.3',
                    '81.7',
                    '92.1',
                  ),
                  _buildDataRowCells(
                    '19 años',
                    '99.1 / 57.0',
                    '110.0 / 67.4',
                    '120.9 / 77.8',
                    '71.1',
                    '81.6',
                    '92.2',
                  ),
                ],
              ),
            ),

            // --- FIN DE LA TABLA ---
            const SizedBox(height: 20),

            // --- FÓRMULAS ---
            const Text(
              'Fórmulas de Presión Arterial',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              'Presión arterial media = (presión diastólica) + (presión sistólica - presión diastólica) / 3',
              style: cellTextStyle,
            ),
            const Text('o PAM = PD + (PS-PD)/3', style: cellTextStyle),
            const Text('o PAM = (PS + (2xPD)) / 3', style: cellTextStyle),
          ],
        ),
      ),
    );
  }

  // Helper para construir una fila de datos completa
  DataRow _buildDataRowCells(
    String edad,
    String sDMin,
    String sDMed,
    String sDMax,
    String pamMin,
    String pamMed,
    String pamMax,
  ) {
    return DataRow(
      cells: [
        _buildDataCell(edad, FontWeight.bold),
        _buildDataCell(sDMin),
        _buildDataCell(sDMed),
        _buildDataCell(sDMax),
        _buildDataCell(pamMin),
        _buildDataCell(pamMed),
        _buildDataCell(pamMax),
      ],
    );
  }
}
