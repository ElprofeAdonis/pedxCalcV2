import 'package:flutter/material.dart';

class HeartRateScreenJ extends StatelessWidget {
  const HeartRateScreenJ({super.key});

  // Definimos estilos y colores
  static const Color tableHeaderColor = Color.fromARGB(255, 14, 113, 194);
  static const TextStyle headerTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: 14,
  );
  static const TextStyle cellTextStyle = TextStyle(fontSize: 14);

  TableRow _buildHeaderRow() {
    return TableRow(
      decoration: const BoxDecoration(color: tableHeaderColor),
      children: [
        _buildHeaderCell('Edad'),
        _buildHeaderCell('Despierto'),
        _buildHeaderCell('Dormido'),
      ],
    );
  }

  Widget _buildHeaderCell(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      alignment: Alignment.center,
      child: Text(text, style: headerTextStyle, textAlign: TextAlign.center),
    );
  }

  TableRow _buildDataRow(String age, String awake, String asleep) {
    return TableRow(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      children: [
        _buildDataCell(age, FontWeight.bold),
        _buildDataCell(awake),
        _buildDataCell(asleep),
      ],
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Frecuencia Cardíaca (Latidos/min)'),
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
                0: FlexColumnWidth(1.3),
                1: FlexColumnWidth(1.0),
                2: FlexColumnWidth(1.0),
              },
              children: [
                _buildHeaderRow(),
                _buildDataRow('1-2 años (Niñ@ pequeñ@)', '98-140', '80-120'),
                _buildDataRow('3-5 años (Preescolar)', '80-120', '65-100'),
                _buildDataRow('6-11 años (Edad escolar)', '75-118', '58-90'),
                _buildDataRow('12-15 años (Adolescente)', '60-100', '50-90'),
              ],
            ),

            const SizedBox(height: 20),
            const Text(
              'Nota: Los rangos varían si el paciente está despierto o dormido.',
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
