import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class PresionArterialMujeresScreenJ extends StatelessWidget {
  const PresionArterialMujeresScreenJ({super.key});

  // 🎨 Colores base de la app
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
        title: Text(t.bpWomenTitle), // ✅ i18n
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
                      const minTableWidth = 900.0;
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

                                // 🔁 Zebra rows (1–19 años)  ✅ datos se quedan igual
                                _row(
                                  colWidth,
                                  t.bpAge1y,
                                  '80.2 / 43.2',
                                  '93.0 / 52.4',
                                  '105.8 / 61.6',
                                  '55.5',
                                  '65.9',
                                  '76.3',
                                  bg: Colors.white.withAlpha(
                                    (0.75 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge2y,
                                  '83.7 / 48.2',
                                  '94.6 / 57.0',
                                  '105.5 / 65.8',
                                  '60.1',
                                  '69.5',
                                  '79.1',
                                  bg: Colors.white.withAlpha(
                                    (0.45 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge3y,
                                  '79.9 / 45.3',
                                  '92.6 / 55.1',
                                  '105.3 / 64.9',
                                  '56.8',
                                  '67.6',
                                  '78.4',
                                  bg: Colors.white.withAlpha(
                                    (0.75 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge4y,
                                  '77.6 / 45.3',
                                  '90.7 / 54.5',
                                  '103.8 / 63.7',
                                  '56.1',
                                  '66.6',
                                  '77.1',
                                  bg: Colors.white.withAlpha(
                                    (0.45 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge5y,
                                  '83.5 / 47.4',
                                  '94.1 / 57.3',
                                  '104.7 / 67.2',
                                  '59.4',
                                  '69.6',
                                  '79.7',
                                  bg: Colors.white.withAlpha(
                                    (0.75 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge6y,
                                  '84.9 / 49.1',
                                  '95.5 / 59.3',
                                  '106.1 / 69.5',
                                  '61.1',
                                  '71.4',
                                  '81.7',
                                  bg: Colors.white.withAlpha(
                                    (0.45 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge7y,
                                  '86.1 / 49.4',
                                  '96.4 / 59.7',
                                  '106.7 / 70.0',
                                  '61.6',
                                  '71.9',
                                  '82.2',
                                  bg: Colors.white.withAlpha(
                                    (0.75 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge8y,
                                  '88.0 / 50.9',
                                  '98.3 / 61.0',
                                  '108.6 / 71.1',
                                  '63.3',
                                  '73.4',
                                  '83.6',
                                  bg: Colors.white.withAlpha(
                                    (0.45 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge9y,
                                  '89.4 / 52.5',
                                  '100.2 / 62.7',
                                  '111.0 / 72.9',
                                  '64.8',
                                  '75.2',
                                  '85.6',
                                  bg: Colors.white.withAlpha(
                                    (0.75 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge10y,
                                  '90.9 / 53.2',
                                  '101.8 / 63.1',
                                  '112.7 / 73.0',
                                  '65.8',
                                  '76.1',
                                  '86.2',
                                  bg: Colors.white.withAlpha(
                                    (0.45 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge11y,
                                  '93.5 / 54.4',
                                  '104.6 / 64.5',
                                  '115.7 / 74.6',
                                  '67.4',
                                  '77.9',
                                  '88.3',
                                  bg: Colors.white.withAlpha(
                                    (0.75 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge12y,
                                  '96.0 / 57.4',
                                  '107.5 / 67.1',
                                  '119.0 / 76.8',
                                  '70.3',
                                  '80.6',
                                  '90.7',
                                  bg: Colors.white.withAlpha(
                                    (0.45 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge13y,
                                  '95.1 / 56.7',
                                  '107.2 / 67.4',
                                  '119.3 / 78.1',
                                  '69.5',
                                  '80.7',
                                  '91.8',
                                  bg: Colors.white.withAlpha(
                                    (0.75 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge14y,
                                  '95.1 / 56.7',
                                  '107.2 / 67.4',
                                  '119.3 / 78.1',
                                  '69.5',
                                  '80.7',
                                  '91.8',
                                  bg: Colors.white.withAlpha(
                                    (0.45 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge15y,
                                  '96.0 / 57.0',
                                  '107.8 / 67.6',
                                  '119.6 / 78.2',
                                  '70.1',
                                  '81.1',
                                  '92.1',
                                  bg: Colors.white.withAlpha(
                                    (0.75 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge16y,
                                  '96.1 / 56.0',
                                  '107.5 / 66.2',
                                  '118.9 / 76.4',
                                  '69.4',
                                  '80.1',
                                  '90.6',
                                  bg: Colors.white.withAlpha(
                                    (0.45 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge17y,
                                  '97.9 / 56.3',
                                  '109.1 / 67.0',
                                  '120.3 / 77.7',
                                  '70.2',
                                  '81.1',
                                  '91.9',
                                  bg: Colors.white.withAlpha(
                                    (0.75 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge18y,
                                  '98.8 / 57.5',
                                  '109.9 / 67.6',
                                  '121.0 / 77.7',
                                  '71.3',
                                  '81.7',
                                  '92.1',
                                  bg: Colors.white.withAlpha(
                                    (0.45 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge19y,
                                  '99.1 / 57.0',
                                  '110.0 / 67.4',
                                  '120.9 / 77.8',
                                  '71.1',
                                  '81.6',
                                  '92.2',
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
                t.bpFormulasTitle, // ✅ i18n
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
