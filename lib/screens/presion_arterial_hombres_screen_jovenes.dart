import 'package:flutter/material.dart';

class PresionArterialHombresScreenJ extends StatelessWidget {
  const PresionArterialHombresScreenJ({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Presión Arterial Hombres'),
        backgroundColor: tableHeaderColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Presión Arterial de Hombres de 1 Semana a 18 Años de Edad',
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
                    '63.1 / 42.2',
                    '72.5 / 51.1',
                    '82.3 / 60.0',
                    '49.2',
                    '58.3',
                    '67.4',
                  ),
                  _buildDataRowCells(
                    '8-30 días',
                    '79.9 / 39.1',
                    '82.0 / 50.3',
                    '93.1 / 61.5',
                    '52.7',
                    '60.9',
                    '72.1',
                  ),
                  _buildDataRowCells(
                    '1-5 meses',
                    '81.8 / 36.6',
                    '93.0 / 47.8',
                    '105.9 / 59.0',
                    '51.1',
                    '62.9',
                    '74.6',
                  ),
                  _buildDataRowCells(
                    '6-11 meses',
                    '80.6 / 43.3',
                    '95.4 / 53.3',
                    '110.2 / 63.2',
                    '55.8',
                    '67.3',
                    '78.9',
                  ),
                  _buildDataRowCells(
                    '1 año',
                    '81.4 / 44.0',
                    '93.6 / 53.0',
                    '105.8 / 62.0',
                    '56.5',
                    '66.5',
                    '76.6',
                  ),
                  _buildDataRowCells(
                    '2 años',
                    '84.2 / 47.9',
                    '95.0 / 56.5',
                    '105.8 / 65.1',
                    '60.1',
                    '69.3',
                    '78.7',
                  ),
                  _buildDataRowCells(
                    '3 años',
                    '80.8 / 44.9',
                    '93.5 / 54.3',
                    '106.2 / 63.7',
                    '56.9',
                    '67.4',
                    '77.9',
                  ),
                  _buildDataRowCells(
                    '4 años',
                    '78.7 / 44.5',
                    '90.8 / 53.9',
                    '102.9 / 63.3',
                    '55.9',
                    '66.2',
                    '76.5',
                  ),
                  _buildDataRowCells(
                    '5 años',
                    '83.4 / 47.7',
                    '94.3 / 57.4',
                    '105.2 / 67.1',
                    '59.6',
                    '69.7',
                    '79.8',
                  ),
                  _buildDataRowCells(
                    '6 años',
                    '86.1 / 48.5',
                    '96.2 / 58.5',
                    '106.3 / 68.5',
                    '61.1',
                    '71.1',
                    '81.1',
                  ),
                  _buildDataRowCells(
                    '7 años',
                    '87.4 / 50.5',
                    '97.8 / 60.7',
                    '108.2 / 70.9',
                    '62.8',
                    '73.1',
                    '83.3',
                  ),
                  _buildDataRowCells(
                    '8 años',
                    '88.7 / 51.6',
                    '98.7 / 61.6',
                    '108.7 / 71.6',
                    '64.1',
                    '74.1',
                    '84.1',
                  ),
                  _buildDataRowCells(
                    '9 años',
                    '90.6 / 52.6',
                    '100.7 / 62.7',
                    '110.1 / 72.6',
                    '65.3',
                    '75.3',
                    '85.1',
                  ),
                  _buildDataRowCells(
                    '10 años',
                    '91.4 / 54.1',
                    '101.9 / 63.6',
                    '112.4 / 73.1',
                    '66.5',
                    '76.4',
                    '86.2',
                  ),
                  _buildDataRowCells(
                    '11 años',
                    '92.4 / 53.6',
                    '103.2 / 63.4',
                    '114.0 / 73.2',
                    '66.5',
                    '76.7',
                    '86.8',
                  ),
                  _buildDataRowCells(
                    '12 años',
                    '95.0 / 55.8',
                    '105.8 / 65.6',
                    '116.6 / 75.4',
                    '68.9',
                    '79.1',
                    '88.9',
                  ),
                  _buildDataRowCells(
                    '13 años',
                    '95.2 / 54.7',
                    '107.8 / 65.5',
                    '120.4 / 76.3',
                    '68.2',
                    '79.6',
                    '91.1',
                  ),
                  _buildDataRowCells(
                    '14 años',
                    '95.2 / 54.7',
                    '107.8 / 65.5',
                    '120.4 / 76.3',
                    '68.2',
                    '79.6',
                    '91.1',
                  ),
                  _buildDataRowCells(
                    '15 años',
                    '97.2 / 55.3',
                    '110.1 / 66.2',
                    '123.0 / 77.1',
                    '69.3',
                    '80.8',
                    '92.4',
                  ),
                  _buildDataRowCells(
                    '16 años',
                    '100.5 / 55.2',
                    '113.0 / 66.2',
                    '125.5 / 77.2',
                    '70.3',
                    '81.8',
                    '93.3',
                  ),
                  _buildDataRowCells(
                    '17 años',
                    '102.4 / 56.3',
                    '114.7 / 67.4',
                    '127.0 / 78.5',
                    '71.7',
                    '83.2',
                    '94.7',
                  ),
                  _buildDataRowCells(
                    '18 años',
                    '105.4 / 59.8',
                    '117.6 / 70.2',
                    '129.8 / 80.6',
                    '75.1',
                    '86.1',
                    '97.1',
                  ),
                  _buildDataRowCells(
                    '19 años',
                    '106.3 / 61.8',
                    '118.7 / 71.9',
                    '131.1 / 82.0',
                    '76.6',
                    '87.5',
                    '98.4',
                  ),
                ],
              ),
            ),

            // --- FIN DE LA TABLA ---
            const SizedBox(height: 20),

            // --- NOTAS Y FÓRMULAS ---
            const Text(
              'Nota: no se programa el intervalo de tiempo en que se toma la presión arterial media de acuerdo con las condiciones del paciente, de 15 minutos para los casos graves a 24 horas para los estables. Cuando la presión arterial media baje por debajo del nivel mínimo, se debe iniciar la infusión de cristaloides, según el protocolo. Cuando la presión arterial media tiende a elevarse por encima de la máxima normal, hay que suspender la infusión de líquidos para evitar la sobrecarga de volumen.',
              style: cellTextStyle,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 15),
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
}
