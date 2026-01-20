import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class PresionArterialHombresScreenJ extends StatelessWidget {
  const PresionArterialHombresScreenJ({super.key});

  // 🎨 Colores base de tu app
  static const Color _primaryBlueDark = Color.fromARGB(255, 14, 113, 194);
  static const Color _highlightGreen = Color.fromARGB(255, 83, 232, 103);

  static const TextStyle _cellTextStyle = TextStyle(fontSize: 12.5);
  static const TextStyle _cellBoldTextStyle = TextStyle(
    fontSize: 12.5,
    fontWeight: FontWeight.w800,
  );

  DataColumn _buildDataColumn(String label, double colWidth) {
    return DataColumn(
      label: SizedBox(
        width: colWidth,
        child: Text(
          label,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            color: _primaryBlueDark,
            fontSize: 13.5,
          ),
        ),
      ),
    );
  }

  DataCell _cell(
    String text,
    double colWidth, {
    bool bold = false,
    Color? color,
  }) {
    return DataCell(
      SizedBox(
        width: colWidth,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: (bold ? _cellBoldTextStyle : _cellTextStyle).copyWith(
            color: color,
          ),
        ),
      ),
    );
  }

  DataRow _row(
    double colW,
    String edad,
    String sDMin,
    String sDMed,
    String sDMax,
    String pamMin,
    String pamMed,
    String pamMax, {
    required Color bg,
  }) {
    return DataRow(
      color: WidgetStateProperty.all(bg),
      cells: [
        _cell(edad, colW, bold: true),
        _cell(sDMin, colW),
        _cell(sDMed, colW),
        _cell(sDMax, colW),
        _cell(pamMin, colW),
        _cell(pamMed, colW),
        _cell(pamMax, colW),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.bpMenTitle),
        backgroundColor: _primaryBlueDark,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // =======================
              // 📊 TABLA EN CARD
              // =======================
              Card(
                elevation: 1,
                color: const Color(0xFFF6F3FB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final minTableWidth = 900.0;
                      final tableWidth = constraints.maxWidth < minTableWidth
                          ? minTableWidth
                          : constraints.maxWidth;

                      final colWidth = tableWidth / 7;

                      return Scrollbar(
                        thumbVisibility: true,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(minWidth: tableWidth),
                            child: DataTable(
                              headingRowHeight: 56,
                              dataRowMinHeight: 60,
                              dataRowMaxHeight: 76,
                              columnSpacing: 0,
                              horizontalMargin: 0,
                              border: TableBorder.all(
                                color: _highlightGreen.withAlpha(
                                  (0.55 * 255).round(),
                                ),
                                width: 1,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              headingRowColor: WidgetStateProperty.all(
                                Colors.white.withAlpha((0.8 * 255).round()),
                              ),
                              columns: [
                                _buildDataColumn(
                                  t.bpColAge.toUpperCase(),
                                  colWidth,
                                ),
                                _buildDataColumn(t.bpColMin, colWidth),
                                _buildDataColumn(t.bpColMean, colWidth),
                                _buildDataColumn(t.bpColMax, colWidth),
                                _buildDataColumn(t.bpColMin, colWidth),
                                _buildDataColumn(t.bpColMean, colWidth),
                                _buildDataColumn(t.bpColMax, colWidth),
                              ],
                              rows: [
                                // 🔹 Subheader
                                DataRow(
                                  color: WidgetStateProperty.all(
                                    Colors.black.withAlpha(
                                      (0.05 * 255).round(),
                                    ),
                                  ),
                                  cells: [
                                    _cell('', colWidth, bold: true),
                                    _cell(
                                      t.bpGroupSystolicDiastolic,
                                      colWidth,
                                      bold: true,
                                      color: Colors.black54,
                                    ),
                                    _cell('', colWidth),
                                    _cell('', colWidth),
                                    _cell(
                                      t.bpGroupMeanArterialPressure,
                                      colWidth,
                                      bold: true,
                                      color: Colors.black54,
                                    ),
                                    _cell('', colWidth),
                                    _cell('', colWidth),
                                  ],
                                ),

                                // 🔁 Zebra rows (1–19 años)
                                _row(
                                  colWidth,
                                  t.bpAge1Year,
                                  '81.4 / 44.0',
                                  '93.6 / 53.0',
                                  '105.8 / 62.0',
                                  '56.5',
                                  '66.5',
                                  '76.6',
                                  bg: Colors.white.withAlpha(
                                    (0.75 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge2Years,
                                  '84.2 / 47.9',
                                  '95.0 / 56.5',
                                  '105.8 / 65.1',
                                  '60.1',
                                  '69.3',
                                  '78.7',
                                  bg: Colors.white.withAlpha(
                                    (0.45 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge3Years,
                                  '80.8 / 44.9',
                                  '93.5 / 54.3',
                                  '106.2 / 63.7',
                                  '56.9',
                                  '67.4',
                                  '77.9',
                                  bg: Colors.white.withAlpha(
                                    (0.75 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge4Years,
                                  '78.7 / 44.5',
                                  '90.8 / 53.9',
                                  '102.9 / 63.3',
                                  '55.9',
                                  '66.2',
                                  '76.5',
                                  bg: Colors.white.withAlpha(
                                    (0.45 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge5Years,
                                  '83.4 / 47.7',
                                  '94.3 / 57.4',
                                  '105.2 / 67.1',
                                  '59.6',
                                  '69.7',
                                  '79.8',
                                  bg: Colors.white.withAlpha(
                                    (0.75 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge6Years,
                                  '86.1 / 48.5',
                                  '96.2 / 58.5',
                                  '106.3 / 68.5',
                                  '61.1',
                                  '71.1',
                                  '81.1',
                                  bg: Colors.white.withAlpha(
                                    (0.45 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge7Years,
                                  '87.4 / 50.5',
                                  '97.8 / 60.7',
                                  '108.2 / 70.9',
                                  '62.8',
                                  '73.1',
                                  '83.3',
                                  bg: Colors.white.withAlpha(
                                    (0.75 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge8Years,
                                  '88.7 / 51.6',
                                  '98.7 / 61.6',
                                  '108.7 / 71.6',
                                  '64.1',
                                  '74.1',
                                  '84.1',
                                  bg: Colors.white.withAlpha(
                                    (0.45 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge9Years,
                                  '90.6 / 52.6',
                                  '100.7 / 62.7',
                                  '110.1 / 72.6',
                                  '65.3',
                                  '75.3',
                                  '85.1',
                                  bg: Colors.white.withAlpha(
                                    (0.75 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge10Years,
                                  '91.4 / 54.1',
                                  '101.9 / 63.6',
                                  '112.4 / 73.1',
                                  '66.5',
                                  '76.4',
                                  '86.2',
                                  bg: Colors.white.withAlpha(
                                    (0.45 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge11Years,
                                  '92.4 / 53.6',
                                  '103.2 / 63.4',
                                  '114.0 / 73.2',
                                  '66.5',
                                  '76.7',
                                  '86.8',
                                  bg: Colors.white.withAlpha(
                                    (0.75 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge12Years,
                                  '95.0 / 55.8',
                                  '105.8 / 65.6',
                                  '116.6 / 75.4',
                                  '68.9',
                                  '79.1',
                                  '88.9',
                                  bg: Colors.white.withAlpha(
                                    (0.45 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge13Years,
                                  '95.2 / 54.7',
                                  '107.8 / 65.5',
                                  '120.4 / 76.3',
                                  '68.2',
                                  '79.6',
                                  '91.1',
                                  bg: Colors.white.withAlpha(
                                    (0.75 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge14Years,
                                  '95.2 / 54.7',
                                  '107.8 / 65.5',
                                  '120.4 / 76.3',
                                  '68.2',
                                  '79.6',
                                  '91.1',
                                  bg: Colors.white.withAlpha(
                                    (0.45 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge15Years,
                                  '97.2 / 55.3',
                                  '110.1 / 66.2',
                                  '123.0 / 77.1',
                                  '69.3',
                                  '80.8',
                                  '92.4',
                                  bg: Colors.white.withAlpha(
                                    (0.75 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge16Years,
                                  '100.5 / 55.2',
                                  '113.0 / 66.2',
                                  '125.5 / 77.2',
                                  '70.3',
                                  '81.8',
                                  '93.3',
                                  bg: Colors.white.withAlpha(
                                    (0.45 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge17Years,
                                  '102.4 / 56.3',
                                  '114.7 / 67.4',
                                  '127.0 / 78.5',
                                  '71.7',
                                  '83.2',
                                  '94.7',
                                  bg: Colors.white.withAlpha(
                                    (0.75 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge18Years,
                                  '105.4 / 59.8',
                                  '117.6 / 70.2',
                                  '129.8 / 80.6',
                                  '75.1',
                                  '86.1',
                                  '97.1',
                                  bg: Colors.white.withAlpha(
                                    (0.45 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge19Years,
                                  '106.3 / 61.8',
                                  '118.7 / 71.9',
                                  '131.1 / 82.0',
                                  '76.6',
                                  '87.5',
                                  '98.4',
                                  bg: Colors.white.withAlpha(
                                    (0.75 * 255).round(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // =======================
              // 📐 FÓRMULAS
              // =======================
              Text(
                t.bpFormulasTitle,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                  color: scheme.onSurface.withAlpha((0.85 * 255).round()),
                ),
              ),
              const SizedBox(height: 8),
              Text(t.bpFormulaLine1, style: _cellTextStyle),
              const SizedBox(height: 4),
              Text(
                t.bpFormulaLine2,
                style: _cellTextStyle.copyWith(color: scheme.onSurface),
              ),
              const SizedBox(height: 4),
              Text(
                t.bpFormulaLine3,
                style: _cellTextStyle.copyWith(color: scheme.onSurface),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
