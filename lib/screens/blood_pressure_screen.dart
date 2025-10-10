import 'package:flutter/material.dart';

class BloodPressureScreen extends StatelessWidget {
  const BloodPressureScreen({super.key});

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
        _buildHeaderCell('Sistólico', maxLines: 2),
        _buildHeaderCell('Diastólico', maxLines: 2),
        _buildHeaderCell('Hipotensión sistólica', maxLines: 2),
      ],
    );
  }

  // ignore: unused_element
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
              border: TableBorder.all(color: Colors.black, width: 1.0),
              columnWidths: const {
                0: FlexColumnWidth(1.5), // Age
                1: FlexColumnWidth(1.3), // Systolic
                2: FlexColumnWidth(1.3), // Diastolic
                3: FlexColumnWidth(2.0), // Systolic Hypotension
              },
              children: [
                _buildComplexHeader(),
                _buildDataRow('Birth (12 h) <1 kg', '39-59', '16-36', '<40-50'),
                _buildDataRow('Birth (12 h) 3 kg', '60-76', '31-45', '<50'),

                _buildDataRow('Neonate (96 h)', '67-84', '35-53', '<60'),
                _buildDataRow('Infant (1-12 mos)', '72-104', '37-56', '<70'),
              ],
            ),

            const SizedBox(height: 20),
            const Text(
              'Nota: Rangos Normales y de Hipotensión por Edad (mmHg)',
              style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
