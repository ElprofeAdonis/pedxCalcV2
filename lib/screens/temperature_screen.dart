import 'package:flutter/material.dart';

class TemperatureScreen extends StatelessWidget {
  const TemperatureScreen({super.key});

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
      children: [_buildHeaderCell('Método'), _buildHeaderCell('Normal')],
    );
  }

  Widget _buildHeaderCell(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      alignment: Alignment.center,
      child: Text(text, style: headerTextStyle, textAlign: TextAlign.center),
    );
  }

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
        title: const Text('Temperatura (°C) (Por método)'),
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
                0: FlexColumnWidth(1.5),
                1: FlexColumnWidth(1.0),
              },
              children: [
                _buildHeaderRow(),
                _buildDataRow('Rectal', '36.6-38.0'),
                _buildDataRow('Tímpano', '35.8-38.0'),
                _buildDataRow('Oral', '35.5-37.5'),
                _buildDataRow('Axilar', '36.5-37.5'),
              ],
            ),

            const SizedBox(height: 20),

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
                    text: 'Tamizaje: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: 'axilar, temporal, tímpano (↓ precisión)\n'),
                  TextSpan(
                    text: 'Definitiva: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:
                        'rectal & oral (↑ reflejo de la temperatura central)\n',
                  ),
                  TextSpan(
                    text:
                        'Referencia: CPS Declaración de posición sobre la medición de la temperatura en pediatría (2015)',
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
