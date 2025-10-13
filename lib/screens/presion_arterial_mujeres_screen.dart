import 'package:flutter/material.dart';

class PresionArterialMujeresScreen extends StatelessWidget {
  const PresionArterialMujeresScreen({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Presión Arterial Mujeres'),
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
                headingRowHeight: 50,
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
                ],
              ),
            ),

            const SizedBox(height: 20),

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
