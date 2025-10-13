import 'package:flutter/material.dart';

class PresionArterialHombresScreen extends StatelessWidget {
  const PresionArterialHombresScreen({super.key});

  // Definimos estilos y colores
  static const Color tableHeaderColor = Color.fromARGB(255, 0, 0, 0);
  static const TextStyle headerTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: 12,
  );
  static const TextStyle cellTextStyle = TextStyle(fontSize: 12);
  static const Color subHeaderColor = Color.fromARGB(255, 230, 230, 230);
  DataColumn _buildDataColumn(String label) {
    return DataColumn(
      label: SizedBox(
        width: 65,
        child: Text(
          label,
          style: headerTextStyle.copyWith(
            color: Color.fromARGB(255, 14, 113, 194),
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
      ),
    );
  }

  DataCell _buildDataCell(
    String text, [
    FontWeight fontWeight = FontWeight.normal,
  ]) {
    return DataCell(
      SizedBox(
        width: 75,
        child: Text(
          text,
          style: cellTextStyle.copyWith(fontWeight: fontWeight),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

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
        backgroundColor: Color.fromARGB(255, 14, 113, 194),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowHeight: 60,
                columnSpacing: 10,
                // ignore: deprecated_member_use
                dataRowHeight: 75,
                border: TableBorder.all(
                  color: const Color.fromARGB(255, 83, 232, 103),
                  width: 1,
                ),

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
                    color: WidgetStateProperty.all(subHeaderColor),
                  ),

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
                ],
              ),
            ),

            const SizedBox(height: 20),

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
