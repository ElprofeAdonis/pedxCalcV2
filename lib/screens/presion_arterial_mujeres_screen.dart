import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class PresionArterialMujeresScreen extends StatelessWidget {
  const PresionArterialMujeresScreen({super.key});

  // Colores consistentes con tu app
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

  DataCell _buildDataCell(
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
    required Color? bg,
  }) {
    return DataRow(
      color: WidgetStateProperty.all(bg),
      cells: [
        _buildDataCell(edad, colW, bold: true),
        _buildDataCell(sDMin, colW),
        _buildDataCell(sDMed, colW),
        _buildDataCell(sDMax, colW),
        _buildDataCell(pamMin, colW),
        _buildDataCell(pamMed, colW),
        _buildDataCell(pamMax, colW),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.bpWomenTitle),
        backgroundColor: _primaryBlueDark,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===== Tabla en Card =====
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
                      final available = constraints.maxWidth;
                      const minTableWidth = 820.0;
                      final tableWidth = available < minTableWidth
                          ? minTableWidth
                          : available;

                      final colWidth = tableWidth / 7;

                      return Scrollbar(
                        thumbVisibility: true,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(minWidth: tableWidth),
                            child: DataTable(
                              headingRowHeight: 56,
                              dataRowMinHeight: 62,
                              dataRowMaxHeight: 78,
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
                                Colors.white.withAlpha((0.75 * 255).round()),
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
                                // Subheader (agrupación)
                                DataRow(
                                  color: WidgetStateProperty.all(
                                    Colors.black.withAlpha(
                                      (0.05 * 255).round(),
                                    ),
                                  ),
                                  cells: [
                                    _buildDataCell('', colWidth, bold: true),
                                    _buildDataCell(
                                      t.bpGroupSystolicDiastolic,
                                      colWidth,
                                      bold: true,
                                      color: Colors.black54,
                                    ),
                                    _buildDataCell('', colWidth, bold: true),
                                    _buildDataCell('', colWidth, bold: true),
                                    _buildDataCell(
                                      t.bpGroupMeanArterialPressure,
                                      colWidth,
                                      bold: true,
                                      color: Colors.black54,
                                    ),
                                    _buildDataCell('', colWidth, bold: true),
                                    _buildDataCell('', colWidth, bold: true),
                                  ],
                                ),

                                // Filas zebra (mujeres)
                                _row(
                                  colWidth,
                                  t.bpAgeLt7Days,
                                  '62.5 / 42.1',
                                  '71.8 / 50.5',
                                  '81.1 / 58.9',
                                  '48.9',
                                  '57.6',
                                  '66.3',
                                  bg: Colors.white.withAlpha(
                                    (0.75 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge8to30Days,
                                  '69.7 / 39.2',
                                  '81.7 / 50.7',
                                  '93.7 / 62.2',
                                  '49.4',
                                  '61.1',
                                  '72.7',
                                  bg: Colors.white.withAlpha(
                                    (0.45 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge1to5Months,
                                  '79.8 / 38.9',
                                  '92.0 / 49.5',
                                  '104.2 / 60.1',
                                  '52.5',
                                  '63.7',
                                  '74.8',
                                  bg: Colors.white.withAlpha(
                                    (0.75 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge6to11Months,
                                  '79.9 / 42.9',
                                  '94.5 / 52.5',
                                  '109.1 / 62.1',
                                  '55.2',
                                  '66.5',
                                  '77.8',
                                  bg: Colors.white.withAlpha(
                                    (0.45 * 255).round(),
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

              const SizedBox(height: 14),

              // ===== Fórmulas =====
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
