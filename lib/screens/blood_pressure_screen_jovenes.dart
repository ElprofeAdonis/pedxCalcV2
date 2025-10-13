import 'package:flutter/material.dart';

class BloodPressureScreenJ extends StatelessWidget {
  const BloodPressureScreenJ({super.key});

  static const Color tableHeaderColor = Color.fromARGB(255, 14, 113, 194);
  static const TextStyle headerTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: 14,
  );
  static const TextStyle cellTextStyle = TextStyle(fontSize: 14);

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

  TableRow _buildComplexHeader() {
    return TableRow(
      decoration: const BoxDecoration(color: tableHeaderColor),
      children: [
        _buildHeaderCell('Edad', maxLines: 2),
        _buildHeaderCell('Sistólica', maxLines: 2),
        _buildHeaderCell('Diastólica', maxLines: 2),
        _buildHeaderCell('Hipotensión sistólica', maxLines: 2),
      ],
    );
  }

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
        title: const Text('Presión Arterial'),
        backgroundColor: tableHeaderColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Table(
              border: TableBorder.all(
                color: const Color.fromARGB(255, 83, 232, 103),
                width: 1.0,
              ),
              columnWidths: const {
                0: FlexColumnWidth(1.8),
                1: FlexColumnWidth(1.0),
                2: FlexColumnWidth(1.1),
                3: FlexColumnWidth(1.4),
              },
              children: [
                _buildComplexHeader(),
                _buildDataRow(
                  '1-2 años (Niñ@ pequeñ@)',
                  '86-106',
                  '42-63',
                  'N/A',
                ),
                _buildDataRow(
                  '3-5 años (Preescolar)',
                  '89-112',
                  '46-72',
                  '<70 + (edad en años × 2)',
                ),
                _buildDataRow(
                  '6-9 años (Edad escolar)',
                  '97-115',
                  '57-76',
                  'N/A',
                ),
                _buildDataRow(
                  '10-11 años (Preadolescente)',
                  '102-120',
                  '61-80',
                  'N/A',
                ),

                _buildDataRow(
                  '12-15 años (Adolescente)',
                  '110-131',
                  '64-83',
                  '<90',
                ),
              ],
            ),

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
